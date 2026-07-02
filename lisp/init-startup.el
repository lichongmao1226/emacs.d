;;; init-startup.el --- startup settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startupify-list
        '(dashboard-insert-init-info
          dashboard-insert-items
          dashboard-insert-newline
          dashboard-insert-footer))
  )

(provide 'init-startup)
;;; init-startup.el ends here
