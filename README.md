## Andecy64's Dotfiles

## Software

|Slot               |Application      |Configuration|GUI   |Automation|Terminal|
|-------------------|-----------------|-------------|------|----------|--------|
|Window Manager     |Xmonad           |Dotfiles     |Xmonad|✗         |✗       |
|Password Manager   |Gopass           |✗            |rofi  |✗         |✓       |
|Presentations      |Marp             |✗            |✗     |✗         |✓       |
|Document Viewer    |zathura/calibre  |✗            |✓     |✗         |✗       |
|Web Browser        |Qutebrowser      |✗            |✓     |✗         |✗       |
|Console Web Browser|w3m              |✗            |✗     |✗         |✓       |
|Shell              |Alacritty        |✗            |✗     |✗         |✓       |
|IRC                |weechat          |Dotfiles     |✗     |✗         |✓       |
|Console Mastodon   |toot             |             |      |          |        |
|Whatsapp           |Whatsapp-on-linux|             |      |          |        |
|Telegram           |Telegram-desktop |             |      |          |        |
|Office Suit        |Libreoffice      |             |      |          |        |
|Calendar           |khal             |             |      |          |        |
|Contacts           |khard            |             |      |          |        |
|Cal/Card DAV       |Radicale         |             |      |          |        |

#### Planned changes:
- [ ] All configurations should be in one branch.
- [ ] All vim plugins/support will be removed.
- [ ] Moving to neovim, should make a list of requirements

#### Discarded plans:

~~Test different branches for portability~~ <br/>
~~Seperate i3, urxvt-unicode to submodules for portability.~~ <br/>
~~set up i3blocks scripts.~~ <br/>
~~Configure tmux and build a script for autostarting vim as ide.~~ <br/>


# From home-lab/software

This document describes which software will be installed and in use in my system.  
There are several 'Application slots' that will be used to make sure the software I'm using has no overlapping functionality.  

The slots are as follows:
* Window Manager
* Password Manager
* Web Browser
* Document viewing and editing
* IDE
* Productivity
* Communication
* Documentation
* Security

## Email server

All relevant details should be here


## Calendar

To make calendar work I should use vdirsyncer to constantly sync contacts/calendars.  
contact/calendar directories and vsyncdir/khal/khard should be well known and documented.  

## System utilities

### Application Launcher

rofi

### Window Manager

Xmonad

To install xmonad I made sure dbus flags are enabled
In addition, I installed polybar and [xmonad-log](https://github.com/xintron/xmonad-log)  
For polybar I found out that I need xdo

### Password Manager

gopass / rofi extension / ~~gopass-ui~~

### Web Browser

Qutebrowser
w3m

### Presentations

Marp && Zathura

### PDF Reader

Zathura

### Book Reader

Calibre

### Shell

Alacritty

### Social Media
***IRC***: weechat  
***Mastodon***: toot  
***Whatsapp***: whatsapp-on-linux  
***Singal***: Signal-Desktop  
***Telegram***: Telegram-Deskop  

### Office Tools
Libreoffice

### Productivity

***Calendar***: khal  
***Contacts***: khard  

***Remote Sync***: Radicale
> I followed this link  
> 
> https://www.mehoffmann.eu/blog/posts/2018/05/22/setting-up-radicale-a-lightweight-contact-and-calendar-server/  
> 
> The only thing I had to do to make it work is to include the full chain instead of just the cert  
> 
> 
> More documentation is required

***Local Sync***: vdirsyncer  
***Email***: Thunderbird

### Programming Languages
haskell
python
ada
cpp
c
rust

###  Distro

Gentoo

### Status Bar

polybar

### Color Theme

Dracula

### Data Sharing

Syncthing

### Encryption

***Toolchain***: GnuPG
***UI***: GPA
**Pin Entry**: QT


# From 
