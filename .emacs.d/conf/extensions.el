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
(add-hook
 'ruby-mode-hook
 '(lambda ()
    ;; Don't want flymake mode for ruby regions in rhtml files
    (if (not (null buffer-file-name)) (flymake-mode))))
