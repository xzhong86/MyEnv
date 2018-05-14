
;(load "desktop")
;(desktop-load-default)


;(desktop-read)

;; Info
(load "info")

;; A nice buffer handling
;(load "msb")

(setq inhibit-startup-screen t)

;; =================================================================
;; Behavior of emacs
;; =================================================================
;; command history length
(custom-set-variables
 '(history-length 500)
 '(comint-input-ignoredups 't)
 '(comint-input-ring-size 500)
 '(line-number-display-limit 500000)
 '(font-lock-maximum-size 500000))

;; shell/comint Completion
(custom-set-variables
 '(comint-completion-fignore '("~" "#" "%" ".o"))
 '(shell-completion-fignore '("~" "#" "%"))
 '(comint-completion-autolist nil))

;(partial-completion-mode)

;; No new line due to cursor move
(custom-set-variables '(next-line-add-newlines nil))

(put 'narrow-to-region 'disabled nil)
(auto-compression-mode)

;; No too many #*, *~ files
(setq make-backup-files nil)

;; This maps edit keys to standard Windows keystokes. It requires the
;; library cua-mode.el from Kim Storm at the following URL:
(cua-mode t)

;; Suppress echoing when a subprocess asks for a password
(defcustom comint-password-prompt-regexp
  "\\(\\([Oo]ld \\|[Nn]ew \\|Kerberos \\|'s \\|login \\|^CVS \\|^\\)\
[Pp]assword\\( (again)\\)?\\|pass phrase\\|Enter passphrase\\)\
\\( for [^@ \t\n]+@[^@ \t\n]+\\)?:\\s *\\'"
  "*Regexp matching prompts for passwords in the inferior process.
This is used by `comint-watch-for-password-prompt'."
  :type 'regexp
  :group 'comint)

(add-hook 'comint-output-filter-functions
  'comint-watch-for-password-prompt)

;; Let the emacsclient can be runed
;(setenv "IN_EMACS" "in_emacs")
;(load "resume")
;(add-hook 'suspend-hook 'resume-suspend-hook)
;(add-hook 'suspend-resume-hook 'resume-process-args)
;(server-start)

;; =================================================================
;; Out Look of emacs
;; =================================================================
;; set font   // zpzhong
(set-default-font "-misc-fixed-medium-r-normal--20-140-100-100-c-100-iso8859-1")
;(set-default-font "-misc-fixed-medium-r-normal--18-*-100-100-c-90-iso8859-9")
;; Show clock in status bar
;; Comment out first line if you prefer to show time in 12 hour format
(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)

;; Display the current column number on mode line
(column-number-mode t)

;; Set sub-mouse-menu min number
(setq mouse-buffer-menu-mode-mult 2)

;; Don't display menu bar. Type M-x menu-bar-mode to display it
(menu-bar-mode '-1)
;; Don't display tool bar. Type M-x tool-bar-mode to display it
(if (not (equal (getenv "HOSTTYPE") "sparc"))
    (tool-bar-mode '-1))

;; Scroll bar place
(custom-set-variables '(scroll-bar-mode (quote right)))
;(custom-set-variables '(scroll-bar-mode (quote left)))

;; Make temp buffer size min
(temp-buffer-resize-mode '1)

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
(set-face-foreground 'info-xref "cyan")
(set-face-foreground 'info-node "red")

(setq Man-overstrike-face 'info-node)
(setq Man-underline-face 'info-xref)

;; Set some font face
;(set-face-foreground 'font-lock-comment-face "red")
;(set-face-foreground 'font-lock-comment-face "Coral")
(set-face-foreground 'font-lock-comment-face "OrangeRed")
;(set-face-foreground 'font-lock-string-face "CadetBlue1")
;(set-face-foreground 'font-lock-variable-name-face "yellow")
;(set-face-foreground 'font-lock-function-name-face "CadetBlue1")

;; =================================================================
;; Key Binding
;; =================================================================

;; Key F1 ~ F12
;; Book mark 1
(global-set-key [f1] 'bookmark-jump-default1)
(defun bookmark-jump-default1 (pos)
  "Set a default bookmark 1 default-bookmark1 at current position"
  (interactive "d")
  (bookmark-jump "default-bookmark1")
  (bookmark-set "default-bookmark1"))

(global-set-key [C-f1] 'bookmark-set-default1)
(defun bookmark-set-default1 (pos)
  "Jump to the default bookmark 1 default-bookmark1"
  (interactive "d")
  (bookmark-set "default-bookmark1"))

;; Book mark 2
(global-set-key [f2] 'bookmark-jump-default2)
(defun bookmark-jump-default2 (pos)
  "Set a default bookmark 2 default-bookmark2 at current position"
  (interactive "d")
  (bookmark-jump "default-bookmark2")
  (bookmark-set "default-bookmark2"))

(global-set-key [C-f2] 'bookmark-set-default2)
(defun bookmark-set-default2 (pos)
  "Jump to the default bookmark 2 default-bookmark2"
  (interactive "d")
  (bookmark-set "default-bookmark2"))

(global-set-key [S-f2] 'bookmark-jump)
(global-set-key [S-C-f2] 'bookmark-set)

;; Set the word search keys
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key global-map [C-f3] 'isearch-forward-regexp)
(define-key global-map [S-f3] 'isearch-backward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)
(define-key global-map [C-S-f3] 'isearch-backward-regexp)

;; Kill buffer/emacs
(global-set-key [C-f4] 'kill-this-buffer)
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Alternative copy/paste
(global-set-key [f4] 'copy-to-register-t)
(defun copy-to-register-t (start end)
  "Copy the selected region into a default register, t"
  (interactive "r")
  (copy-to-register t start end)
  (if transient-mark-mode (setq deactivate-mark t)))

(global-set-key [S-f4] 'insert-register-t)
(defun insert-register-t (pos)
  "Insert the contents of default register, t, into current position"
  (interactive "d")
  (insert-register t 1))

;; Go to line
(global-set-key [f5] 'goto-line)
;(global-set-key [S-f5] '(set-mark-command pos))


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
;(global-set-key [C-f8] 'first-error)
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

;; Split/combine windows
;(global-set-key [f11] 'delete-other-windows)
;(global-set-key [S-f11] 'delete-window)
;(global-set-key [f12] 'split-window-vertically)
;(global-set-key [S-f12] 'split-window-horizontally)


;; Key others
;; Mouse operation
(global-set-key [mouse-3] 'mouse-buffer-menu)

;; Common MSWIN like keys
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)
;(global-set-key "\C-p" 'pwd)
;(global-set-key [C-backspace] 'backward-kill-word)
(global-set-key [C-delete] 'kill-word)
(global-set-key [C-S-delete] 'kill-whole-line)
(defun kill-whole-line ()
  "Kill the whole line the cursor located"
  (interactive)
  (beginning-of-line nil)
  (kill-line nil)
  (kill-line nil))

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
	       'comint-next-matching-input-from-input)
	     (define-key shell-mode-map [C-S-kp-tab]
	       'comint-previous-matching-input-from-input)))


;; =================================================================
;; zpzhong special
;; =================================================================
;(add-hook 'c-mode-hook '(lambda() (c-set-style "k&r")))
(add-hook 'c-mode-hook '(lambda() (c-set-style "linux")))
(defun insert-tab-force ()
  "Insert a <tab>"
  (interactive)
  (insert "\t"))
(add-hook 'c-mode-hook
	  '(lambda ()
	     (define-key c-mode-map [C-tab] 'insert-tab-force)))

;; show paren {} [] ()
(show-paren-mode 0)

;; =================================================================
;; zpzhong special, plugin
;; =================================================================
; for swbuff, [C-f6]/[S-C-f6] will be set in swbuff.el.
;(load "/home/zpzhong/usr/share/emacs/swbuff.el" nil t t)
;(require 'swbuff)
;(setq swbuff-exclude-buffer-regexps 
;     '("^ " "\\*.*\\*"))
;(setq swbuff-status-window-layout 'scroll)
;(setq swbuff-clear-delay 5)
;(setq swbuff-separator "|")
;(setq swbuff-window-min-text-height 1)
(global-set-key [M-up]  'previous-buffer) 
(global-set-key [M-down] 'next-buffer) 

;
(add-to-list 'Info-directory-list "/usr/share/info")
(add-to-list 'Info-directory-list "/usr/local/share/info")
(add-to-list 'Info-directory-list "/home/zpzhong/usr/share/info")

;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;(server-start)

;; =================================================================
;; Shell
;; =================================================================

(shell)
(rename-buffer "shell-1")
(shell)
(rename-buffer "shell-0")

(switch-to-buffer "shell-1")
(switch-to-buffer "shell-0")


;; =================================================================
;; load user local emacs initial file if it exists
;; =================================================================

;(load "~/.l_emacs" t t t)
(put 'scroll-left 'disabled nil)
