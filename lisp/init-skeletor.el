;;; init-skeletor.el --- skeletor settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package skeletor
  :ensure t
  :custom
  ;; 设置模板存储位置
  (skeletor-user-directory
   (expand-file-name "etc/skeletor/" user-emacs-directory))
  :config
  ;; 注册自定义模板
  (skeletor-define-template
      "cpp-cmake-conan"
    ;; 执行skeletor-create-project后显示的标题
    :title "Cpp Project"
    :substitutions
    '(("__DESCRIPTION__"
       . (lambda ()
           (read-string "Description: ")))

      ("__CPP_STD__"
       . (lambda ()
           (completing-read
            "C++ standard: "
            '("17" "20" "23")
            nil t "20")))))
  )

(provide 'init-skeletor)
;;; init-skeletor.el ends here
