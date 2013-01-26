(let*
    ((user-emacs-directory
      (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
     (conf-list (list
                 "basic.el"
                 "keybind.el"
                 "el-get.el"
                 "extensions.el"
                 "languages.el"
                 )))
  (progn
    (dolist (conf conf-list)
      (load (concat user-emacs-directory "conf/" conf)))))
