# sql_study

# Todo List Project

## 1일차. 프로젝트 구상 및 ERD 작성

### 프로젝트 도입 계기

- 기존의 todo-list와 달리, 프로그램 및 다른 사용자의 todo-list를 추천 받을 수 있어 색다른 todo-list를 작성하여 지루한 일상에서 벗어나 색다른 하루를 보낼 수 있도록 함.
- 다른 사용자로부터 나의 todo-list에 대한 좋아요 피드백을 받음으로써 todo-list 작성 및 수행 독려
- 매 일자별 투두리스트 달성률을 표시하여 할 일을 미루지 않고 모두 끝낼 수 있도록 동기 부여
- 메인 화면에 날씨 정보를 함께 보여줌으로써 그날 할 일을 정하는데 필요한 소정의 정보 제공
- 화면 상단에 작게 별자리 운세 정보를 보여줌으로써 오락적인 요소를 갖추어 todo-list 일일 최초 접속 허들을 낮추고자 함.

## 프로젝트 서비스 기능 구상

![1일차회의록](https://github.com/yoojinChung98/java_basic/assets/142370086/0b387f13-ef63-4758-88af-daff5add7e38)

## 프로젝트 화면 구상

### 로그인화면

![wireframe_1](https://github.com/yoojinChung98/sql_study/assets/142370086/238887f1-39ab-48cf-80dd-6164e22166a3)

### 회원가입화면

![wireframe_2](https://github.com/yoojinChung98/sql_study/assets/142370086/f5f62d6b-bc96-41e6-ab0f-4ae47781d437)

### 메인화면

![wireframe_3](https://github.com/yoojinChung98/sql_study/assets/142370086/a580e07b-b808-4040-ab36-e45beaac2f79)

### 리스트공유화면

![wireframe_4](https://github.com/yoojinChung98/sql_study/assets/142370086/09d80dc8-21a7-47f1-8d0c-f06b2ffde21c)

## 테이블 대략적인 논리적모델링 완료

![논리적모델링](https://github.com/yoojinChung98/java_basic/assets/142370086/79f377e7-351b-4632-baaa-9f87dd75cfc9)

<hr/>

## 2일차: 개발 로드맵 논의

### 대략적인 개발 순서에 대한 논의

1. 데이터 모델링 및 테이블 생성 (여기에 사진 들어가면 좋을 듯)
2. 화면 세부사항 구체화 (CSS 및 HTML)
3. 프로그램 코드 작성
4. 프로그램 테스트

### 화면단 구현을 위한 툴 선택

- 피그마
  - 짧은 프로젝트 기간 내에, 세부적인 와이어프레이밍을 마친 뒤 다시 코드를 짜기에는 역부족 일 것이라 생각되어 두 작업을 한 번에 수행할 수 있는 툴인 피그마를 선택

### 프로젝트 파일 세팅 및 깃 원격 레파지토리 생성

- 브랜치명 지정

### 다음 회의 목표

- 피그마로 구체화해온 화면단 코드 통일화 및 디자인 수정
  - 헤더-푸터 : 이종선 / 메인화면 달력: 최정현, 투두리스트: 강태승, 추천리스트: 정유진 / 로그인-회원가입 : 박찬규 / 게시판: 김혜진

<hr/>

## 3일차: 디자인 1차 확립 및 스토리보드 작성을 통한 서비스 구체화

### 화면 디자인 구체화 및 1차 확립

- 피그마를 이용하여 화면을 구현한 뒤, 코드를 추출하기 전 회의를 통해 디자인을 통일함
  ![스크린샷 2023-10-30 214106](https://github.com/yoojinChung98/java_basic/assets/142370086/879382cc-ede3-48c3-b84f-8424ac813de9)
  ![스크린샷 2023-10-30 214202](https://github.com/yoojinChung98/java_basic/assets/142370086/23829dd7-8310-4a2e-b873-b1e72838c4ad)
  ![스크린샷 2023-10-30 214148](https://github.com/yoojinChung98/java_basic/assets/142370086/be9361cc-a629-4ff0-8f5b-107de5607d26)
  ![스크린샷 2023-10-30 214223](https://github.com/yoojinChung98/java_basic/assets/142370086/59095650-e065-4f86-8ebb-3fddaa949d79)
  ![스크린샷 2023-10-30 214236](https://github.com/yoojinChung98/java_basic/assets/142370086/4ff7cd21-a179-4912-9625-c3d28f953cb3)
  ![스크린샷 2023-10-30 214426](https://github.com/yoojinChung98/java_basic/assets/142370086/9bd01ae3-81a6-4ad1-8a36-efcc634db96e)

### 스토리보드 작성

- 다같이 스토리보드를 작성하며 서비스 시 필요한 데이터 및 결과를 구체화함.

### 파트 분배

- 3인 2조로 나눠 화면단과 백엔드 단으로 파트를 분배함
  - 화면단 (): 화면단 디자인 마무리 및 추출한 html, css 소스 코드 정리 및 변수/클래스명 통일화
  - 백단 (): DB 수정 및 생성, 매퍼 테스트, 컨트롤러 테스트, 깃 테스트

### 다음 회의 내용

- 홈페이지 로고

<hr/>

## 4일차: 프론트 / 백 작업 시작

### 프론트

- 폰트 설정 (암스테르담 : https://noonnu.cc/font_page/511 )
- 각 디자인요소 모양, 색상, 크기 획일화
- 로고 생성
  ![TODOK TODOK](https://github.com/yoojinChung98/spring-work/assets/142370086/9f32a427-a5f6-4ba9-af65-8871a10e5ca0)
  ![LOGO_INSIDE](https://github.com/yoojinChung98/spring-work/assets/142370086/761ba9c2-5d39-4a28-8192-21e35613397a) &nbsp;&nbsp;&nbsp;
  ![LOGO_OUTSIDE](https://github.com/yoojinChung98/spring-work/assets/142370086/33dddef0-6287-44fe-b3a9-4fe5720c8001)

### 백

- 테이블 변수명 및 데이터타입 확정
- 기본키 및 외래키 확정
- ERD 작성 및 SQL문 생성
  ![DB_ERD](https://github.com/yoojinChung98/java_basic/assets/142370086/7bd981b1-bb5a-4247-9ed7-106aeeafe7f1)

### todo Table의 기본키 설정

- 처음에는 PK로 user_id, click_date, todo_no 세가지 컬럼을 이용한 복합키를 지정하려고 했음
  - { kim1234, 2023-07-21, 1 }
  - { kim1234, 2023-07-21, 2 }
  - { lee1234, 2023-07-21, 1 }
  - { kim1234, 2023-07-22, 1 }
- 문제점
  - 복합키를 이용하면 todo를 불러올 때 불필요한 시스템부하를 유발할 것
  - 사용자에게 todo_no 값을 보여주는 것이 아니므로 값을 예쁘게 받을 필요가 없음
  -
  - 해결 : 시퀀스를 그냥 하기로 함

### 다음 회의 목표

- 깃 원격 레파지토리 연결

<hr/>

## 5일차(수): 및 코드 추출, 깃 원격 레파지토리 연결

### 화면단: 코드 추출 및 html, css 체크

- https://function12.io/studio 사이트 사용
- 피그마 최종 수정

  - 화면상으로 나타나는 비율 해결
  - 도형 크기 정수화
  - 블러~쉐도우 그룹-> 각요소로 재설정
  - 프레임 -> 데스크탑 프레임으로 변경

  - 백단 목표: 코드 추출 및 코드 수정 작업 진입

### 백단 : 서버와 DB 연동 준비, 협업을 위한 프로젝트 세팅

- 모두 동일하게 연동할 수 있도록 사전준비작업
- 서버 세팅, gitignore에 포함된 파일 세팅
- DB 계정 및 테이블 생성, 프로젝트와 연동

<hr/>

## 6일차(목): 테이블 생성, 깃 pull request 및 merge 연습

### 백

- 백단의 지휘 하에 모든 팀원 프로젝트 세팅 완료
  - 모든 팀원 오라클 계정 및 테이블 생성
    ![image](https://github.com/yoojinChung98/java_basic/assets/142370086/34058cc4-5490-43bd-93f0-19f64609c6f1)
  - 서버와 DB 연결 및 기타 gitignore 파일 세팅

### 프론트

- 피그마 종료. html, css 코드 추출 완료

### 깃 브랜치 확정 및 pull test 완료

![image](https://github.com/yoojinChung98/java_basic/assets/142370086/002994c3-c0c5-4bc3-8e71-0f009e54ca9b)

- master > develop > 각자 이름의 브랜치에서 작업
- master, develop 브랜치 보호

### 일정 조정

- 현재 작업 중인 작업물 마감기한 설정
- 이후 어떤 방식으로 협업을 진행할지 논의
  - 한명당 각 페이지를 담당하고, 가장 기능이 많은 메인페이지는 우선 2인 1조로 시작하기로 결정.
  - 토요일에 백/프론트 연동 이후 더욱 자세히 논의하기로 결정.

### .jsp 파일 및 url 명 규정 완료./ 디스코드 채팅방 정리

![회의록 발췌](https://github.com/yoojinChung98/java_basic/assets/142370086/d77e38ff-c028-481f-b22c-3474294adec1)

### 다음 회의 목표

- 토요일 정오까지 각 목표 완료.
  - 백: 매퍼테스트, 컨트롤러 테스트 완료
  - 프론트: html, css 코드 수정 완료
- 프로젝트 파일에 .jsp 파일 삽입 및 연동 완료

<hr/>

# 시현영상

https://github.com/yoojinChung98/java_basic/assets/142370086/e2ebad00-bd8a-45b1-823a-5cc581127227

# 발표ppt

[TODOK_PROJECTS (1).pptx](https://github.com/yoojinChung98/java_basic/files/13331398/TODOK_PROJECTS.1.pptx)
