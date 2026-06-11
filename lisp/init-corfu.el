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
  :init
  (global-corfu-mode))

(use-package cape
  :after corfu
  :config
  (add-to-list 'completion-at-point-functions #'cape-file)       ;; 文件路径
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)    ;; 类似 dabbrev
  (add-to-list 'completion-at-point-functions #'cape-keyword))   ;; 编程语言关键字

(provide 'init-corfu)
;;; init-corfu.el ends here
