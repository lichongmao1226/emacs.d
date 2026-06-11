;;; init-smartparens.el --- smartparens settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package smartparens
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

(provide 'init-smartparens)
;;; init-smartparens.el ends here
