
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))


(use-package org
  :ensure t
  :init
  (setq org-log-done t)
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda))


(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
  (require 'helm-config)
  (helm-mode 1))

(use-package projectile
  :ensure t
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (setq projectile-completion-system 'helm)
  :config
  (projectile-mode 1))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (add-to-list 'company-backends '(company-capf company-dabbrev)))

(use-package evil
  :ensure t
  :init
  (setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
		evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
		evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
		evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
		evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
		evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
		evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))
  (setq evil-normal-state-cursor '("orange")
  		evil-emacs-state-cursor '("cyan"))
  (setq-default evil-symbol-word-search t)
  :config
  (define-key evil-emacs-state-map (kbd "C-z") 'evil-force-normal-state)
  (define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
  (evil-mode 1))

;; M-x all-the-icons-install-fonts
(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init
  (setq doom-modeline-buffer-file-name-style 'file-name)
  :config
  (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-dracula-brighter-modeline t)
  :config
  (load-theme 'doom-dracula t))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

(use-package flycheck
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (global-set-key (kbd "C-c C-j") 'avy-resume))

;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; built in

;; fix string-trim error
(use-package subr-x)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(column-number-mode)

(global-hl-line-mode)

(global-auto-revert-mode)

(global-superword-mode)

(display-battery-mode)

(setq display-time-24hr-format t)
(display-time-mode t)

(setq show-paren-delay 0)
(show-paren-mode 1)

(which-function-mode 1)

(toggle-frame-fullscreen)

(set-face-attribute 'default nil :height 180)

(setq-default tab-width 4)
(setq inhibit-splash-screen t)
(setq vc-follow-symlinks nil)
(setq scroll-error-top-bottom 'true)
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-initial-delay 0)
(setq confirm-kill-emacs 'y-or-n-p)

;; custom function
(defun find-user-init-file ()
  (interactive)
  (find-file-other-window user-init-file))

(global-set-key (kbd "C-c I") 'find-user-init-file)
(global-set-key (kbd "<f12>") 'find-user-init-file)

;;
;; (load-theme 'zenburn t)
;; (load-theme 'solarized-dark)
;; (load-theme 'dracula)
