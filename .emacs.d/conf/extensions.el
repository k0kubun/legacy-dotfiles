;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; elscreen
(load "elscreen" "elscreen" t)
(elscreen-start)
(setq elscreen-display-tab 10)
(setq elscreen-tab-display-kill-screen nil)

;; elscreen-server
(require 'elscreen-server)

;; elscreen-dired
(require 'elscreen-dired)

;; elscreen-color-theme
(require 'elscreen-color-theme)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(define-key ac-completing-map (kbd "C-j") 'ac-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
