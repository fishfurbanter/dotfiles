## Fishfur's dotfile private collection!

#### Requirements
The dotfiles this repository contains are seperated by branches
for different levels of requirements and portability.


##### master
master branch is the current configuration im using in my own system
and will probably require some or all of the packages listed in
```
.pkglist/pkglist.aur
.pkglist/pkglist.std
```
package names were queried and filtered from pacman.

##### pre-split
this branch contains older dotfiles. same reqs as master

##### system-agnostic
the purpose of this repository is to be as portable as possible
and it will probably work on any linux system with vim, tmux, bash and urxvt.

#### Planned changes:
- [ ] Test different branches for portability
- [ ] Find a way to deal with nologin shells
- [x] fix vim plugin submodule weirdness

#### Discarded plans:

~~Seperate i3, urxvt-unicode to submodules for portability.~~
~~set up i3blocks scripts.~~
~~Configure tmux and build a script for autostarting vim as ide.~~
