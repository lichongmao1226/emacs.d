;;; init-eglot.el --- eglot settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package eglot
  :ensure nil
  :hook
  ((c-mode . eglot-ensure)
   (c++-mode . eglot-ensure)
   (python-mode . eglot-ensure))
  :config
  (custom-set-faces
   '(eglot-highlight-symbol-face
     ((t (:background "#44475a")))))
  )

(use-package flymake
  :ensure t)

;; 修复中文路径下eglot+flymake不工作的问题
(defun myfix/eglot-uri-to-path (uri)
  "Convert URI to file path, helped by `eglot-current-server'."
  (when (keywordp uri) (setq uri (substring (symbol-name uri) 1)))
  (let* ((server (eglot-current-server))
         (remote-prefix (and server (eglot--trampish-p server)))
         (url (url-generic-parse-url uri)))
    ;; Only parse file:// URIs, leave other URI untouched as
    ;; `file-name-handler-alist' should know how to handle them
    ;; (bug#58790).
    (if (string= "file" (url-type url))
        (let* ((retval (decode-coding-string (url-unhex-string (url-filename url)) 'utf-8))
               ;; Remove the leading "/" for local MS Windows-style paths.
               (normalized (if (and (not remote-prefix)
                                    (eq system-type 'windows-nt)
                                    (cl-plusp (length retval)))
                               (w32-long-file-name (substring retval 1))
                             retval)))
          (concat remote-prefix normalized))
      uri)))
(advice-add 'eglot-uri-to-path :override #'myfix/eglot-uri-to-path)

(provide 'init-eglot)
;;; init-eglot.el ends here
