;;; init-undo.el --- undo settings -*- lexical-binding: t -*-
;;; commentary:

;;; code:

(use-package undo-fu
  :ensure t)

(use-package undo-fu-session
  :ensure t
  :after undo-fu
  :config
  (undo-fu-session-global-mode))

(use-package vundo
  :ensure t
  :commands (vundo)
  :custom
  (vundo-compact-display t)
  )

;; 常规撤销历史上限（默认仅约 160KB，这里调大到 64MB）
(setq undo-limit 67108640)

;; 强上限，超过此大小即使刚生成的记录也会被直接截断（这里调大到 96MB）
(setq undo-strong-limit 100663296)

;; 历史记录在被清理前允许保留的最大总内存（这里调大到 256MB）
(setq undo-outer-limit 268435456)

(provide 'init-undo)
;;; init-undo.el ends here
