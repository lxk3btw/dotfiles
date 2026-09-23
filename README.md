# My Dotfiles

This repository contains my dotfiles for Omarchy 4. It uses Stow to manage symlinks to the home directory, keeping system configs cleanly linked to source control.

## Prerequisites

Ensure you have `git` and `stow` installed on your system. On Arch-based systems like Omarchy, run:

```
sudo pacman -S git stow

```

## 1. GitHub SSH Key Setup

To securely clone and push to this repository without entering a password every time, set up an SSH key.

**Generate a new SSH key:**
Replace the email with your GitHub account email. Press Enter to accept the default file location.

```
ssh-keygen -t ed25519 -C "lukesz2006@gmail.com"

```

**Start the SSH agent and add your key:**

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

```

**Add the key to GitHub:**
Run the following command and copy the entire output string:

```
cat ~/.ssh/id_ed25519.pub

```

Navigate to **GitHub Settings > SSH and GPG keys > New SSH key** on the web, paste your copied string, and save.

## 2. Installation & GNU Stow Setup

**Clone the repository:**
Clone the repo into a hidden `.dotfiles` folder in your home directory using your new SSH connection:

```
git clone git@github.com:lxk3btw/dotfiles.git ~/dotfiles

```

**CRITICAL: Remove existing folders before Stowing**
GNU Stow will refuse to overwrite existing files or directories. Before you stow a configuration, you **must** delete or back up the default directory that your system created.

For example, to prep your system, remove the default folders:

```
rm -rf ~/.config/ghostty
rm -rf ~/.config/hypr
rm -rf ~/.config/tmux
# Repeat for any other configs you are about to stow

```

**Apply configurations using Stow:**
Navigate into the dotfiles directory. GNU Stow works by taking the contents of a target folder (like `ghostty`) and creating symlinks for them in the parent directory (which, because we are in `~/.dotfiles`, resolves to your home directory `~/`).

Instead of typing the command one by one, you can chain all your directories into a single, easy command. Run this to deploy everything at once:

```
cd ~/.dotfiles
stow bash ghostty hyprland mpd nvim tmux zathura hyprland

```

*(Note: Add or remove folder names from the command above based on exactly what is currently in your repository).*

## 3. Post-Installation Steps

After stowing your dotfiles, you need to initialize a few specific services and plugins for everything to work seamlessly.

**Tmux Plugin Manager (TPM)**
To get your tmux themes and plugins working, you need to install TPM into your config directory and trigger a plugin install.

1. Clone the TPM repository:

   ```
   git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
   
   ```

2. Open a new tmux session:

   ```
   tmux
   
   ```

3. Inside tmux, press your prefix key (usually `Ctrl+Space` or `Ctrl+B`), followed by `I` (capital i) to fetch all plugins.

**Music Player Daemon (MPD)**
To ensure your music daemon starts automatically in the background:

1. Enable the user service so it boots with your system:

   ```
   systemctl --user enable --now mpd.service
   
   ```

2. Open your music player interface (like `rmpc`) to verify it connected to the daemon successfully.

**For Zathura**
Install dependecies for Zathura to work properly with PDF files:

   ```
   sudo pacman -S zathura-pdf-mupdf
   
   ```
