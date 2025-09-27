;; Simple "single-file" Emacs configuration.
;; It does not require putting anything additional into .emacs.d, but
;; you still have to install the three packages from MELPA.
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
 '(package-selected-packages
   '(multiple-cursors move-text smex)))
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

;;; handmade-theme.el --- A Handmade theme -*- lexical-binding:t -*-

;; Copyright (C) 2022 Niko Pavlinek

;; This is free and unencumbered software released into the public domain.

;; Anyone is free to copy, modify, publish, use, compile, sell, or distribute
;; this software, either in source code form or as a compiled binary, for any
;; purpose, commercial or non-commercial, and by any means.

;; In jurisdictions that recognize copyright laws, the author or authors of this
;; software dedicate any and all copyright interest in the software to the
;; public domain. We make this dedication for the benefit of the public at large
;; and to the detriment of our heirs and successors. We intend this dedication
;; to be an overt act of relinquishment in perpetuity of all present and future
;; rights to this software under copyright law.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;; For more information, please refer to <http://unlicense.org/>

(deftheme handmade
  "A port of the Emacs theme used by Casey Muratori on the Handmade Hero series.")

(defface handmade-important-face nil "")
(defface handmade-note-face nil "")
(defface handmade-todo-face nil "")

(mapc (lambda (mode)
        (font-lock-add-keywords mode '(("\\<\\(IMPORTANT\\)" 1 'handmade-important-face t)
                                       ("\\<\\(NOTE\\)" 1 'handmade-note-face t)
                                       ("\\<\\(STUDY\\)" 1 'handmade-important-face t)
                                       ("\\<\\(TODO\\)" 1 'handmade-todo-face t)
                                       ("\\<\\(XXX\\)" 1 'handmade-todo-face t))))
      '(c-mode c++-mode emacs-lisp-mode))

(let ((handmade-beige "burlywood3")
      (handmade-dark-blue "midnight blue")
      (handmade-dark-gray "#161616")
      (handmade-dark-green "DarkGreen")
      (handmade-gold "DarkGoldenrod3")
      (handmade-light-beige "#dab98f")
      (handmade-light-gray "gray50")
      (handmade-light-green "#40ff40")
      (handmade-olive "olive drab")
      (handmade-red "Red")
      (handmade-yellow "Yellow"))
  (custom-theme-set-faces
   'handmade
   `(cursor ((t (:background ,handmade-light-green))))
   `(default ((t (:background ,handmade-dark-gray :foreground ,handmade-beige))))
   `(font-lock-builtin-face ((t (:foreground ,handmade-light-beige))))
   `(font-lock-comment-face ((t (:foreground ,handmade-light-gray))))
   `(font-lock-constant-face ((t (:foreground ,handmade-olive))))
   `(font-lock-doc-face ((t (:foreground ,handmade-light-gray))))
   `(font-lock-function-name-face ((t (:foreground ,handmade-beige))))
   `(font-lock-keyword-face ((t (:foreground ,handmade-gold))))
   `(font-lock-string-face ((t (:foreground ,handmade-olive))))
   `(font-lock-type-face ((t (:foreground ,handmade-beige))))
   `(font-lock-variable-name-face ((t (:foreground ,handmade-beige))))
   `(handmade-important-face ((t (:foreground ,handmade-yellow :weight bold :underline t))))
   `(handmade-note-face ((t (:foreground ,handmade-dark-green :weight bold :underline t))))
   `(handmade-todo-face ((t (:foreground ,handmade-red :weight bold :underline t))))
   `(hl-line ((t (:background ,handmade-dark-blue))))))

(enable-theme 'handmade)

;;
;; END OF handmade-theme.el
;;

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

