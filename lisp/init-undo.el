;;; init-undo.el --- undo settings -*- lexical-binding: t -*-
;;; commentary:

;;; code:

(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :ensure t
  :after undo-fu
  :init
  (undo-fu-session-global-mode))

(use-package vundo
  :ensure t
  :custom
  (vundo-compact-display t)
  )

(provide 'init-undo)
;;; init-undo.el ends here
