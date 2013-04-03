;; Ruby
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(require 'ruby-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-to-list 'ruby-encoding-map '(utf-8-hfs . utf-8))
(add-hook 'ruby-mode-hook
 '(lambda ()
 (add-to-list 'ruby-encoding-map '(undecided . utf-8))))

;; Ruby Electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; Ruby Block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

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

;; Objective-C
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@implementation" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@interface" . objc-mode))
(add-to-list 'magic-mode-alist '("\\(.\\|\n\\)*\n@protocol" . objc-mode))
 
(ffap-bindings)
(setq ffap-newfile-prompt t)
(setq ffap-kpathsea-depth 5)

(setq ff-other-file-alist
     '(("\\.mm?$" (".h"))
       ("\\.cc$"  (".hh" ".h"))))
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key c-mode-base-map (kbd "C-c o") 'ff-find-other-file)
         ))

(require 'auto-complete-config)
(require 'ac-company)
(global-auto-complete-mode t)
(ac-company-define-source ac-source-company-xcode company-xcode)
(setq ac-modes (append ac-modes '(objc-mode)))
(add-hook 'objc-mode-hook
         (lambda ()
           (define-key objc-mode-map (kbd "\t") 'ac-complete)
           (push 'ac-source-company-xcode ac-sources)
           (push 'ac-source-c++-keywords ac-sources)
         ))
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(setq ac-candidate-max 20)

;; C++
(setq auto-mode-alist
      (cons (cons "\\.h$" 'c++-mode) auto-mode-alist))
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; javascript
(require 'js)
(setq js-indent-level 2)
(defalias 'javascript-generic-mode 'js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 2)
