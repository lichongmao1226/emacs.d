;;; init-corfu.el --- corfu settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package corfu
  :custom
  (corfu-cycle t)                 ;; 循环候选项
  (corfu-auto t)                  ;; 自动显示补全
  (corfu-auto-delay 0.1)          ;; 延迟 0.1s
  (corfu-auto-prefix 1)           ;; 输入 1 个字符就自动补全
  (corfu-separator ?\s)           ;; 候选分隔符
  (corfu-quit-no-match 'separator) ;; 无匹配时显示
  (corfu-echo-documentation 0.25) ;; 自动显示文档
  (corfu-indexed-mode 1) ;; 显示数字索引
  (corfu-indexed-start 1) ;; 使索引从1开始
  :init
  (global-corfu-mode)
  )

;; 按下TAB补全候选项的共同前缀
(with-eval-after-load 'corfu
  (define-key corfu-map (kbd "TAB") #'corfu-expand))

(use-package cape
  :after corfu
  :config
  ;; 全局通用 CAPF
  (add-to-list 'completion-at-point-functions #'cape-file) ;; 文件路径补全
  (add-to-list 'completion-at-point-functions #'cape-keyword) ;; 关键字补全

  ;; Emacs Lisp 专用补全
  (add-hook
   'emacs-lisp-mode-hook
   (lambda ()
     (setq-local
      completion-at-point-functions
      (list
       (cape-capf-super
        #'elisp-completion-at-point
        ;; Elisp 符号
        #'cape-elisp-symbol
        ;; 当前缓冲区文本
        #'cape-dabbrev
        ;; 文件路径
        #'cape-file
        ;; 关键字
        #'cape-keyword)))))
  )

;; 按下M-num选择候选项
(defun my-corfu-complete-nth (n)
  (interactive)
  (let ((idx (1- n)))
    (when (and (bound-and-true-p corfu--candidates)
               (>= idx 0)
               (< idx (length corfu--candidates)))
      (corfu--goto idx)
      (corfu-insert))))

(dotimes (i 9)
  (define-key corfu-map
              (kbd (format "M-%d" (1+ i)))
              `(lambda ()
                 (interactive)
                 (my-corfu-complete-nth ,(1+ i)))))

(provide 'init-corfu)
;;; init-corfu.el ends here
