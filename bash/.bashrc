# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Remove the default 'c' alias for OpenCode
unalias c 2>/dev/null

# Define your C compilation function
compile_c() {
    local filename="${1%.*}"
    gcc -Wall -Wextra -g -o "$filename" "$1" -lcs50
    if [ $? -eq 0 ]; then
        "./$filename"
    fi
}

# Create new aliases
alias gc='compile_c'
alias c='clear'
alias lg='lazygit'
alias obsync='~/.local/bin/obsidian-backup.sh'

# # Download a single YouTube Music song with square album art
# alias ytsong='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ThumbnailsConvertor+FFmpeg_o:-vf crop=in_h:in_h" -o "~/Music/%(artist)s - %(title)s.%(ext)s"'
# # Download & sync a YouTube Music playlist with square album art
# alias ytplaylist='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ThumbnailsConvertor+FFmpeg_o:-vf crop=in_h:in_h" --download-archive "~/Music/yt-archive.txt" -o "~/Music/%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'
# # Download a YouTube Music Album with square album art
# alias ytalbum='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg --ppa "ThumbnailsConvertor+FFmpeg_o:-vf crop=in_h:in_h" -o "~/Music/%(album_artist,artist)s/%(album,playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'

# Download a single YouTube Music song
alias ytsong='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg -o "~/Music/%(artist)s - %(title)s.%(ext)s"'

# Download & sync a YouTube Music playlist
alias ytplaylist='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg --download-archive "~/Music/yt-archive.txt" -o "~/Music/%(playlist)s/%(playlist_index)02d - %(title)s.%(ext)s"'

# Download a YouTube Music Album
alias ytalbum='yt-dlp -x --audio-format mp3 --audio-quality 0 --embed-metadata --embed-thumbnail --convert-thumbnails jpg --replace-in-metadata "playlist_uploader" " - Topic$" "" -o "~/Music/%(playlist_uploader|channel)s/%(playlist_title|album)s/%(playlist_index)02d - %(title)s.%(ext)s"'

# Yazi quit in the current dir
function y() {
	local tmp cwd
	tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd" || return
	fi
	rm -f -- "$tmp"
}
