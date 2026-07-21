;;; custom_function.el --- custom function settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(defun alacritty-shell-command ()
  "在 Alacritty 中执行任意 shell 命令."
  (interactive) ;;可被用户交互调用
  (let ((cmd (read-shell-command "Shell command: "))) ;;读取用户输入，并将值赋给变量cmd
    (start-process ;;启动外部程序
     "alacritty-shell" ;;emacs内部进程名
     nil
     "alacritty"
     "-e"
     shell-file-name ;;emacs内部变量，输出用户默认shell
     "-ic"
     (concat cmd "; exec " shell-file-name))))

(provide 'custom_function)
;;; custom_function.el ends here
