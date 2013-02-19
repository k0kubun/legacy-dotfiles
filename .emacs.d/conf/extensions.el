;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; zen coding mode
(when (require 'zencoding-mode nil t)
  (add-hook 'html-mode-hook 'zencoding-mode)
  (add-hook 'text-mode-hook 'zencoding-mode)
  (define-key zencoding-mode-keymap "\C-z" 'zencoding-expand-line))

;; yasnippet
(when (require 'yasnippet nil t)
  (setq yas-snippet-dirs
         '("~/.emacs.d/snippets")))
(yas-global-mode 1)

(custom-set-variables '(yas-trigger-key "TAB"))
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; flymake
(require 'flymake)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))

;; tabbar
(require 'tabbar)
(tabbar-mode 1)
(tabbar-mwheel-mode -1)
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
(setq tabbar-buffer-groups-function nil)
(defun my-tabbar-buffer-list ()
  (remove-if
   (lambda (buffer)
     (find (aref (buffer-name buffer) 0) " *"))
   (buffer-list)))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
