;; for yatex, install mercurial
(unless (executable-find "hg")
  (interactive)
  (shell-command "brew install mercurial")
)

;; el-get
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(setq exec-path (append exec-path '("/usr/local/bin/")))

(setq
 el-get-dir (concat user-emacs-directory "el-get")
 el-get-verbose t
 el-get-user-package-directory (concat user-emacs-directory "conf/init"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync
        '(el-get
          helm
          yatex
          camelCase-mode
          highlight-indentation
          auto-complete
          ruby-electric
          ruby-block
          column-marker
          haml-mode
          sass-mode
          js2-mode
          google-c-style
          elscreen
          php-mode
          ))
