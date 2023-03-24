(require 'use-package)
(require 'my-lib)
(require 'treemacs nil t)
(require 'treemacs-evil nil t)
(require 'fzf nil t)

;; treemacs
(use-package treemacs)

;; treemacs-evil
(use-package treemacs-evil
  :after (treemacs evil))

;; a bit more retro flavor
(require 'dired-x)

;; https://github.com/bling/fzf.el
;; An Emacs front-end for fzf.
(use-package fzf)

(defun emacs-project-fzf-find-file ()
  (interactive)
  (if (vc-root-dir)
    (fzf-with-command "git ls-files" #'fzf--find-file (vc-root-dir))
    (fzf-find-file (vc-root-dir))))

(defun emacs-project-grep-file ()
  (interactive)
  (if (vc-root-dir)
    (call-interactively 'vc-git-grep)
    (call-interactively 'rgrep)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key Bindings (F1, F4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; directory/tree views
(global-set-key (kbd "<f4>") 'emacs-project-fzf-find-file)
(global-set-key (kbd "C-<f4>") 'emacs-project-grep-file)

(global-set-key (kbd "C-<f9>") 'treemacs)
(global-set-key (kbd "C-x C-<f9> d") 'dired)
(global-set-key (kbd "C-x 4 C-<f9> d") 'dired-other-window)
;; (global-set-key (kbd "S-<f9>") 'emacs-project-grep-file)
