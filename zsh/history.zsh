# History options
unsetopt HIST_IGNORE_ALL_DUPS # Keep older duplicate entries for context.
unsetopt HIST_SAVE_NO_DUPS    # Keep older duplicate entries when saving to disk.
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again (prevents consecutive dups).
setopt HIST_FIND_NO_DUPS    # Do not display a line previously found (skips dups while scrolling).
