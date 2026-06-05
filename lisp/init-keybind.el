;;; init-keybind.el --- init-keybind -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; 引入需要的模块
(require 'which-key)
(require 'evil)
(require 'helm)

;; 启用快捷键提示
(which-key-mode 1)

;; 定义全局leader按键
(defvar my-leader-map nil
  "Global leader keymap.")
(define-prefix-command 'my-leader-map)
(global-set-key (kbd "SPC")
                'my-leader-map)

;; 取消evil模式对SPC按键的绑定

;; (evil-define-key
;;   'normal
;;   'global
;;   (kbd "SPC")
;;   my-leader-map)

(define-key evil-normal-state-map
            (kbd "SPC")
            my-leader-map)

(define-key evil-motion-state-map
            (kbd "SPC")
            my-leader-map)

;; 定义helm与操作文件相关的快捷键
(defvar my-file-map nil)
(define-prefix-command 'my-file-map)
(define-key my-leader-map
            (kbd "f")
            my-file-map)

(define-key my-leader-map
            (kbd "SPC")
            #'helm-M-x)

(define-key my-file-map
            (kbd "f")
            #'helm-find-files)

(define-key my-file-map
            (kbd "r")
            #'helm-recentf)

(define-key my-file-map
            (kbd "s")
            #'save-buffer)

(define-key my-file-map
            (kbd "S")
            #'write-file)

(define-key my-file-map
            (kbd "d")
            #'dired)

;; 定义窗口布局相关快捷键
(defvar my-window-map nil
  "Window commands.")

(define-prefix-command 'my-window-map)

(define-key my-leader-map
            (kbd "w")
            my-window-map)

(define-key my-window-map
            (kbd "1")
            #'win/window-split-single-column)

(define-key my-window-map
            (kbd "2")
            #'win/window-split-double-columns)

(define-key my-window-map
            (kbd "3")
            #'win/window-split-triple-columns)

(define-key my-window-map
            (kbd "4")
            #'win/window-split-grid)

(define-key my-window-map
            (kbd "d")
            #'delete-window)

(define-key my-window-map
            (kbd "=")
            #'balance-windows)

;; 定义buffer相关快捷键
(defvar my-buffer-map nil
  "Buffer commands.")

(define-prefix-command 'my-buffer-map)

(define-key my-leader-map
            (kbd "b")
            my-buffer-map)

(define-key my-leader-map
            (kbd "TAB")
            #'win/alternate-buffer)

(define-key my-buffer-map
            (kbd "b")
            #'helm-mini)

;; 定义路径标签
(defun keybind/setup-which-key ()
  "Configure which-key labels for leader key prefixes."
  (which-key-add-keymap-based-replacements
    my-leader-map
    "f" "Files"
    "w" "windows"
    "TAB" "Last buffer")
  (which-key-add-keymap-based-replacements
    my-window-map
    "1" "Single"
    "2" "Double Columns"
    "3" "Triple Columns"
    "4" "Grid")
  (which-key-add-keymap-based-replacements
    my-buffer-map
    "b" "list-buffers")
  )

;; 执行上面定义的函数
(keybind/setup-which-key)

(provide 'init-keybind)
;;; init-keybind.el ends here
