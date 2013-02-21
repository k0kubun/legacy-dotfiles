;; Ruby
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(require 'ruby-mode)
(add-to-list 'ruby-encoding-map '(utf-8-hfs . utf-8))
(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-d") 'xmp)
(setq rsense-home "$RSENSE_HOME")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; PHP
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-search-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja"))
