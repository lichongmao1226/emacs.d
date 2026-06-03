;;; init.el --- This is my personal emacs configration. -*- lexical-binding: t -*-

;;; Commentary:
;; This file bootstraps the configuration, which is divided a number of other files.

;;; Code:

(message "这是一份测试配置，使用它可能产生不可预知的后果。")

;; 软件更新警告
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Emacs版本过旧，请升级（该配置需要至少 v%s 或更高的版本）" minver)))

;; 添加插件源
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; 添加包管理器
(eval-when-compile
  (require 'use-package))

;; 批量引入文件目录，使得指定目录下的文件可被载入（require）
(dolist (dir '("lisp"))
  (add-to-list 'load-path (expand-file-name dir user-emacs-directory)))

;; 引入模块
(require 'init-evil)
(require 'init-themes)
(require 'init-keybind)


;; 导出模块为init
(provide 'init)


;;; init.el ends here
