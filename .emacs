;; Simple "single-file" Emacs configuration.
;; It does not require putting anything additional into .emacs.d, but
;; you still have to install the packages from MELPA.
;;
;; = Quickstart
;; Just use this as your config and run
;;
;;   package-install-selected-packages
;;
;; once.
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("117f7dfb273bb39b83a228018ccffeb85ba0983c5d4a63155a5a48ad7f7c7c86"
     default))
 '(package-selected-packages '(ef-themes move-text multiple-cursors smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Basic configuration

(setq inhibit-startup-screen t)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq vc-follow-symlinks t)

;; Indents
(setq-default c-basic-offset 4)
(setq c-default-style "stroustrup")

(setq-default indent-tabs-mode nil
              tab-stop-list    ()
              tab-width        4)

(setq scroll-conservatively most-positive-fixnum)
(setq ring-bell-function 'ignore)
(global-auto-revert-mode t)
(global-display-line-numbers-mode t)

(setq backup-directory-alist '(("." . "~/.saves/")))

(set-language-environment "UTF-8")

;; ido
(ido-mode t)

;; smex
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; move-text
(require 'move-text)
(move-text-default-bindings)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; simpc-mode
;; TODO: check if it's present and only then use it

(load "~/.emacs.d/simpc-mode.el")
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; ef-themes
(use-package ef-themes
  :init
  :config
  (load-theme 'ef-dream))

