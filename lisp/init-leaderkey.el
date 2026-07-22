;;; init-leaderkey.el --- init-leaderkey -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; SPC+
(keybind/leader
  "SPC" '(execute-extended-command :which-key "M-x")
  "q" 'keyboard-escape-quit :which-key "quit")

;; Applicaions
(keybind/leader
  "a" '(:ignore t :which-key "Applicaions")
  "au" '(vundo :which-key "undo-tree")
  "ap" '(list-processes :which-key "list-processes")
  "as" '(alacritty-shell-command :which-key "alacritty shell"))

;; Buffers
(keybind/leader
  "b"  '(:ignore t :which-key "Buffers")
  "bb" '(consult-buffer :which-key "List Buffers")
  "bd" '(kill-current-buffer :which-key "Kill Buffer")
  "TAB" '(win/alternate-buffer :which-key "Last Buffer")
  "bm" '(win/switch-to-messages-buffer :which-key "Messages")
  "bw" '(read-only-mode :which-key "read-only")
  )

;; Code & Diagnostics
(keybind/leader
  "c" '(:ignore t :which-key "Code")
  "cd" '(flymake-show-buffer-diagnostics :which-key "buffer diagnostics")
  "cD" '(flymake-show-project-diagnostics :which-key "project diagnostics")
  "cn" '(flymake-goto-next-error :which-key "next error")
  "cp" '(flymake-goto-prev-error :which-key "previous error"))

;; Files
(keybind/leader
  "f"  '(:ignore t :which-key "Files")
  "ff" '(find-file :which-key "Find file")
  "fr" '(recentf :which-key "Recent files")
  "fs" '(save-buffer :which-key "Save buffer")
  "fS" '(write-file :which-key "Save as")
  "fd" '(dired :which-key "Dired")
  "fl" '(consult-locate :which-key "locate"))

;; Jump
(keybind/leader
  "j" '(:ignore t :which-key "Jump")
  "jj" '(evil-avy-goto-char-timer :which-key "avy-timer")
  "jc" '(evil-goto-last-change :which-key "last-change")
  "jb" '(sp-beginning-of-sexp :which-key "beginning-of-sexp")
  "je" '(sp-end-of-sexp :which-key "end-of-sexp")
  )

;; Magit
(keybind/leader
  "g" '(:ignore t :which-key "Git")
  "gs" '(magit-status :which-key "magit-status"))

;; Projects
(keybind/leader
  "p" '(:ignore t :which-key "Projects")
  "pp" '(projectile-switch-project :which-key "switch-project")
  "pr" '(projectile-recentf :which-key "projectile-recentf")
  "pf" '(projectile-find-file :which-key "project-find-file"))

;; Search
(keybind/leader
  "s" '(:ignore t :which-key "Search")
  "ss" '(consult-line :which-key "consult-line")
  "sp" '(consult-ripgrep :which-key "search-project"))

;; Windows
(keybind/leader
  "w"  '(:ignore t :which-key "Windows")
  "w1" '(win/window-split-single-column :which-key "Single")
  "w2" '(win/window-split-double-columns :which-key "Double Columns")
  "w3" '(win/window-split-triple-columns :which-key "Triple Columns")
  "w4" '(win/window-split-grid :which-key "Grid")
  "wd" '(delete-window :which-key "Delete Window")
  "w=" '(balance-windows :which-key "Balance Windows"))

;; Yank
(keybind/leader
  "y" '(:ignore t :which-key "Yank")
  "yy" '(consult-yank-pop :which-key "yank history"))

(provide 'init-leaderkey)
;;; init-leaderkey.el ends here
