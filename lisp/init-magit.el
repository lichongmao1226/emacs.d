;;; init-magit.el --- Magit configuration -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :commands (magit-status magit-blame)
  :custom
  (add-to-list
   'display-buffer-alist
   '("\\*magit:.*\\|\\*Magit.*\\*"
     (win/open-bottom-window))))

(provide 'init-magit)
;;; init-magit.el ends here
