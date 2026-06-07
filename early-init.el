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

(provide 'early-init)

;;; early-init.el ends here
