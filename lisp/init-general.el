;;; init-general.el --- init-general -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package general
  :ensure t
  :config

  ;; Leader Key
  (general-create-definer keybind/leader
                          :states '(normal motion visual)
                          :keymaps 'override
                          :prefix "SPC"
                          :global-prefix "M-SPC"))


(provide 'init-general)
;;; init-general.el ends here
