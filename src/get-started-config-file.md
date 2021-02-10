# 설정 파일 시작하기

커스터마이징의 시작과 끝을 설정파일을 꾸미는 것입니다. 설정파일을
변경하고 해당 파일을 emacs가 읽는 것을 확인해 봅시다. 설정파일의
위치가 헷갈리면 조금 고생할 수도 있습니다. 차분히 따라하면 문제 없을
거에요.

## 설정파일 열기

emacs를 켠 뒤 `ctrl-x ctrl-f` 를 입력합니다. 이 때 뜨는 창에서
`~/.emacs.d/init.el` 을 입력하고 엔터를 칩니다. 이렇게 하면 설정파일이
열립니다.

설정파일이 생성되는 위치는 macOS나 Linux라면 home 디렉토리의
emacs.d/init.el에, Windows라면
%HOMEPATH%\AppData\Roaming\.emacs.d\init.el에 생성됩니다.[^1]

[^1]:
  직접 windows에서 확인해보진 않았습니다.
  <http://ergoemacs.org/emacs/emacs_mswin.html> 페이지를 참조했습니다.

## 설정파일을 확인하기

설정파일에 `(message "hi config file")` 을 입력해 봅시다. `Ctrl-x
Ctrl-s`를 눌러 저장한 뒤 emacs를 `Ctrl-x Ctrl-c`로 끕니다. 다시 emacs
를 켠 뒤 `*Messages*` 버퍼에 "hi config file"이 출력되는지 확인합니다.

`Ctrl-x b`로 다른 버퍼를 열 수 있습니다. 버퍼는 이맥스가 연 파일
목록이라고 이해할 수 있습니다. `*Messages*` 를 입력하고 엔터키를
누르면 `*Messages*` 버퍼가 열립니다. `*Messages*` 버퍼는 이맥스가
특별히 취급하는 버퍼로 항상 존재합니다.

## init.el에서 명령어 바로 실행하기

설정파일을 수정할 때마다 emacs를 껐다 켜는 건 귀찮습니다. 이맥스에서
실행하고 싶은 설정 코드의 닫는 괄호 뒤에 커서를 두고 `ctrl-x ctr-e`를
누르면 해당 설정 코드가 실행됩니다. 패키지 설치, 키 매핑 변경 등의
설정은 emacs를 껐다 켜지 않아도 쉽게할 수 있습니다. 익숙해지면 삶의
질이 달라집니다.

중첩된 복잡한 설정 코드가 있을 때 중첩된 명령의 안쪽 서브 코드만 실행하기도 가능합니다.

```elisp
;; 예를들어

(progn
  (message "first");; 이 괄호에서 ctrl-x ctrl-e를 누르면 "first"만 출력됩니다.
  (message "second");; 이 괄호에서 ctrl-x ctrl-e를 누르면 "second"만 출력됩니다.
) ;; 이 괄호에서 ctrl-x ctrl-e 하면 first와 second 모두
;; 출력됩니다.
```

if문처럼 조건문 안의 코드도 쉽게 실행해볼 수 있습니다.

```elisp
(if nil
  (message "true");;여기 닫는 괄호에서 실행하면 "true"가 출력됩니다.
  (message "false")
);; 이 식은 실행하면 "false"만 출력합니다.
```

## 다른 사람의 작업으로부터 영감 얻기

다른 사람의 소스코드를 읽으면 코드를 더 잘 짤 수 있게 되듯이, 다른
사람의 설정 파일을 읽으면 자신의 설정파일을 더 잘 만들 수 있습니다.
여기 참고할만단 다른 설정파일들의 링크를 달아놓겠습니다.

* [Sacha님의 설정
  파일](https://pages.sachachua.com/.emacs.d/Sacha.html#monthly-reviews)
  매주 이맥스 뉴스를 모아서 공유해주시는 Sacha님의 설정파일입니다.
