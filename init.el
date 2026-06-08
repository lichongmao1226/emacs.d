;;; init.el --- This is my personal emacs configration. -*- lexical-binding: t -*-

;;; Commentary:
;; This file bootstraps the configuration, which is divided a number of other files.

;;; Code:

(message "这是一份测试配置，使用它可能产生不可预知的后果。")

;; 软件更新警告
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Emacs版本过旧，请升级（该配置需要至少 v%s 或更高的版本）" minver)))

;; 启动完成后恢复 GC 设置
(add-hook
 'emacs-startup-hook
 (lambda ()
   (setq gc-cons-threshold (* 100 1024 1024))
   (setq gc-cons-percentage 0.1)))


;; 批量引入文件目录，使得指定目录下的文件可被载入（require）
(dolist (dir '("lisp" "tests"))
  (add-to-list 'load-path (expand-file-name dir user-emacs-directory)))

;;; 引入模块

;; 包管理
(require 'init-packages)

;; 主题设置
(require 'init-themes)

;;leader按键
(require 'init-general)

;; 设置缓存文件目录
(require 'init-cache)

;; 功能模块
;; (require 'init-helm)
(require 'init-completion)
(require 'init-winum)
(require 'init-which-key)
(require 'init-undo)
(require 'init-magit)
(require 'init-projectile)

;; 最后引入快捷键模块与evil模块。若提前加载evil 那么某些情况下SPC按键将与leader冲突
;; (require 'init-keybind)
(load (expand-file-name "tests/init-keybind.el" user-emacs-directory))
(require 'init-evil)

;; 导出模块为init
(provide 'init)


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
