;;; init-helm.el --- init-helm -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package helm
  :ensure t
  :config
  (helm-mode 1)

  (global-set-key (kbd "M-x") #'helm-M-x)
  )

(provide 'init-helm)
;;; init-helm.el ends here
