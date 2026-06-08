;;; init-projectile.el --- project settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package projectile
  :ensure t
  :diminish projectile-mode

  :init
  ;; 启用缓存
  (setq projectile-enable-caching t)
  (setq projectile-enable-caching 'persistent)

  ;; 使用外部工具索引文件（Git/fd/find）
  (setq projectile-indexing-method 'alien)

  ;; 自定义缓存文件路径

  ;;这段代码会导致新项目读取就项目文件名的问题
  ;; 项目内的文件缓存
  ;; (setq projectile-cache-file
  ;;       (expand-file-name "user-cache/project/.projectile-cache.eld" user-emacs-directory))

  ;; 访问过的项目目录缓存
  (setq projectile-known-projects-file
        (expand-file-name
         "user-cache/project/projectile-bookmarks.eld"
         user-emacs-directory))

  ;; 如果目录不存在，自动创建
  (let ((dir (file-name-directory projectile-known-projects-file)))
    (unless (file-directory-p dir)
      (make-directory dir t)))

  :config
  (projectile-mode 1)
  )

;; 设置project.el缓存文件位置
(setq project-list-file
      (expand-file-name
       "user-cache/project/projects"
       user-emacs-directory))

(provide 'init-projectile)

;;; init-projectile.el ends here
