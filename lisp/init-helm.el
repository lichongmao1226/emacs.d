;;; init-helm.el --- init-helm -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package helm
  :ensure t
  :bind
  (("M-x"     . helm-M-x))
  :custom

  ;; Fuzzy matching
  (helm-M-x-fuzzy-match t)
  (helm-buffers-fuzzy-matching t)
  (helm-recentf-fuzzy-match t)
  (helm-imenu-fuzzy-match t)

  ;; Performance
  (helm-idle-delay 0.0)
  (helm-input-idle-delay 0.01)

  ;; Window
  (helm-split-window-inside-p t)
  (helm-autoresize-max-height 40)
  (helm-autoresize-min-height 20)

  :config
  (helm-mode 1)
  (helm-autoresize-mode 1))

(provide 'init-helm)
;;; init-helm.el ends here
