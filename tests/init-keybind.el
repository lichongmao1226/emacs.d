;;; init-keybind.el --- init-keybind -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; SPC+
(keybind/leader
 "SPC" '(execute-extended-command :which-key "M-x")
 "q" 'keyboard-escape-quit :which-key "quit")

;; Applictaions
(keybind/leader
 "a" '(:ignore t :which-key "Applictaions")
 "au" '(vundo :which-key "undo-tree")
 "ap" '(list-processes :which-key "list-processes"))

;; Buffers
(keybind/leader
 "b"  '(:ignore t :which-key "Buffers")
 "bb" '(consult-buffer :which-key "List Buffers")
 "bd" '(kill-current-buffer :which-key "Kill Buffer")
 "TAB" '(win/alternate-buffer :which-key "Last Buffer")
 "bm" '(win/switch-to-messages-buffer :which-key "Messages")
 "bw" '(read-only-mode :which-key "read-only")
 )

;; Files
(keybind/leader
 "f"  '(:ignore t :which-key "Files")
 "ff" '(find-file :which-key "Find file")
 "fr" '(recentf :which-key "Recent files")
 "fs" '(save-buffer :which-key "Save buffer")
 "fS" '(write-file :which-key "Save as")
 "fd" '(dired :which-key "Dired"))

;; Magit
(keybind/leader
 "g" '(:ignore t :which-key "Git")
 "gs" '(magit-status :which-key "magit-status"))

;; Projects
(keybind/leader
 "p" '(:ignore t :which-key "Projects")
 "pp" '(projectile-switch-project :which-key "switch-project")
 "pr" '(projectile-recentf :which-key "projectile-recentf"))

;; Search
(keybind/leader
 "s" '(:ignore t :which-key "Search")
 "ss" '(consult-line :which-key "consult-line"))

;; Windows
(keybind/leader
 "w"  '(:ignore t :which-key "Windows")
 "w1" '(win/window-split-single-column :which-key "Single")
 "w2" '(win/window-split-double-columns :which-key "Double Columns")
 "w3" '(win/window-split-triple-columns :which-key "Triple Columns")
 "w4" '(win/window-split-grid :which-key "Grid")
 "wd" '(delete-window :which-key "Delete Window")
 "w=" '(balance-windows :which-key "Balance Windows"))


(provide 'init-keybind)
;;; init-keybind.el ends here
