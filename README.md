# 싸이월드 미니 프로젝트 | Spring STS

![111](https://github.com/user-attachments/assets/a4aab84d-0880-4ca5-8db1-e0c021e29f4e)

<br>

## 프로젝트 소개

공부를 위해 스프링 STS를 메인으로 사용해 미니홈피 싸이월드를 만들어보았습니다.

<br>

## 개발 언어

![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white)
![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
![JAVA](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![SPRING](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![ORACLE](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white)

<br>

## 개발 기간

2024.05.07 ~ 2024.05.14

<br>

## 멤버 및 역할

### 김종민(조장)
  - DB 설계 및 구축
  - 사진첩, 방명록, 일촌평 등 게시판 기능 구현
  - 비밀번호 찾기 기능 구현
  - 전체 파일 통합

### 오승빈
  - 로그인, 회원가입 기능 구현
  - 홈, 프로필 페이지 구현

### 한다솔
  - 다이어리 페이지 구현
  - 아이디 찾기 기능 구현

### 박서경
  - 메인 페이지 디자인 구현

<br>

## 프로젝트 구조

```markdown
src
├── main
│   ├── java
│   │    ├── mini.interceptor
│   │    ├── miniDiary
│   │    ├── miniGuest
│   │    ├── miniHome
│   │    ├── miniLogin
│   │    ├── miniPhoto
│   │    └── miniProfile
│   └── resources
│   │    ├── config.mybatis
│   │    │    ├── dao-context.xml
│   │    │    ├── SqlMapConfig.xml
│   │    │    ├── login.xml
│   │    │    └── ...
│   │    └── db.properties
│   │ 
│   └── webapp
│        ├── resources
│        ├── WEB-INF
│        │     ├── spring
│        │     │    └── appServlet
│        │     │          └── servlet-context.xml
│        │     └── views
│        │          ├── homeL.jsp
│        │          ├── homeR.jsp
│        │          └── ...
│        │
│        ├── index.jsp
│        └── main.jsp
│
└── ...
```

<br>

## 기능

### 회원가입
 - 메인페이지에서 회원가입 버튼을 누르면 회원가입 창으로 이동한다.
 - 기본 정보를 적고 유효한 정보가 들어갔을 경우애 회원가입이 된다.

<br>

### 로그인
  - 회원가입한 아이디, 비밀번호를 입력 시에 로그인이 된다.

<br>

### 아이디 찾기
 - 비밀번호와 이메일 입력 시에 아이디를 찾을 수 있다.

<br>

### 비밀번호 찾기
  - 비밀번호와 이메일 입력 시에 비밀번호를 찾을 수 있다.

<br>

### 미니홈피 홈
  - 메인페이지에서 미니홈피 버튼을 누를 시에 홈화면으로 이동한다.
  - 홈 화면에는 사진과 글귀, 일촌평 등이 나타난다.
  - 로그인 시에는 정보가 나타나고 로그인을 하지 않을 시에는 나타나지 않는다.

<br>

### 일촌평
  - 홈 화면 하단에 일촌평을 남길 수 있다.

<br>

### 프로필
  - 프로필 창으로 이동시에 로그인한 계정의 프로필 사진과 글이 나타난다.

<br>

### 다이어리
  - 다이어리 창으로 이동시에 다이어리 글 목록이 최신순으로 나타난다.
  - 오른쪽 상단의 버튼을 통해 글을 작성할 수 있다.
  - 글 목록에 수정, 삭제 버튼으로 글을 수정, 삭제할 수 있다.
  - 글 하단에 댓글을 달 수 있다.
  - 글 개수가 3개가 넘어갈 시에 다음 페이지로 넘어간다.

<br>

### 사진첩
  - 사진첩 창으로 이동시에 사진첩 사진과 글이 최신순으로 나타난다.
  - 오른쪽 상단의 버튼을 통해 글을 작성할 수 있다.
  - 글 목록에 수정, 삭제 버튼으로 글을 수정, 삭제할 수 있다.
  - 글 하단에 댓글을 달 수 있다.
  - 글 개수가 3개가 넘어갈 시에 다음 페이지로 넘어간다.
<br>

### 방명록
  - 방명록 창으로 이동시에 방명록 글 목록이 최신순으로 나타난다.
  - 오른쪽 상단의 버튼을 통해 글을 작성할 수 있다.
  - 글 목록에 수정, 삭제 버튼으로 글을 수정, 삭제할 수 있다.
  - 글 하단에 댓글을 달 수 있다.
  - 글 개수가 3개가 넘어갈 시에 다음 페이지로 넘어간다.

<br>

## 소감

처음부터 DB 설계와 전체적인 틀을 잡는 과정이 중요하다는 것을 깨달았다. 진행하다 보니 처음에 설계한 것에서 많은 변화를 주어야 했고,
그에 따라 시간이 더욱 소요되었기 때문이다. 또한, 처음에는 프로필 수정과 로그인한 계정에 따라 다이어리, 사진첩, 방명록 등을 따로 분리하고 싶었는데,
시간이 넉넉하지 않아 원하는 결과 값들을 전부 하지 못한 것이 아쉽다. 하지만, 팀원 분들과 작업을 하면서 협업하는 재미도 느낄 수 있었고,
모든 코드들을 합치는 과정에서 나와는 다른 방식으로 풀어내는 것들을 보며 배울 수 있어서 좋았다.
