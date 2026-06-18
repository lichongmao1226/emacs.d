;;; init-lsp.el --- lsp settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook
  ((c-mode c++-mode c-ts-mode c++-ts-mode)
   . lsp)
  :custom
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-symbol-highlighting t)
  (lsp-idle-delay 0.2))

(provide 'init-lsp)
;;; init-lsp.el ends here
