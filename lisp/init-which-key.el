;;; init-which-key.el --- init-which-key -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package which-key
  :ensure t
  :custom
  (which-key-idle-delay 0.1)
  (which-key-idle-secondary-delay 0.05)
  (which-key-lighter " K")
  :config
  (which-key-mode 1))

(provide 'init-which-key)
;;; init-which-key.el ends here
