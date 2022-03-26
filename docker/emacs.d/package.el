(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(setq use-package-always-ensure t)
