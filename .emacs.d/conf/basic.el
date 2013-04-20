;; Basic

;; alias
(defalias 'exit 'save-buffers-kill-emacs)
(defalias 'yes-or-no-p 'y-or-n-p)

;; window
(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(unless (eq window-system 'ns)
  (menu-bar-mode 0))
(setq inhibit-startup-screen t)

;; frame size
(setq hostname (system-name))
(setq custom-frame
  (cond ((string-equal hostname "macbook") (list '(width . 171)
                                                 '(height . 51)))
        ((string-equal hostname "iMac") (list '(width . 171)
                                              '(height . 73)))
        ((string-equal hostname "MacBook") (list '(width . 171)
                                              '(height . 82)))
        (t (list '(width . 120)
                 '(height . 40)))))

(setq default-frame-alist
      (append custom-frame
              default-frame-alist))

;; bar
(column-number-mode t)
(size-indication-mode t)
(display-time-mode t)
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))
(setq frame-title-format "%f")

;; japanese
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; tab
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; theme
(if window-system (progn (set-frame-parameter nil 'alpha 90)))
(load-theme 'deeper-blue t)

;; backup and autosave
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; Fonts
(when (eq window-system 'ns)
  (set-face-attribute 'default nil
                      :family "Menlo"
                      :height 120)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "ヒラギノ明朝 Pro"))
  (set-fontset-font
   nil '(#x3040 . #x30ff)
   (font-spec :family "NfMotoyaCedar"))
  (setq face-font-rescale-alist
        '((".*Menlo.*" . 1.0)
          (".*Hiragino_Mincho_Pro.*" . 1.2)
          (".*nfmotoyacedar-bold.*" . 1.2)
          (".*nfmotoyacedar-medium.*" . 1.2)
          ("-cdac$" . 1.3))))

;; completion
(setq completion-ignore-case t)

;; auto reload buffer
(global-auto-revert-mode 1)

;; Mark Tabs and fullwidth space
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))

;; highlight current line
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#113377"))
    (((class color)
      (background light))
     (:background "#CC0066"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; trailing whitespace
(setq-default show-trailing-whitespace t)

;; linum
(global-linum-mode t)
