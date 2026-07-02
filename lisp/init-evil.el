;;; init-evil.el --- vim key settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Set up package.el to work with MELPA
(require 'package)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; %对子跳转增强
(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode 1)
  )

;; 代码折叠
(add-hook 'prog-mode-hook #'hs-minor-mode)

(provide 'init-evil)
;;; init-evil.el ends here
