;;; custom_function.el --- custom function settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(defun my/find-venv-activate-path (dir)
  "在 DIR 路径（或其父目录）下查找符合特征的 Python 虚拟环境。
特征文件夹名包括：venv, .venv, env, .env。
- 若找到唯一目录，返回其 activate 完整路径字符串；
- 若无或有多个，返回 nil (在逻辑中表示 0)。"
  (let* ((dir (expand-file-name dir))
         (venv-candidates '("venv" ".venv" "env" ".env"))
         ;; 内部辅助：检测单层目录下的匹配情况
         (check-single-dir
          (lambda (target-dir)
            (let ((matched-paths '()))
              (dolist (name venv-candidates)
                (let ((full-path (expand-file-name name target-dir)))
                  ;; 判断是否存在且是目录，并且包含 bin/activate 文件
                  (when (and (file-directory-p full-path)
                             (file-exists-p (expand-file-name "bin/activate" full-path)))
                    (push (expand-file-name "bin/activate" full-path) matched-paths))))
              ;; 只有当“恰好存在一个”符合要求的虚拟环境时才返回路径
              (if (= (length matched-paths) 1)
                  (car matched-paths)
                nil)))))
    
    ;; 1. 先在当前项目路径下寻找
    (or (funcall check-single-dir dir)
        ;; 2. 若未找到，回到上一级目录（父目录）再次寻找
        (let ((parent-dir (file-name-directory (directory-file-name dir))))
          ;; 确保没有退到系统的根目录循环查找
          (if (and parent-dir (not (string= dir parent-dir)))
              (funcall check-single-dir parent-dir)
            nil)))))

(defun my/get-prefix-command ()
  "自动检测当前项目/上级目录的虚拟环境，并生成前置激活命令。"
  (let* ((projectile-project-root (or (when (fboundp 'project-root)
					(when-let ((proj (project-current)))
					  (project-root proj)))
				      default-directory))
         (venv-activate (my/find-venv-activate-path projectile-project-root)))
    (if venv-activate
        (format "source %s; echo '===已加载python虚拟环境==='" venv-activate)
      "echo '===未检测到唯一的Python虚拟环境==='")))

(defun alacritty-shell-command (cmd prefix-cmd)
  "在 Alacritty 中通过 tmux 执行 shell 命令，解决单双引号冲突导致的闪退问题。"
  (interactive
   (list (read-shell-command "Shell command: ")
         (my/get-prefix-command)))
  ;; 确保系统安装了 tmux
  (unless (executable-find "tmux")
    (error "系统未找到 tmux，请先通过包管理器安装 (例如 sudo apt install tmux)"))
  (let* ((session-name "emacs-remote")
         ;; 安全拼接前置命令与用户命令
         (full-cmd (if (and prefix-cmd (not (string-empty-p prefix-cmd)))
                       (concat prefix-cmd "; " cmd)
                     cmd))
         ;; 构造在 tmux 中执行的初始命令链
         (start-script (format "%s; exec %s" full-cmd shell-file-name)))
    ;; 1. 如果已有 emacs-remote 会话，先发新的命令进去；如果没有，新建会话
    (if (zerop (call-process "tmux" nil nil nil "has-session" "-t" session-name))
        ;; 会话已存在：发送新命令并回车
        (call-process "tmux" nil nil nil "send-keys" "-t" session-name full-cmd "C-m")
      ;; 会话不存在：创建后台新会话并运行 start-script
      (call-process "tmux" nil nil nil "new-session" "-d" "-s" session-name start-script))
    ;; 2. 打开 Alacritty 并附加 (attach) 到该 tmux 会话
    (start-process
     "alacritty-shell"
     nil
     "alacritty"
     "-e"
     shell-file-name
     "-ic"
     (format "tmux attach-session -t %s" session-name))))

(provide 'custom_function)
;;; custom_function.el ends here
