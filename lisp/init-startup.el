;;; init-startup.el --- startup settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  )

(provide 'init-startup)
;;; init-startup.el ends here
