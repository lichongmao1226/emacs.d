;;; init-cache.el --- cache files -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package no-littering
  :ensure t)

;; 记忆上次打开文件时光标的位置
(use-package saveplace
  :ensure t
  :init
  (save-place-mode 1))

(provide 'init-cache)
;;; init-cache.el ends here
