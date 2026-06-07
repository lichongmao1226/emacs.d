;;; init-keybind.el --- init-keybind -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; SPC+
(keybind/leader
 "SPC" '(helm-M-x :which-key "M-x")
 "q" 'keyboard-escape-quit :which-key "quit")

;; Applictaions
(keybind/leader
 "a" '(:ignore t :which-key "Applictaions")
 "au" '(vundo :which-key "undo-tree"))

;; Buffers
(keybind/leader
 "b"  '(:ignore t :which-key "Buffers")
 "bb" '(helm-mini :which-key "List Buffers")
 "bd" '(kill-current-buffer :which-key "Kill Buffer")
 "TAB" '(win/alternate-buffer :which-key "Last Buffer")
 "bm" '(win/switch-to-messages-buffer :which-key "Messages")
 "bw" '(read-only-mode :which-key "read-only")
 )

;; Files
(keybind/leader
 "f"  '(:ignore t :which-key "Files")
 "ff" '(helm-find-files :which-key "Find file")
 "fr" '(helm-recentf :which-key "Recent files")
 "fs" '(save-buffer :which-key "Save buffer")
 "fS" '(write-file :which-key "Save as")
 "fd" '(dired :which-key "Dired"))

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
