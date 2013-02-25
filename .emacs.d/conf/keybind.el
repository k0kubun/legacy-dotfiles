;; Keybind

;; C-h to Delete
(keyboard-translate ?\C-h ?\C-?)

;; terminal
(defun open-terminal ()
  (interactive)
  (with-temp-buffer
    (cd "/")
    (shell-command-to-string "open -a terminal")))

;; Force to bind
(setq my-keyjack-mode-map (make-sparse-keymap))
(mapcar (lambda (x)
          (define-key my-keyjack-mode-map (car x) (cdr x))
          (global-set-key (car x) (cdr x)))
        '(("\C-t" . other-window)
          ("\C-o" . open-terminal)
          ("\M-}" . tabbar-forward-tab)
          ("\M-{" . tabbar-backward-tab)
          
          ("\M-T" . elscreen-create)
          ("\M-e" . elscreen-kill)
          ("\M-t" . elscreen-clone)
          ("\M-}" . elscreen-next)
          ("\M-{" . elscreen-previous)
          
          ([(super t)] . elscreen-create)
          ([(super T)] . elscreen-create)
          ([(super w)] . elscreen-kill)
          ([(super })] . elscreen-next)
          ([(super {)] . elscreen-previous)

          ("\M-i" . eval-buffer)
          ))
(easy-mmode-define-minor-mode my-keyjack-mode "Grab keys"
                              t " Keyjack" my-keyjack-mode-map)





;; toggle-truncate-lines
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

