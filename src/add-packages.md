# 패키지 추가하기

꾸미기의 시작은 패키지입니다. 다른 사람들이 만들어 둔 유용한 도구들을
잔뜩 설치해서 나만의 이맥스를 만들어 봅시다.

emacs에서 패키지를 관리하는 방식은 여러가지가 있습니다. 그 중
use-package를 사용한 방법을 알려드리겠습니다. use-package는 패키지
설치와 설정을 한 곳에 묶을 수 있어 설정파일 관리를 더 쉽게 만들어
줍니다.

## use-package 설치하기

use-package를 설치하고 나면 다른 패키지들은 쉽게 설치할 수 있습니다.
하지만 use-package는 use-package로 설치할 수 없기 때문에 약간의 귀찮은
과정을 거쳐야 합니다.

### melpa 저장소 추가

```elisp
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
```

use-package package는 melpa에서 다운받을 수 있습니다. 위 세 줄을 emacs
설정 파일에 추가해 주세요.

emacs의 패키지들은 elpa와 melpa에서 다운받을 수 있습니다. elpa는
이맥스 공식 레포지토리며 melpa에 비해 패키지를 올리기가 어렵습니다.
melpa는 공식 레포는 아니지만 쉽게 패키지를 올릴 수 있고 이미 많은 패키지들이 올라가 있습니다.[^elpa-melpa]

[^elpa-melpa]: StackOverflow의 [이
    답변](https://emacs.stackexchange.com/a/270/11743)이 잘 설명하고
    있습니다.

### package-install 명령으로 use-package 설치하기

melpa 저장소를 추가했다면(위의 세 줄을 작성한 뒤 이맥스를 껐다 켜거나,
하나 하나 `ctrl-x ctrl-e`로 실행해 주세요.) package-install 명령어로
use-package를 설치할 수 있습니다.

`alt-x`를[^alt-meta] 누르시면 이맥스 화면 아래에 emacs 함수를 실행할
수 있는 창이 하나 뜹니다. 앞으로 이 창을 매우 많이 쓸 예정입니다. 이
창에서 `package-refresh-contents`를 치고 엔터를 쳐주세요. 이맥스가
melpa의 패키지 목록을 다운받아 올 거에요. 잠시 시간이 걸릴 수
있습니다.

다시 `alt-x`를 치고 `package-install`을 치고 엔터를 칩니다. 그러면
이맥스가 설치할 패키지를 물어볼텐데 여기에 "use-package"를 입력하고
엔터를 쳐주세요. 별다른 에러가 나지 않았다면 "use-package" 패키지가 잘 설치된 겁니다.

[^alt-meta]: 이맥스에서는 alt 대신 M 혹은 meta를 자주 씁니다. 이
    글에서는 alt를 쓸게요. alt와 meta의 관계는 좀 복잡합니다. 여기서
    다루진 않을게요.

### use-package 설정하기

설정파일에 아래 두 줄의 코드를 추가합니다.[^use-package-config]

``` elisp
(eval-when-compile
  (require 'use-package))
```

위 두 라인을 실행하면 use-package 설정이 끝납니다.

[^use-package-config]: [use-package README.md의 Getting
    started](https://github.com/jwiegley/use-package#getting-started)
    챕터에 적혔는 내용입니다.

### 첫 번째 패키지: doom-modeline 설치하기

emacs의 버퍼 아래엔 현재 수정하고 있는 파일이 무엇인지 보여주는 한
줄의 ui가 있습니다. 이를 mode line이라고 부릅니다. 기본 UI가 투박하기
때문에 많은 사람들이 이 UI를 개선해서 사용합니다. doom-modeline도
mode-line을 꾸며주는 패키지 입니다.

```elisp
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
```

위 세 줄을 설정파일에 추가하고 실행합니다. 그러면 doom-modeline의 설치
밎 설정이 끝납니다. 참 쉽죠. 위에 보시면 `(after-init .
doom-modeline-mode)` 코드가 있습니다. 이는 use-package의 인자로
emacs가 켜졌을 때 `(doom-modeline-mode)` 함수를 실행하라는 의미입니다.
emacs를 껐다 켜기 귀잖으신 분들은 `alt-x` 누른 뒤
`doom-modeline-mode`를 실행하여 수동으로 킬 수도 있습니다. 실행하시면
modeline이 깔끔해진 것을 볼 수 있습니다.
