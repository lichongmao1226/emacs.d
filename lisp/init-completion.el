;;; init-completion.el --- vim key settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; 美化mini buffer
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1)
  ;; 将embark-act菜单显示为网格(可通过M-G切换)
  (vertico-multiform-mode)
  (add-to-list 'vertico-multiform-categories '(embark-keybinding grid))
  ;; 设置网格最少为3列
  (setq vertico-grid-min-columns 3)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  ;; 设置缓存目录
  (setq savehist-file (expand-file-name "user-cache/savehist" user-emacs-directory))
  (savehist-mode))

;; 优化Emacs体验
;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; 增强搜索
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (orderless-component-separator #'orderless-escapable-split-on-space)
  )

;; 增强注释信息
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; 高级命令
(use-package consult
  :ensure t)

;; 增强交互操作
(use-package embark
  :ensure t
  :bind
  (("M-o" . embark-act)
   ("M-O" . embark-dwim))
  :init
  ;; 通过补全选择命令
  (setq embark-prompter #'embark-completing-read-prompter)
  (setq embark-indicators
        '(embark-minimal-indicator  ; default is embark-mixed-indicator
          embark-highlight-indicator
          embark-isearch-highlight-indicator))
  )

;; 使embark和consult更好地协作
(use-package embark-consult
  :ensure t
  :after (embark consult))

(provide 'init-completion)
;;; init-completion.el ends here
