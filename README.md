# Flutter 푸드 플랫폼 어플

## 📣 프로젝트 개요

모두가 메뉴 추가를 할 수 있고 모두가 장바구니에 담아 구매를 할 수 있는 플랫폼

<br/>

## 📆 프로젝트 일정

25/04/03 ~ 25/04/09

<br/>

## 📑 주요 기능

> - **상태 관리를 통해** 메뉴를 추가하고 **UI를 동적으로 변경**할 수 있다.
> - **상태 관리를 통해** 장바구니에 메뉴가 없으면 **버튼이 비활성화된다.**
> - Navigator위젯을 통해 **라우팅**을 할 수 있다.

<br/>

## 🚨 TroubleShooting

> Column위젯 자식이 double.infinity를 사용 할 경우

`문제상황` :

- 화면의 모든 크기를 사용하고 싶어 double.infinity를 사용했지만 에러가 발생

`해결과정` :

1. Column, Row, ListView와 같은 레이아웃 관련 위젯은 크기가 없으니 무한으로 키울 수 없다.
2. 그래서 부모 위젯을 만들어 크기의 제한을 두면 에러를 방지할 수 있다.

<br/>

## 💻 발전 시킬 부분

- [ ] 비동기로 서버와 통신을 하는 기능
- [ ] 비동기 처리를 하면서 예외 처리를 하는 기능
- [ ] 카테고리 UI 생성
