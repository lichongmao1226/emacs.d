;;; init-projectile.el --- project settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode

  :init
  ;; 使用外部工具索引
  (setq projectile-indexing-method 'alien)

  ;; 自定义缓存目录
  (let ((cache-dir (expand-file-name "user-cache/project/" user-emacs-directory)))
    (unless (file-directory-p cache-dir)
      (make-directory cache-dir t))

    ;; 指定持久化文件路径
    (setq projectile-known-projects-file
          (expand-file-name "projectile-bookmarks.eld" cache-dir)))

  :config
  ;; 启用 Projectile
  (projectile-mode +1)
  )

;; 设置project.el缓存文件位置
(setq project-list-file
      (expand-file-name
       "user-cache/project/projects"
       user-emacs-directory))

(provide 'init-projectile)

;;; init-projectile.el ends here
