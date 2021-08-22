# 이맥스 자동완성시키기

이맥스의 기본 기능들은 잘 동작하지만 어떤 기능들이 있는지 쉽게 찾기
힘듭니다. `alt-x`로 함수를 실행할 때에도 원하는 함수를 정확히 할고있는
게 아니라면 필요한 함수를 찾기 힘듭니다. ivy나 help 플러그인은 원하는
기능을 쉽게 찾을 수 있게 도와줍니다.

## Ivy, Counsel, Swiper

Ivy는 컨텍스트와 상관없이 이맥스에서 자동완성을 도와주는 도구입니다.
Ivy는 Ivy를 사용해 이맥스의 기본 기능을 개선시킨 함수들을 제공하는데
이를 Counsel이라고 부릅니다. Swiper는 이맥스의 검색 기능(Ctrl-s)를
개선시킨 함수입니다. 이 세 종류의 기능을 보통 함께 사용합니다.

## 설치하기

use-package를 사용해서 쉽게 설치할 수 있습니다. :config 다음의
내용들은 [ivy GitHuub
README.md](https://github.com/abo-abo/swiper#small-config-example)의
예시 설정에서 가져왔습니다.

```elisp
(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))
```

설치한 이후 `alt-x` 를 누르면 예상되는 함수들이 여럿 나오고, 함수 이름
중 일부만 작성해도 원하는 함수를 쉽게 찾을 수 있습니다. 이외에도
도움말이나 검색(`ctrl-x`)도 좀 더 쓰기 편하게 쓸 수 있습니다.

## 잡다한 ivy 팁들

### alt-x 함수 이름 중간부터 검색하기

`alt-x`를 누르면 `^`키가 미리 눌러져 있습니다. `^`는 정규표현식에서
사용하는 기호로 단어의 시작을 의미합니다. 따라서 `^` 이후에 글자를
입력하면 항상 함수 이름의 시작 글자부터 검색하게 됩니다. `^theme`를
검색하면 theme로 시작하는 함수들을 검색합니다. `theme`를 검색하면
theme가 들어간 모든 함수를 검색합니다.

### 띄어쓰기를 사용해서 여러 단어 검색

`theme`를 검색하면 "theme"가 정확히 들어간 함수만 검색합니다. `the
me`를 검색하면 함수 이름에 "the"와 "me"가 포함된 함수를 검색합니다.

## alt-x 팁들

`alt-x`를 눌렀을 때 취소하고 싶으면 `Ctrl-g`를 눌러서 취소할 수 있습니다.
`ctrl-g`는 이맥스 내에서 만능 취소키로 쓰이니 뭔가 잘못된다 싶으면 잔뜩 눌러서
이상한 상태에서 도망칠 수 있습니다.
