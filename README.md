dotfiles
========

Directory   | Description
----------- | -----------------------------------------------------------------
**dunst**   | notification daemon config
**firefox** | firefox web browser and vimperator config
**fonts**   | fonts for UI
**git**     | git global config
**gtk**     | graphical UI config
**i3**      | i3wm (gaps-next) and lemonbar config + additional shell scripts
**mpd**     | music player daemon config
**ncmpcpp** | ncurses mpc++ config
**vim**     | vim config with Vundle
**weechat** | irc client config
**x11**     | xorg config with urxvt and rofi
**xdg**     | freedesktop config for user dirs
**zathura** | pdf viewer config
**zsh**     | z shell config


## Description

This repository contains my personal configuration files for various GNU/Linux applications. All of these files are organized into separate directories for easier management and modularity.

All of the graphical interfaces are themed with [gruvbox](https://github.com/morhetz/gruvbox) colors to perserve consistency and keep similar user experience among the whole system.


## Managing

For managing dotfiles I use [GNU Stow](http://www.gnu.org/software/stow/), a *"symlink manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place"*. It makes sharing these files among many users, systems and machines ridiculously easy when used with Git.

To install GNU Stow you can use your system's default package manager, for example:

  - `sudo pacman -S stow`
  - `sudo apt-get install stow`
  - `sudo dnf install stow`
  - `brew install stow`

or clone it from [source](https://savannah.gnu.org/git/?group=stow) and [build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.


## Using GNU Stow

By default `stow` command creates symlinks to files in the parent directory relatively to current working directory, so if you are currently in `~/dofiles` directory, it will create symlinks relatively to `~` (home) directory. If you keep dotfiles in another directory (deeper in filesystem), as do I, you will have to use `-t ~` parameter to make the configuration files appear in your home directory.

To install any of modules, you execute `stow` command with folder name as the argument. For example, to install my i3 config use the command:

`stow i3 -t ~`

this will create symlink files in `~/.config/i3` directory and few other places.

**NOTE** GNU Stow can only create a symlink if a target file does not already exist. If default file was created upon program installation you must delete it before installing a new one with GNU Stow. This does not apply to directories.


## Installation

1. Clone this repository: `git clone https://github.com/sebpot/dotfiles.git`
2. Enter the dotfiles directory: `cd dotfiles`
3. Install needed modules: `stow fonts -t ~; stow i3 -t ~; stow vim -t ~`

### dunst

Requirements:

  - **dunst**
  - **artwiz-fonts**

### firefox

Requirements:

  - **firefox**
  - **vimperator** firefox addon
  - **artwiz-fonts**
  - **Roboto Mono for Powerline** font

### git

Requirements:

  - **git**

### gtk

Requirements:

  - **gtk-3.0**
  - **gtk-2.0**
  - **Cantarell* font

### i3

Requirements:

  - **[i3-gaps-next](https://github.com/Airblader/i3)**
  - **artwiz-fonts** (for interface font)
  - **udevil** (for mounting devices automatically)
  - **feh** (for wallpaper)
  - **firefox** (web browser)
  - **i3lock** (for lockscreen)
  - **imagemagick** (for generating lockscreen background)
  - **jq** (for i3 workspaces in lemonbar)
  - **lemonbar** (for status bar)
  - **mpc** (for music info in lemonbar)
  - **numlockx** (for locking numpad on startup)
  - **[nm-applet](https://github.com/sebpot/nm-applet)** (for context menus on signals)
  - **nmcli** (for network info in lemonbar)
  - **pulseaudio** (for sound handling and info in lemonbar)
  - **python** 3.2+ (for HTTP server)
  - **redshift** (for screen color temperature adjustment)
  - **rescuetime** (for productivity tracking)
  - **rofi** (for run and power menus)
  - **scrot** (for taking screenshots)
  - **thunar** (for graphical file management)
  - **unclutter** (for hiding mouse pointer when idle)
  - **urxvt** (for terminal emulator)
  - **xautolock** (for screen auto locking)
  - **xbacklight** (for screen brightness control)
  - **xinput** (for enabling/disabling touchpad)
  - **xtitle** (for window title in lemonbar)
  - **zsh** (for scripts)

You can get rid of many of these requirements by editing `Appliactions` and `Startup` sections of i3 config (`i3/.config/i3/config`).

Additionaly, there is battery power level notification script in `i3/.local/bin/notify-battery.sh`. To make it work, you should add following line to your crontab (using command `crantab -e`):

`*/5 * * * * DISPLAY=:0 /home/YOUR_USERNAME/.local/bin/notify-battery.sh`

### mpd

Requirements:

  - **mpd**

### ncmpcpp

Requirements:

  - **ncmpcpp**
  - **mpd**

### vim

Requirements:

  - **vim**

There are some plugins in `.vimrc` file, which are managed with Vundle. Since Vundle plugin is included in dotfiles, you should enter following command in vim to make the rest of plugins work:

`:PluginInstall`

and wait until it download and install all of the bundled plugins.

### weechat

Requirements:

  - **weechat**

This is simply custom weechat theme with configured connection for freenode and rizon chat servers.

### x11

Requirements:

  - **xorg**
  - **rofi**
  - **rxvt-unicode*
  - **Roboto Mono for Powerline** font

### xdg

Requirements:

  - **xdg-user-dirs**

### zathura

Requirements:

  - **zathura**
  - **zathura-pdf-poppler**
  - **artwiz-fonts**

### zsh

Requirements:

  - **zsh**
  - **git**
  - **Oracle Java 8**
  - **pkgfile**
  - **python** with **virtualenvwrapper**
  - **ruby**
  - **vi**, **vim**
  - **xdg-user-dirs**
  - **xorg**
  - **zsh-syntax-highlighting**


## Previews

![](https://raw.githubusercontent.com/sebpot/dotfiles/master/previews/preview-01.png)

  - vim
  - screenfetch
  - mpd
