
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

;; fix string-trim error
(require 'subr-x)

;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;
(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;;
(global-set-key "\C-s" 'swiper)

;;
(require 'evil)
(setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "DarkGoldenrod2" :foreground "black")))
      evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
      evil-insert-state-tag   (propertize " <I> " 'face '((:background "chartreuse3"    :foreground "black")))
      evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
      evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
      evil-visual-state-tag   (propertize " <V> " 'face '((:background "gray"           :foreground "black")))
      evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))
(define-key evil-emacs-state-map (kbd "C-z") 'evil-force-normal-state)
(define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
(setq evil-normal-state-cursor '("orange")
      evil-emacs-state-cursor '("cyan"))
;; (setq evil-search-module 'evil-search)
(setq-default evil-symbol-word-search t)
(evil-mode 1)

;;
(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(setq projectile-completion-system 'helm)

;;
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;;
(global-flycheck-mode)

;;
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;
(require 'company)
(setq company-idle-delay 0)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends '(company-capf company-dabbrev))

;;
(toggle-frame-fullscreen)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(column-number-mode)

(global-hl-line-mode)

(setq display-time-24hr-format t)
(display-time-mode t)

(setq-default tab-width 4)

(setq show-paren-delay 0)
(show-paren-mode 1)

(which-function-mode 1)

(set-face-attribute 'default nil :height 180)

(setq inhibit-splash-screen t)
(setq vc-follow-symlinks nil)
(setq scroll-error-top-bottom 'true)
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-initial-delay 0)

;;
(defun find-user-init-file ()
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c I") 'find-user-init-file)
(global-set-key (kbd "<f12>") 'find-user-init-file)

;;
(require 'all-the-icons)
;; M-x all-the-icons-install-fonts

;;
(require 'doom-modeline)
(setq doom-modeline-buffer-file-name-style 'file-name)
(doom-modeline-mode 1)

;;
(require 'doom-themes)
;; (load-theme 'doom-one t)
(load-theme 'doom-dracula t)

;;
;; (load-theme 'zenburn t)
;; (load-theme 'solarized-dark)
;; (load-theme 'dracula)
