;; Require common lisp features
(require 'cl)

;; Environment related
(setq user-full-name "Yilin Li")
(setq user-mail-address "revetice@gmail.com")
(setq set-language-environment 'English)
;; (setenv "PATH" (concat "usr/local/bin:/bin" (getenv "PATH")))


;; Package related
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(defvar yilin/packages
  '(slime
	;;sublimity
	org)
  "Default packages")

(defun yilin/packages-installed-p ()
  (loop for pkg in yilin/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (yilin/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg yilin/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Ido
(require 'ido)
(ido-mode t)

;; For common lisp
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Disable unused interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Maximize frame at initial
(setq initial-frame-alist
  (quote((fullscreen . maximized))))

;; Modes settings
(setq column-number-mode t)
(global-linum-mode t)
(show-paren-mode t)
(global-hl-line-mode t)
;; Miscs
(setq make-backup-files nil)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

(load-theme 'wombat t)

(setq-default tab-width 4)
(global-visual-line-mode t)

;; Seems conflicts with ido-mode
;; (ffap-bindings)

;; Verilog hook
(defun my-verilog-hook ()
  (setq verilog-indent-level 4)
  (setq verilog-indent-level-module 4)
  (setq verilog-indent-level-declaration 4)
  (setq verilog-indent-level-behavioral 4)
  (setq verilog-cexp-indent 0)
  (setq verilog-case-indent 4)
  (local-set-key (kbd "TAB") 'self-insert-command)
  (local-set-key (kbd "<backspace") 'delete-backward-char)
  (setq backward-delete-char-untabify-method nil))

(add-hook 'verilog-mode-hook 'my-verilog-hook)
