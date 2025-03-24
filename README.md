# pacman_mirrorsd

Simple "daemon" for periodically refreshing pacman mirrors via Cron.

## Installation

The installation process is fairly simple:
```sh
$ cp pacman_mirrorsd.sh /usr/bin/pacman_mirrorsd
$ chmod +x /usr/bin/pacman_mirrorsd
```
Make sure you have root access to install it.

That's it!
Remember to set up a Cron job for the script.

## This is not a real daemon

Indeed. The whole idea of the script was to be run by Cron at a desired time interval, rather than in background on its own.
This is weird, yes, but this was the way I found to keep it from becoming a complex monstrosity.

The good thing is that we have finer control over how frequently it runs.

## Contributions

Feel free to submit PRs or open issues for whatever you found or want. I would be happy to take a look!

## License

[![GPLv3 License](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.html)

This project is licensed under the **GNU General Public License v3.0**.
You may freely use, modify, and distribute this software under the terms of the GPL-3.0 license.

See the [LICENSE](./LICENSE) file for more details.
