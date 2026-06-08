;;; init-packages.el --- package management -*- lexical-binding: t -*-
;;; Commentary:
;; 自动管理插件源和 use-package 安装

;;; Code:

(require 'package)

;; 添加插件源
;; 使用 t 表示 append，不覆盖已有元素
(unless (assoc "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))

(unless (assoc "nongnu" package-archives)
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t))

(unless (assoc "gnu" package-archives)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t))

;; 初始化 package
(unless (bound-and-true-p package--initialized)
  (package-initialize))

;; 刷新 package 索引（必要时）
;; 这里判断 archives 是否为空，如果为空或者过期就刷新
(unless package-archive-contents
  (message "Package archive is empty, refreshing package contents...")
  (package-refresh-contents))

;; use-package 安装
(eval-when-compile
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (require 'use-package))

;; 设置 use-package 自动安装缺失的包
(setq use-package-always-ensure t)

(provide 'init-packages)
;;; init-packages.el ends here
