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

(provide 'init-evil)
;;; init-evil.el ends here
