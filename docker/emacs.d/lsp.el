(use-package lsp-mode :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil))
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (java-mode . lsp))
         ;; if you want which-key integration
;;         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)


(use-package lsp-java :ensure t)
(use-package lsp-treemacs)
