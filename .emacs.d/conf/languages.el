;; Ruby
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(require 'ruby-mode)
(add-to-list 'ruby-encoding-map '(utf-8-hfs . utf-8))
(add-hook 'ruby-mode-hook
 '(lambda ()
 (add-to-list 'ruby-encoding-map '(undecided . utf-8))))

;; xmpfilter
;; (require 'rcodetools)
;; (define-key ruby-mode-map (kbd "C-c C-d") 'xmp)

;; RSense
;; (setq rsense-home "$RSENSE_HOME")
;; (add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)

;; Ruby indent configuration
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; PHP
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-search-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja"))
