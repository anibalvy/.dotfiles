# My dotfiles

personal script to install new workspaces tools.


## Requirements
- stow installed

## Installation 

1. It is tested to run from Home directory under .dotfiles folder, so clone from it

```sh
cd
git clone https://github.com/anibalvy/.dotfiles.git
```

1. run install script

```sh
.dotfiles/bin/./dotfiles.sh
```

or manually

```sh
stow <folder>
```

## managing changes

When configurations changes it is possible to eliminate folders that are stow or reload them:

Delete config:
```sh
stow -D <folder>
```

Reload config:
```sh
stow -R <folder>
```

Choose anothe destination folder:
```sh
stow -t <destination_folder> <folder>
```

more options, see:

```sh
man stow
```

## TODO

1. check installation script:
- deprecated tools
- add package installations
- check delete of files before stow if is still needed








