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
  (cond ((string-equal hostname "macbook") (list '(width . 100)
                                                 '(height . 51)))
        ((string-equal hostname "iMac") (list '(width . 110)
                                              '(height . 72)))
        ((string-equal hostname "MacBook") (list '(width . 170)
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

;; フォントの設定
(when (eq window-system 'ns)
  ;; asciiフォントをMenloに
  (set-face-attribute 'default nil
                      :family "Menlo"
                      :height 120)
  ;; 日本語フォントをヒラギノ明朝 Proに
  (set-fontset-font
   nil 'japanese-jisx0208
   ;; 英語名の場合
   ;; (font-spec :family "Hiragino Mincho Pro"))
   (font-spec :family "ヒラギノ明朝 Pro"))
  ;; ひらがなとカタカナをモトヤシーダに
  ;; U+3000-303F	CJKの記号および句読点
  ;; U+3040-309F	ひらがな
  ;; U+30A0-30FF	カタカナ
  (set-fontset-font
   nil '(#x3040 . #x30ff)
   (font-spec :family "NfMotoyaCedar"))
  ;; フォントの横幅を調節する
  (setq face-font-rescale-alist
        '((".*Menlo.*" . 1.0)
          (".*Hiragino_Mincho_Pro.*" . 1.2)
          (".*nfmotoyacedar-bold.*" . 1.2)
          (".*nfmotoyacedar-medium.*" . 1.2)
          ("-cdac$" . 1.3))))

;; 現在行のハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; 背景がlightならば背景色を緑に
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; completion
(setq completion-ignore-case t)

;; auto reload buffer
(global-auto-revert-mode 1)

;; ;; grep
;; (define-key global-map (kbd "M-t") 'grep-find)

;; (defun copy-from-osx ()
;;  (shell-command-to-string "pbpaste"))

;; (defun paste-to-osx (text &optional push)
;;  (let ((process-connection-type nil))
;;      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;        (process-send-string proc text)
;;        (process-send-eof proc))))

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)
