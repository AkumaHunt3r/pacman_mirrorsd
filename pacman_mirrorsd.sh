#!/usr/bin/env bash
# Simple "daemon" which periodically rebuilds pacman's mirrorlist.
#
# Copyright (C) AkumaHunt3r. All Rights Reserved.
# https://github.com/AkumaHunt3r/pacman_mirrorsd

# Ensure we have a copy of the original mirrorlist.
[ ! -f /etc/pacman.d/mirrorlist.bak ] && cp -f /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# File used to output log messages.
LOG_FILE=/var/log/pacman_mirrorsd.log

# Temporary file used for rebuilding.
REBUILD_TMP=/tmp/pacman_mirrorsd.tmp

# Indicate we have started.
echo "Mirror rebuilding started @ $(date)" >> $LOG_FILE

# Build the mirrorlist.
reflector > $REBUILD_TMP

# In order to find the best candidates, we select up-to 10 mirrors.
# We then proceed to test each of them for 10 minutes, in parallel.
rankmirrors -n 10 -m 10 -p $REBUILD_TMP > /etc/pacman.d/mirrorlist

# Indicate we have finished.
echo "Mirror rebuilding finished @ $(date)" >> $LOG_FILE

# Cleanup the temporary file.
rm -f $REBUILD_TMP
