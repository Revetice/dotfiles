
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
(setq evil-normal-state-cursor '("orange")
      evil-emacs-state-cursor '("cyan"))
(setq evil-search-module 'evil-search)
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
(load-theme 'solarized-dark)
;; (load-theme 'zenburn t)
;; (load-theme 'dracula)

;;
(toggle-frame-fullscreen)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(set-face-attribute 'default nil :height 180)

(setq inhibit-splash-screen t)
(setq vc-follow-symlinks nil)
(setq scroll-error-top-bottom 'true)
(setq lazy-highlight-cleanup nil)

;;
(defun find-user-init-file ()
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c I") 'find-user-init-file)
(global-set-key (kbd "<f12>") 'find-user-init-file)
