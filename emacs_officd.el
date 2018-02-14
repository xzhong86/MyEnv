
;; CUA mode in emacs23
(cua-mode 1)
;(ido-mode 1)
(require 'cmake-mode)

;; No too many #*, *~ files
(setq make-backup-files nil)

;; Don't display the startup screen
(setq inhibit-startup-screen t)

;; =================================================================
;; Out Look of emacs
;; =================================================================
;; set font   // zpzhong
(set-default-font "-misc-fixed-medium-r-normal--20-*-75-75-c-100-iso8859-1")

;; Show clock in status bar
;; Comment out first line if you prefer to show time in 12 hour format
(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)

;; Display the current column number on mode line
(column-number-mode t)

;; Don't display menu bar and tool bar.
(menu-bar-mode 0)
(tool-bar-mode 0)

;; custom change emacs by emacs self
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(scroll-bar-mode (quote right))
 '(verilog-auto-indent-on-newline nil)
 '(verilog-auto-newline nil)
 '(verilog-indent-level 4)
 '(verilog-indent-level-behavioral 4)
 '(verilog-indent-level-declaration 4)
 '(verilog-indent-level-module 4))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;; =================================================================
;; Color setting.
;; Color is also inferenced by .Xdefault and emacs command option
;; =================================================================

;; Set global font lock mode
(global-font-lock-mode '1)
;(global-font-lock-mode t)

;; Set foreground and background. black or dimgrey may be choosed
(set-foreground-color "white")
(set-background-color "Gray22")

;; Set the mouse and cursor color
(set-mouse-color "yellow")
(set-cursor-color "red")

;; Set manual face color
;(set-face-foreground 'info-xref "cyan")
;(set-face-foreground 'info-node "red")

;(setq Man-overstrike-face 'info-node)
;(setq Man-underline-face 'info-xref)

;; Set some font face
(set-face-foreground 'font-lock-comment-face "OrangeRed")
;(set-face-foreground 'font-lock-string-face "CadetBlue1")


;; =================================================================
;; Key Binding
;; =================================================================

;; Set the word search keys
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key global-map [C-f3] 'isearch-forward-regexp)
(define-key global-map [S-f3] 'isearch-backward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)
(define-key global-map [C-S-f3] 'isearch-backward-regexp)

;; Kill buffer/emacs
(global-set-key [C-f4] 'kill-this-buffer)

;; Go to line
(global-set-key [f5] 'goto-line)

;; Switch windows/buffers
(global-set-key [f6] 'other-window)
(global-set-key [S-f6] 'buffer-menu)

;; for HideShow Mode
(global-set-key [f7] 'hs-toggle-hiding)
(global-set-key [S-f7] 'hs-show-all)
(global-set-key [C-f7] 'hs-hide-all)
(global-set-key [C-S-f7] 'hs-minor-mode)

;; compile, modufy bug
(global-set-key [f8] 'next-error)
(global-set-key [S-f8] 'previous-error)
(global-set-key [C-f8] 'first-error)
(global-set-key [C-S-f8] 'compile)

;; Replace
(global-set-key [f9] 'query-replace)
(global-set-key [C-f9] 'query-replace-regexp)
(global-set-key [S-f9] 'query-replace-reg-t)

(defun query-replace-reg-t (to-string)
  (interactive (let (to)
                 (setq to (read-from-minibuffer
                           (format "Query-replace \"%s\" with: "
                                   (get-register t))
                           nil nil nil
                           query-replace-to-history-variable nil t))
                 (list to)))
  (perform-replace (get-register t) to-string t nil nil))

(global-set-key [f10] 'replace-string)
(global-set-key [C-f10] 'replace-regexp)
(global-set-key [S-f10] 'replace-string-reg-t)

(defun replace-string-reg-t (to-string)
  (interactive (let (to)
                 (setq to (read-from-minibuffer
                           (format "Replace \"%s\" with: "
                                   (get-register t))
                           nil nil nil
                           query-replace-to-history-variable nil t))
                 (list to)))
  (perform-replace (get-register t) to-string nil nil nil))

;; Key others
;; Mouse operation
(global-set-key [mouse-3] 'mouse-buffer-menu)

;; Common MSWIN like keys
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)

;; Make the C-% key jump to the matching {}[]() if on another, like VI
(global-set-key [?\C-%] 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Key in special mode
;; Search previour/next issued commend (in shell mode)
(add-hook 'shell-mode-hook
          '(lambda ()
             (define-key shell-mode-map [C-tab]
               'comint-previous-matching-input-from-input)
             (define-key shell-mode-map [C-S-kp-tab]
               'comint-next-matching-input-from-input)))

;; Define/remap key in eshell mode
(add-hook 'eshell-mode-hook
          '(lambda ()
             (define-key eshell-mode-map [C-tab]
               'eshell-previous-matching-input-from-input)
             (define-key eshell-mode-map [C-S-kp-tab]
               'eshell-next-matching-input-from-input)
             (define-key eshell-mode-map [up] 'previous-line)
             (define-key eshell-mode-map [down] 'next-line)
             ))


;; =================================================================
;; zpzhong special
;; =================================================================
;(add-hook 'c-mode-hook '(lambda() (c-set-style "k&r")))
(add-hook 'c-mode-hook '(lambda() (c-set-style "linux")))
(add-hook 'c++-mode-hook '(lambda() (c-set-style "cc-mode")
                            (c-set-offset 'innamespace 0)))
(defun insert-tab-force ()
  "Insert a <tab>"
  (interactive)
  (insert "\t"))
(add-hook 'c-mode-hook
          '(lambda ()
             (define-key c-mode-map [C-tab] 'insert-tab-force)))

(defun insert-pointer-access ()
  "Insert a ->"
  (interactive)
  (insert "->"))
(add-hook 'c-mode-hook
          '(lambda ()
             (define-key c-mode-map [?\C->] 'insert-pointer-access)))

;; show paren {} [] ()
(show-paren-mode 0)

(global-set-key [M-up]  'previous-buffer)
(global-set-key [M-down] 'next-buffer)

;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; =================================================================
;; Shell
;; =================================================================

(shell "shell-0")
(shell "shell-1")

(switch-to-buffer "shell-0")
;; (eshell)
;; (rename-buffer "eshell")
(delete-other-windows)
