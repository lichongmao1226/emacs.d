;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;;; Code:

;; 禁用emacs默认的包管理器
(setq package-enable-at-startup nil)

;; 禁用菜单栏、工具栏
(menu-bar-mode -1)
(tool-bar-mode -1)

;; 禁用启动画面
(setq inhibit-startup-screen t)

;; 设置默认主题颜色
(set-face-background 'default "#282c34")
(set-face-foreground 'default "#bbc2cf")

;; 提高 GC 阈值
(setq gc-cons-threshold most-positive-fixnum)

;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(global-auto-revert-mode t)

;; 显示相对行号
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; 全屏启动
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(provide 'early-init)

;;; early-init.el ends here
