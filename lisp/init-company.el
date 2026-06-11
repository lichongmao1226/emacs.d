;;; init-company.el --- company settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  :custom
  ;; 延迟补全
  (company-idle-delay 0.2)
  ;; 最少输入几个字符才触发
  (company-minimum-prefix-length 1)
  ;; 弹出补全菜单的方向
  (company-tooltip-align-annotations t)
  ;; 自动显示候选
  (company-show-quick-access t)
  ;; 补全列表最大显示数
  (company-tooltip-limit 10)
  ;; 循环列表
  (company-selection-wrap-around t)
  ;; 显示额外信息
  (company-tooltip-align-annotations t)

  ;; 前端设置
  (company-frontends
   '(company-pseudo-tooltip-frontend ;; 显示候选项列表
     company-echo-metadata-frontend ;; 在底部的mini bufffer中显示当前候选项的注释信息
     company-preview-frontend ;; 预览第一个候选项
     ))

  ;; 后端设置
  ;; 设置从已有文本中收集可能存在的候选词的最小长度，增加此值可提升性能
  (company-dabbrev-minimum-length 3)
  ;; 从其他buffer收集候选词
  (company-dabbrev-other-buffers t)
  (company-backends
   '((
      company-capf ;; 兼容 LSP 或 completion-at-point-functions
      company-dabbrev ;; 类似 Emacs 内置 dabbrev
      company-files ;; 文件路径补全
      company-dabbrev-code
      company-clang ;; 获取clang编译器输出
      company-keywords
      )))
  )

;; 按选择频率排序候选项
(use-package company-statistics
  :after company
  :config
  (company-statistics-mode)
  :custom
  ;; 缓存文件路径
  (company-statistics-file
   (expand-file-name
    "user-cache/company/company-statistics-cache.el"
    user-emacs-directory)))

(provide 'init-company)
;;; init-company.el ends here
