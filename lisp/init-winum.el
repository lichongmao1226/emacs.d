;;; init-winum.el --- windows settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package winum
  :ensure t
  :config
  (winum-mode 1)
  (dotimes (i 10)
    (global-set-key
     (kbd (format "M-%d" i))
     (intern (format "winum-select-window-%d" i))))
  )

(defun win/window-split-single-column ()
  "Switch to a single window."
  (interactive)
  (delete-other-windows))

(defun win/window-split-double-columns ()
  "Create a two-column layout."
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (balance-windows))

(defun win/window-split-triple-columns ()
  "Create a three-column layout."
  (interactive)
  (delete-other-windows)

  ;; 第一列
  (split-window-right)

  ;; 第二列
  (other-window 1)
  (split-window-right)

  ;; 回到最左侧
  (other-window -2)

  (balance-windows))

(defun win/window-split-grid ()
  "Create a 2x2 grid layout."
  (interactive)
  (delete-other-windows)

  ;; 左右分割
  (split-window-right)

  ;; 左边再上下分割
  (split-window-below)

  ;; 右边再上下分割
  (other-window 2)
  (split-window-below)

  ;; 回到左上角
  (other-window -3)

  (balance-windows))

(defun win/alternate-buffer ()
  "Toggle between current and previous useful buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(provide 'init-winum)
;;; init-winum.el ends here
