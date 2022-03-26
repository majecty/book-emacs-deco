(customize-save-variable 'custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "package.el")
(load-user-file "auto-complete.el")
(load-user-file "lsp.el")

(use-package magit
  :ensure t)
;; (use-package projectile)
;; (use-package flycheck)
;; (use-package yasnippet :config (yas-global-mode))
;; (use-package hydra)
;; (use-package company)
;; (use-package lsp-ui)
;; (use-package which-key :config (which-key-mode))
;; (use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
;; (use-package dap-java :ensure nil)
;; (use-package helm-lsp)
;; (use-package helm
;;   :config (helm-mode))

