;;; init-evil.el --- vim key settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package evil
  :init
  ;; 1. 禁用 evil 自带的 keybinding 模块
  (setq evil-want-keybinding nil)
  ;; 2. 允许 evil 与 evil-collection 整合
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

;; %对子跳转增强
(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode 1)
  )

;; 代码折叠
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; 完善vim快捷键（使vim快捷键在其他模式下也生效）
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(provide 'init-evil)
;;; init-evil.el ends here
