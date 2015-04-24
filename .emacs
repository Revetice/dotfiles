(setq user-full-name "Yilin Li")
(setq user-mail-address "revetice@gmail.com")

;; (setenv "PATH" (concat "usr/local/bin:/bin" (getenv "PATH")))
(require 'cl)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(defvar yilin/packages '(slime
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


(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))



(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq make-backup-files nil)

(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)

(setq column-number-mode t)
(global-linum-mode t)

(load-theme 'wombat t)
