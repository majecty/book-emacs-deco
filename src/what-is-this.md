# 이건 무슨 문법이지

다른 사람들이 만든 설정파일을 읽거나, 새로운 플러인을 사용하는 예시
코드를 읽다 보면 어떤 문법인지 궁금할 때가 있습니다. 이 페이지는 그런
물법들을 소개합니다.

## 함수 앞에 #' 붙이기

이전 페이지에서 함수를 인자로 넘길 때 함수 이름 앞에 `'`를 붙인다고
했습니다. 주로 새로운 키를 매핑할 때 자주 사용하게 됩니다. 간혹 `'` 대신
`#'`가 사용되는 것을 볼 수 있습니다. `#'`는 `'`를 쓰는 것과 거의 똑같습니다.
설정파일 수준에서는 그 차이점을 알 필요는 없습니다.

둘이 다른 점은, 다음과 같습니다. `'`는 함수 이외에도 붙일 수 있지만
`#'`는 함수 앞에만 붙입니다. 따라서 컴파일할 때 더 최적화할 여지가
있습니다.

[관련 stack
overflow답변](https://emacs.stackexchange.com/a/35989/11743)입니다.
[관련 emacs lisp manual
글](http://www.gnu.org/software/emacs/manual/html_node/elisp/Anonymous-Functions.html)입니다.

## progn은 무엇인가

간혹 함수를 하나 넣을 자리에 여러 함수를 호출하고 싶을 때가 있습니다.
그럴 땐 progn을 사용하면 됩니다. progn 함수는 다른 언어의 block과
유사합니다. progn 함수의 인자로 여러 함수콜들을 나열하면, progn은
각각의 함수콜을 차례 차례 실행한 뒤 마지막 함수콜의 결과를 반환합니다.

```elisp
;; 아래 코드는 hi메시지를 message 버퍼에 기록하고,
;; 3을 계산한 뒤 버리고, 12를 리턴합니다.
(progn
  (message "hi")
  (+ 1 2)
  (* 1 3 4))
```