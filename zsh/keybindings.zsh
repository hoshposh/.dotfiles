# Plugin history-substring-search binds plain ↑/↓; keep those on Ctrl+↑/↓ only (after atuin).
if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" up-line-or-history
  bindkey -M emacs "$terminfo[kcud1]" down-line-or-history
  bindkey -M viins "$terminfo[kcuu1]" up-line-or-history
  bindkey -M viins "$terminfo[kcud1]" down-line-or-history
fi
# Ctrl+↑/↓ (xterm / iTerm2). Not ^[[5A/B — those are cursor-up/down-n-lines (CUU/CUD), not keys.
for _m in emacs viins; do
  bindkey -M "$_m" '^[[1;5A' history-substring-search-up
  bindkey -M "$_m" '^[[1;5B' history-substring-search-down
done
unset _m
