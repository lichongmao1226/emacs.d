;;; init-avy.el --- avy settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package avy
  :ensure t
  :init
  ;; 覆盖显示标签
  (setq avy-style 'at-full)
  ;; 背景变暗
  (setq avy-background t)
  )

(provide 'init-avy)
;;; init-avy.el ends here
