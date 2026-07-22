;;; init-flymake.el --- Flymake diagnostic configuration -*- lexical-binding: t -*-
;;; Commentary:
;; Flymake 实时语法检查与诊断配置

;;; Code:

(use-package flymake
  :ensure nil
  ;; 给所有编程语言模式 (prog-mode) 挂载 flymake-mode
  :hook (prog-mode . flymake-mode)
  :custom
  ;; 延迟 0.5 秒无输入后自动触发语法检查
  (flymake-no-changes-timeout 0.5)
  )

;; 拼写检查
(use-package flyspell
  :ensure nil
  :hook
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode))

(provide 'init-flymake)
;;; init-flymake.el ends here
