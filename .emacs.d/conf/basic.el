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

(when (eq system-type 'windows-nt)
  ;; asciiフォントをConsolasに
  (set-face-attribute 'default nil
                      :family "Consolas"
                      :height 120)
  ;; 日本語フォントをメイリオに
  (set-fontset-font
   nil
   'japanese-jisx0208
   (font-spec :family "メイリオ"))
  ;; フォントの横幅を調節する
  (setq face-font-rescale-alist
        '((".*Consolas.*" . 1.0)
          (".*メイリオ.*" . 1.15)
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

;; redo+
(when (require 'redo+ nil t)
  ;; C-:にリドゥを割り当てる
  (global-set-key (kbd "C-:") 'redo))

;; multi-term
;; (require 'multi-term)

;; shell-command
;; (global-set-key "\M-s" 'multi-term-next)

;; term に奪われたくないキー
;; (add-to-list 'term-unbind-key-list '"C-t")

;; term 内での文字削除、ペーストを有効にする
;; (add-hook 'term-mode-hook
;;           '(lambda ()
;;              (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
;;              (define-key term-raw-map (kbd "C-y") 'term-paste)
;;              ))


;;recentf
;; (setq recentf-max-saved-items 3000)
;; (setq recentf-exclude '("TAGS$" "/var/tmp"))
;; (require 'recentf-ext)
;; (define-key global-map (kbd "C-c C-c") 'recentf-open-files)


;; gosh
;; (setq scheme-program-name "gosh")
;; (require 'cmuscheme)

;; ;; ウィンドウを２つに分けて、
;; ;; 一方でgoshインタプリタを実行するコマンドを定義します。
;; (defun scheme-other-window ()
;;   "Run scheme on other window"
;;   (interactive)
;;   (switch-to-buffer-other-window
;;    (get-buffer-create "*scheme*"))
;;   (run-scheme scheme-program-name))
;; ;; そのコマンドをCtrl-cSで呼び出します。
;; (define-key global-map
;;   "\C-cS" 'scheme-other-window)

;; ;; 直前/直後の括弧に対応する括弧を光らせます。
;; (show-paren-mode)

;; ;; php-modeのみタブを利用しない
;; (add-hook 'php-mode-hook
;;           '(lambda ()
;;             (setq indent-tabs-mode nil)))

;; ;; C、C++、JAVA、PHPなどのインデント
;; (add-hook 'c-mode-common-hook
;;           '(lambda ()
;;              (c-set-style "bsd")))

;; ;; grep
;; (define-key global-map (kbd "M-t") 'grep-find)
