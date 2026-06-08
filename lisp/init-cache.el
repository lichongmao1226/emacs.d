;;; init-cache.el --- cache files -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; Cache root directory
(defconst cache/cache-dir
  (expand-file-name
   "user-cache/"
   user-emacs-directory)
  "Directory for cache files.")

(unless (file-directory-p cache/cache-dir)
  (make-directory cache/cache-dir t))

;; Recentf
(setq recentf-save-file
      (expand-file-name
       "recentf"
       cache/cache-dir))

;; Tramp
(setq tramp-persistency-file-name
      (expand-file-name
       "tramp"
       cache/cache-dir))

;; Undo-Fu Session
(setq undo-fu-session-directory
      (expand-file-name
       "undo/"
       cache/cache-dir))

(unless (file-directory-p undo-fu-session-directory)
  (make-directory undo-fu-session-directory t))

(provide 'init-cache)
;;; init-cache.el ends here
