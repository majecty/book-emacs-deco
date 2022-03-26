# lsp 설치해서 자동완성하기

프로그래밍을 하기 위해서 emacs를 쓸 때가 많습니다.
Visual Studio나 IntelliJ 같은 IDE는 무겁기도 무겁지만 그만큼 많은 기능을 제공합니다.
특히 객체 뒤에 `.`을 붙여서 가능한 메쏘드의 리스트를 완성시키는 기능은 무척 편리합니다.
하지만 Vim이나 Emacs에서도 비슷한 기능이 잘 동작한다는 사실 알고 계신가요?
LSP는 Language Server Protocol의 약자로 소스코드를 수정할 때 도움이 되는 기능들의 명세입니다.
이를 구현한 서버가 있으면 어느 편집기에서든 쉽게 해당 서버를 사용해서
멋진 기능들을 사용할 수 있습니다.

## 설치

다음 설정을 init.el에 넣어서 설치할 수 있습니다.
```elisp
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))
```

자세한 내용은 [lsp-mode의
페이지](https://emacs-lsp.github.io/lsp-mode/page/installation/)에서
볼 수 있습니다.

