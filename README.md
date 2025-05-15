# Automated Environment Setup

## Overview

I wanted to automate my environment setup to make configuring a new machine fast, reproducible, and enjoyable. 

This project contains my setup and a Docker-based sandbox for testing everything safely. 


## Features

- **Dotfile Management with GNU Stow:**  
  All configuration files are organized in a way that makes version control and symlink management seamless and portable.

- **Automated Application & Package Installation:**  
  Install all your favorite apps, CLI tools, and fonts using Homebrew, with package lists stored in easy-to-edit text files.

- **Scripted System Preferences:**  
  Mac-specific settings can be applied automatically via shell scripts, ensuring your environment always feels just right.

- **Docker Sandbox:**  
  Test your setup scripts in a clean, disposable Ubuntu environment before running them on your real machine.

## Structure

- `setup.sh` – Main entry point, orchestrates the setup process.
- `brew-install.sh` – Installs Homebrew (if needed) and all apps/packages/fonts from list files.
- `applications.txt`, `packages.txt`, `fonts.txt` – Editable lists of what to install.
- `mac-settings.sh` – Script for Mac-specific system tweaks.
- `Dockerfile` – For building a containerized test environment.
- `dotfiles/` – Subdirectories for each set of configuration files (e.g., `zsh/`, `git/`).

## Create your own private fork

Create a new repo (let's call it `mydotfile-setup`) via the Github UI. Then:
```sh
git clone --bare git@github.com:megamegax/dotfile-setup.git
cd public-repo.git
git push --mirror git@github.com:yourname/mydotfile-setup.git
cd ..
rm -rf public-repo.git
```
Clone the private repo so you can work on it:
```sh
git clone git@github.com:yourname/mydotfile-setup.git
cd mydotfile-setup
make some changes
git commit
git push origin main
```
To pull new hotness from the public repo:
```sh
cd private-repo
git remote add public git@github.com:megamegax/dotfile-setup.git
git pull public main # Creates a merge commit
git push origin main
```
Awesome, your private repo now has the latest code from the public repo plus your changes.

## Create your own private fork

### 1.  clone this repository
### 2.  run setup.sh