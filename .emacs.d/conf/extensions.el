;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; elscreen
(load "elscreen" "elscreen" t)
(elscreen-start)
(setq elscreen-display-tab 10)
(setq elscreen-tab-display-kill-screen nil)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(define-key ac-completing-map (kbd "C-j") 'ac-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; highlight-indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#112233")
(set-face-background 'highlight-indentation-current-column-face "#224477")
(add-hook 'ruby-mode-hook 'highlight-indentation-mode)

;; helm
(require 'helm-config)

;; camelCase-mode
(autoload 'camelCase-mode "camelCase-mode" nil t)
(add-hook 'c++-mode-hook '(lambda () (camelCase-mode 1)))
(add-hook 'objc-mode-hook '(lambda () (camelCase-mode 1)))

;; mark 80 column
(require 'column-marker)
(custom-set-faces
 '(column-marker-2 ((t (:background "#113377")))))
(mapc (lambda (hook)
        (add-hook hook (lambda () (interactive) (column-marker-2 80))))
      '(emacs-lisp-mode-hook
        ruby-mode-hook
        js2-mode-hook
        text-mode-hook))
