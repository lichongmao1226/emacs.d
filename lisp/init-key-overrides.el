;;; init-key-overrides.el --- key settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; 将M-g映射为C-g
(global-set-key (kbd "M-g") nil)
(define-key key-translation-map (kbd "M-g") (kbd "C-g"))

;; 覆盖默认的不常用的emacs命令
(with-eval-after-load 'evil

  ;; 将M-X重新绑定为浏览历史命令
  (global-set-key (kbd "M-X") nil)
  (global-set-key (kbd "M-X") 'consult-complex-command)

  ;; 保存文件
  (global-set-key (kbd "M-s") nil)
  (global-set-key (kbd "M-s") 'save-buffer)

  ;; 全屏跳转
  (define-key evil-normal-state-map
              (kbd "M-f")
              #'evil-avy-goto-char)

  ;; 行内跳转
  (define-key evil-normal-state-map
              (kbd "f")
              #'evil-avy-goto-char-in-line)

  ;; 复制行
  (define-key evil-normal-state-map
              (kbd "M-c")
              #'avy-copy-line)

  ;; 复制区域
  (define-key evil-normal-state-map
              (kbd "M-C")
              #'avy-copy-region)

  ;; 移动行
  (define-key evil-normal-state-map
              (kbd "M-d")
              #'avy-move-line)

  ;; 移动区域
  (define-key evil-normal-state-map
              (kbd "M-D")
              #'avy-move-region)
  )

(provide 'init-key-overrides)
;;; init-key-overrides.el ends here
