;;; init-themes.el --- dark theme -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;; 设置字体大小
(set-face-attribute
 'default
 nil
 :font "FiraCode Nerd Font"
 :height 200)

(set-face-attribute
 'mode-line
 nil
 :height 150)

;; 设置窗口透明度
(set-frame-parameter (selected-frame) 'alpha '(100 . 75))

;; 配置mode-line
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom

  ;; 高度
  (doom-modeline-height 32)

  ;; 左侧色条
  (doom-modeline-bar-width 3)

  ;; 时间
  (display-time-mode 1)
  (display-time-format "%H:%M:%S") ;; 24小时时分秒格式
  (display-time-interval 1) ;; 每秒刷新

  ;; 设置行列
  (line-number-mode 1)
  (column-number-mode 1)
  (mode-line-position-column-line-format '("%l:%c"))

  ;; Nerd Font 图标
  (doom-modeline-icon t)

  ;; Major mode 图标
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)

  ;; 文件路径显示
  (doom-modeline-buffer-file-name-style
   'relative-from-project)

  ;; Git
  (doom-modeline-vcs-max-length 15)

  ;; LSP
  (doom-modeline-lsp t)

  ;; 位置百分比
  (setq doom-modeline-percent-position '(-3 "%p"))

  ;; 去除噪音
  (doom-modeline-minor-modes nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-workspace-name nil)
  (doom-modeline-env-version nil))

(provide 'init-themes)
;;; init-themes.el ends here
