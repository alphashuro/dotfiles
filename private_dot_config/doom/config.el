;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Alpha Shuro")
;;       user-mail-address "john@doe.com")

(setq doom-font (font-spec :family "Monaspace Krypton" :size 13)
      doom-variable-pitch-font (font-spec :family "Monaspace Krypton Var" :size 14))
(setq doom-theme 'doom-monokai-spectrum)
(setq display-line-numbers-type t) ; `t' | `nil' | `relative'

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

(setq org-directory "~/org/")

(add-hook! dired-mode
        ;; Compress/Uncompress tar files
        (auto-compression-mode t)

        ;; Auto refresh buffers
        (global-auto-revert-mode t)

        ;; Also auto refresh dired, but be quiet about it
        (setq global-auto-revert-non-file-buffers t)
        (setq auto-revert-verbose nil)

        ;; Emulate vinegar.vim
        (setq dired-omit-verbose nil)
        (setq dired-hide-details-hide-symlink-targets nil)
        (make-local-variable 'dired-hide-symlink-targets)
        (dired-hide-details-mode t))

(map! :n "-" #'dired-jump)
