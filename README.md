# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo dnf git
```

### Stow

```
sudo dnf stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/devldm/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## Workflow

- Copy file / folder to dotfiles from .config (using `cp` command) 
- run `stow .`

## Potential issues
```
WARNING! stowing . would cause conflicts: * existing target is neither a link nor a directory:
```
This errors occurs if the files already exists in the place where we are trying to create the symlink. To avoid this use (when in the dotfiles repo)
```bash
stow --adopt .
```
