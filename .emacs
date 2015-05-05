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
	smex
	ecb
	ggtags
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

;; smex
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; For common lisp
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Disable unused interface
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (menu-bar-mode -1)

;; recentf
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; Maximize frame at initial
(setq initial-frame-alist
  (quote((fullscreen . maximized))))

;; Modes settings
(setq column-number-mode t)
(global-linum-mode t)
(show-paren-mode t)
;; (global-hl-line-mode t)
;; Miscs
(setq make-backup-files nil)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

(load-theme 'wombat t)
(load "dired-x")

(setq-default tab-width 4)
(global-visual-line-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

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

;; CEDET
(require 'cedet)
(global-ede-mode t)
(semantic-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
