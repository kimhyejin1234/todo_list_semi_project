<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="theme-color" content="#000000" />
  <title>Todok Main</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" />
</head>

<body>
  <div class="main-eLH">
    <div class="auto-group-2bkm-y7f">
      <section class="cal">
        <p class="cal-title">Calendar</p>
        <div class="header">
          <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
          <div class="year-month"></div>
          <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
          <button class="nav-btn go-today" onclick="goToday()">Today</button>
        </div>
        <div class="main">
          <div class="days">
            <div class="day">일</div>
            <div class="day">월</div>
            <div class="day">화</div>
            <div class="day">수</div>
            <div class="day">목</div>
            <div class="day">금</div>
            <div class="day">토</div>
          </div>
          <div class="dates"></div>
        </div>
      </section>
      <!-- 여기부터 투두리스트 -->

      <div class="todayslist-j8V">
        <div class="todoheader-bRb">
          <p class="todotitle-ux5">Today’s List</p>
          <p class="tododate-EDf">OOOO년 OO월 OO일</p>
          <div class="remaining-todos">남은 할 일 OO개</div>
        </div>
        <div class="todobody">
          <ul class="todos" id="todos_id"></ul>
        </div>
        <!-- <div class="haveto-Voo"> css 적용 위해 남겨두기
            <img
              class="checkbox-dQD"
              src="${pageContext.request.contextPath}/assets/checkbox-nochecked.png"
            />
            <p class="todotext-A9F">React 공부하기</p>
          </div> -->
        <!-- 투두리스트 입력 폼 -->
        <div class="todo-input">
          <input type="text" id="todoInput" placeholder="오늘의 할 일을 입력하고 ENTER를 눌러주세요" maxlength="16" /><br /><br />

          <div class="addbuttondiv">
            <button class="addTodoButton" onclick="addTodo()">
              <img src="${pageContext.request.contextPath}/assets/doplusbtn-8rD.png" width="46px" height="46px" />
            </button>
          </div>
        </div>

        <!-- <div class="todobottom-62u"> css 적용 위해 남겨두기
            <div class="auto-group-nalr-Q3b">
              할 일을 입력 후 ENTER를 눌러주세요
            </div>
            <img
              class="doplusbtn-sxm"
              src="${pageContext.request.contextPath}/assets/doplusbtn-8rD.png"
            />
          </div> -->
      </div>
      <!-- 여기까지 투두리스트-->

      <!-----------------------------------할일 추천 시작------------------------------------->
      <div class="boardmain-fNy">
        <div class="mostlikemain-jhb">
          <div class="mostliketext-gcq">가장 많은 좋아요를 받은 할 일</div>

          <c:forEach var="i" begin="1" end="4" step="1">
            <div class="mostliketodo1-z7j">
              <div class="profilecircle-i3j" style="background-color: #d9d9d9">
                <!-- profile circle color 받아서 스타일 입력-->
              </div>

              <div class="auto-group-4rdx-2aD">
                <div class="userid-AgR">user ${i}</div>

                <div class="this-is-one-line-content-6py">
                  오늘의 추천 ${i}
                </div>
              </div>

              <div class="auto-group-zp4z-EwB">
                <div class="k-b13">0</div>
                <img class="like-TJ9" src="${pageContext.request.contextPath}/assets/like-RBX.png" />
              </div>
            </div>
          </c:forEach>
        </div>
        <!---------------------------------------End 좋아요 추천 -------------------------------------------------------->
        <button type="button" class="goboardbtn-WWd" onclick="location.href='${pageContext.request.contextPath}/board'">
          go to board
        </button>
      </div>
    </div>

    <div class="mainheader-LrM">
      <div class="headuserprofile-Ewj"></div>
      <div class="auto-group-rn1p-xcq">
        <div class="userid-DHs">${mostLike[0].userId}님, 어서오세요</div>
      </div>
    </div>
  </div>


  <% HttpSession setId=request.getSession(); Object sessioncon=setId.getAttribute("userId"); %>


  <script type="text/javascript">
    if (!sessionStorage.getItem("userId")) {
      console.log("session 없음")
      // var naver_id_login = new naver_id_login("W7Mq7kXYF3dBqzpj2kxG", "http://localhost/todoproject/todok/main");
      // // 접근 토큰 값 출력
      // /*   alert(naver_id_login.oauthParams.access_token); */
      // // const token = naver_id_login.oauthParams.access_token;
      // // fetch('${pageContext.request.contextPath}/todok/login/naver/' + token, {
      // //   method: 'POST',
      // // })
    } else {
      console.log("session 있음")
    }
  </script>
  <script>
    console.log('firstAccess는 true');
    let firstAccess = true;
    // const login = sessionStorage.getItem('login');

    //--------------------------------달력-------------------------
    let date = new Date();

    const renderCalendar = () => {
      //달력 보여주는 함수----
      const viewYear = date.getFullYear();
      const viewMonth = date.getMonth();

      //현재 연도와 월 표시---
      document.querySelector('.year-month').textContent =
        viewYear + '년 ' + (viewMonth + 1) + '월';

      //지난달 마지막날과 이번달 마지막날 ---
      const prevLast = new Date(viewYear, viewMonth, 0); //2022 12 31 토
      const thisLast = new Date(viewYear, viewMonth + 1, 0); // 2023 1 31 화

      const PLDate = prevLast.getDate(); // 지난 달 마지막 날 31일
      const PLDay = prevLast.getDay(); // 지난달 마지막 요일 토요일(6)

      const TLDate = thisLast.getDate(); // 이번달 마지막 날 31일
      const TLDay = thisLast.getDay(); // 이번달 마지막 요일 화요일(2)

      //지난달 이번달 다음달 달력 배열 만들고 합치기
      const prevDates = [];
      const thisDates = [...Array(TLDate + 1).keys()].slice(1);
      const nextDates = [];

      //달력 합치기 ---
      if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
          prevDates.unshift(PLDate - i); //지난달 날짜들 넣어줌
        }
      }
      for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i); // 다음달 날짜 넣어줌
      }

      const dates = prevDates.concat(thisDates, nextDates); // 지난달 이번달 다음달 합쳐주기

      // 기존 이벤트 리스너 제거
      document.querySelectorAll('.this.click').forEach((e) => {
        e.removeEventListener('click', handleClick);
        e.classList.remove('click');
      });

      //화면에 날짜 뿌려주기
      const firstDateIndex = dates.indexOf(1); //이번달 1일의 인덱스 찾기
      const lastDateIndex = dates.lastIndexOf(TLDate); //이번달 막날의 인덱스 찾기

      dates.forEach((date, i) => {
        const condition =
          i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';
        dates[i] =
          '<div class="date"><span class=' +
          condition +
          '>' +
          date +
          '</span></div>';
      });

      document.querySelector('.dates').innerHTML = dates.join('');

      //오늘날짜 표시하기 ---
      const today = new Date();

      if (
        viewMonth === today.getMonth() &&
        viewYear === today.getFullYear()
      ) {
        for (let date of document.querySelectorAll('.this')) {
          if (+date.innerText === today.getDate()) {
            date.classList.add('today');
            break;
          }
        }
      }
      // 화면에 날짜 뿌려준 후에 새로운 이벤트 리스너 등록
      document.querySelectorAll('.this').forEach((e) => {
        e.addEventListener('click', handleClick);
      });
    };

    renderCalendar();

    const prevMonth = () => {
      console.log('prevMonth 동작');
      date.setMonth(date.getMonth() - 1);
      renderCalendar();
    };

    const nextMonth = () => {
      date.setMonth(date.getMonth() + 1);
      renderCalendar();
    };

    const goToday = () => {
      date = new Date();
      renderCalendar();
      updateTodayTodoDate();
    };
    const nonClick = document.querySelectorAll('.this');

    function handleClick(event) {
      // 날짜가 변경될 때, 해당하는 날짜의 todo 리스트를 다시 불러옴(여기 내부에 addtodo? 그거 넣자.).

      // 기존에 선택한 날짜에 대한 클래스를 찾아 제거
      document.querySelectorAll('.this.click').forEach((e) => {
        e.classList.remove('click');
      });

      // 클릭한 div에 "click" 클래스 추가
      event.target.classList.add('click');

      // 클릭한 날짜에 해당하는 투두리스트 날짜표현 업데이트
      const selectedDate = +event.target.innerText;
      updateTodoDate(selectedDate);
      getTodoOfDate(selectedDate);
    }

    nonClick.forEach((e) => {
      e.addEventListener('click', handleClick);
    });

    //투두리스트--------------------------------

    // 날짜 선택시 투두리스트 날짜 업데이트
    function updateTodayTodoDate(selectedDate) {
      let selectedMonth = date.getMonth() + 1;
      let selectedYear = date.getFullYear();
      let todayDate = date.getDate();
      let todoDateElement = document.querySelector('.tododate-EDf');
      todoDateElement.textContent =
        selectedYear + '년 ' + selectedMonth + '월 ' + todayDate + '일';
    }

    updateTodayTodoDate();

    // DB에서 해당하는 날짜에 등록된 todo리스트를 가져오는 함수
    function getTodoOfDate(selectedDate) {
      let selectedMonth = date.getMonth() + 1;
      let selectedYear = date.getFullYear();
      let todoDateElement = document.querySelector('.tododate-EDf');
      let clickDate =
        selectedYear + '년 ' + selectedMonth + '월 ' + selectedDate + '일';

      // let userId = login;
      const userId = 'id2';

      let reqUrl = '/main/todo' + userId + '/' + clickDate;

      fetch(
          '${pageContext.request.contextPath}/main/todo/' +
          userId +
          '/' +
          clickDate
        )
        .then((res) => res.json())
        .then((data) => {
          console.log('비동기요청 완료.');
          console.log(data);

          putTodo(data);
        });
    }

    // 날짜 선택시 투두리스트 날짜 업데이트
    function updateTodoDate(selectedDate) {
      const selectedMonth = date.getMonth() + 1;
      const selectedYear = date.getFullYear();
      const todoDateElement = document.querySelector('.tododate-EDf');
      todoDateElement.textContent =
        selectedYear + '년 ' + selectedMonth + '월 ' + selectedDate + '일';
    }

    document.addEventListener('DOMContentLoaded', function () {
      const todoInput = document.getElementById('todoInput');
      const addButton = document.querySelector('.todo-input button');

      addButton.addEventListener('click', addTodo);
      todoInput.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
          event.preventDefault();
          addTodo();
        }
      });
    });

    function sendTodoToServer(tno) {
      // 1. 보낼 객체 포장
      const req = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          // 'userId': sessionStorage.getItem("login"),
          userId: 'id2',
          clickDate: document.querySelector('.tododate-EDf').textContent,
          todoContent: document.getElementById('todoInput').value,
        }),
      };

      // 2. 비동기 요청 보냄

      fetch('${pageContext.request.contextPath}/main/todo', req)
        .then((res) => res.text())
        .then((data) => {
          console.log('비동기요청 완료.');

          console.log(parseInt(data));
          tno.id = parseInt(data);
        });
    }

    // DB 의 checked 값을 변경하는 로직
    function updateCheckedTodo(tnoValue, checkbox) {
      fetch('${pageContext.request.contextPath}/main/checkedTodo', {
        method: 'put',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          todoNo: parseInt(tnoValue),
          chkBtn: checkbox.checked,
        }),
      });
    }

    function addTodo() {
      const todoInput = document.getElementById('todoInput');
      const todoText = todoInput.value.trim();
      const addButton = document.querySelector('.todo-input button');

      // todo_no  값을 저장할 hidden input 추가
      const tno = document.createElement('input');
      tno.type = 'hidden';
      tno.classList.add('todo_no');
      tno.id = 'todoNo';
      tno.name = 'todoNo';

      if (todoText !== '') {
        // 할 일이 비어있지 않으면 DB에 입력값 INSERT
        sendTodoToServer(tno);

        // 할 일이 비어있지 않으면 투두리스트에 추가
        let todosContainer = document.getElementById('todos_id');
        let newTodoItem = document.createElement('li');

        // 체크박스 추가
        let checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.addEventListener('change', function () {
          // 투두 checked 값을 동기화하기 위해 DB update 함수 호출
          console.log('여기는 addTodo() 속 if 절 속 체크박스 추가!');
          updateCheckedTodo(tno, checkbox);

          // 체크박스 상태에 따라 completed 클래스를 추가 또는 제거
          newTodoItem.classList.toggle('completed', checkbox.checked);
          updateRemainingTodos();
        });

        // 할 일 텍스트 표시
        let todoTextElement = document.createElement('span');
        todoTextElement.textContent = todoText;

        // 삭제 버튼 추가
        let deleteButton = document.createElement('div');
        deleteButton.textContent = '';
        deleteButton.style.display = 'none'; // 초기에는 삭제 버튼을 숨김
        deleteButton.addEventListener('click', (e) => {
          deleteTodo(e);
        });

        // 이미지를 담을 img 요소 생성
        let deleteImage = document.createElement('img');
        deleteImage.src =
          '${pageContext.request.contextPath}/assets/delete-icon.png'; // 이미지 경로 설정
        deleteImage.alt = 'Delete'; // 이미지 대체 텍스트 설정
        deleteButton.appendChild(deleteImage); // 이미지를 삭제 버튼에 추가
        // src="${pageContext.request.contextPath}/assets/like-RBX.png"
        // 마우스 이벤트를 통해 삭제 버튼을 보이게/숨기게 처리
        newTodoItem.addEventListener('mouseover', function () {
          deleteButton.style.display = 'inline-block';
        });

        newTodoItem.addEventListener('mouseout', function () {
          deleteButton.style.display = 'none';
        });

        // 투두 아이템에 체크박스, 텍스트, 삭제 버튼 추가
        newTodoItem.appendChild(tno);
        newTodoItem.appendChild(checkbox);
        newTodoItem.appendChild(todoTextElement);
        newTodoItem.appendChild(deleteButton);
        todosContainer.appendChild(newTodoItem);

        updateRemainingTodos(); // 추가 후 "남은 할 일 n개" 업데이트

        // 추가 후 입력 폼 초기화
        todoInput.value = '';
      }
    }

    // 처음 페이지가 로드되거나 날짜가 변경될 때, todo list 를 비우고 존재하는 todo를 채워넣는 함수
    function putTodo(data) {
      console.log('putTodo 접근완료');

      if (!firstAccess) {
        let todosContainer = document.getElementById('todos_id');
        todosContainer.textContent = '';
      }

      // 요청을 통해 받은 값을 foreach 처럼 하나하나 까면 될 듯?
      for (d of data) {
        // todo_no  값을 저장할 hidden input 추가
        let tno = document.createElement('input');
        tno.type = 'hidden';
        tno.classList.add('todo_no');
        tno.value = d.todoNo;

        // 할 일이 비어있지 않으면 투두리스트에 추가
        let todosContainer = document.getElementById('todos_id');
        let newTodoItem = document.createElement('li');

        // 체크박스 추가
        let checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.checked = d.chkBtn == 1 ? true : false;
        checkbox.addEventListener('change', function () {
          // 투두 checked 값을 동기화하기 위해 DB update 함수 호출
          updateCheckedTodo(tno.value, checkbox);

          // 체크박스 상태에 따라 completed 클래스를 추가 또는 제거
          newTodoItem.classList.toggle('completed', checkbox.checked);
          updateRemainingTodos();
        });

        // 할 일 텍스트 표시
        let todoTextElement = document.createElement('span');
        todoTextElement.textContent = d.todoContent;

        // 삭제 버튼 추가
        let deleteButton = document.createElement('div');
        deleteButton.textContent = '';
        deleteButton.style.display = 'none'; // 초기에는 삭제 버튼을 숨김
        deleteButton.addEventListener('click', (e) => {
          deleteTodo(e);
        });

        // 이미지를 담을 img 요소 생성
        let deleteImage = document.createElement('img');
        deleteImage.src =
          '${pageContext.request.contextPath}/assets/delete-icon.png'; // 이미지 경로 설정
        deleteImage.alt = 'Delete'; // 이미지 대체 텍스트 설정
        deleteButton.appendChild(deleteImage); // 이미지를 삭제 버튼에 추가
        // src="${pageContext.request.contextPath}/assets/like-RBX.png"
        // 마우스 이벤트를 통해 삭제 버튼을 보이게/숨기게 처리
        newTodoItem.addEventListener('mouseover', function () {
          deleteButton.style.display = 'inline-block';
        });

        newTodoItem.addEventListener('mouseout', function () {
          deleteButton.style.display = 'none';
        });

        // 투두 아이템에 체크박스, 텍스트, 삭제 버튼 추가
        newTodoItem.appendChild(tno);
        newTodoItem.appendChild(checkbox);
        newTodoItem.appendChild(todoTextElement);
        newTodoItem.appendChild(deleteButton);
        todosContainer.appendChild(newTodoItem);
      }

      updateRemainingTodos(); // 추가 후 "남은 할 일 n개" 업데이트

      // 추가 후 입력 폼 초기화
      todoInput.value = '';
      firstAccess = false;
    }

    function deleteTodo(e) {
      // 삭제 버튼 클릭 시 해당 투두 아이템 삭제

      console.log('출력시작!!!!!');
      let tno = e.target.parentNode.previousElementSibling.previousElementSibling.previousElementSibling.value;
      console.log(e.target.parentNode);
      console.log(e.target.parentNode.previousElementSibling.previousElementSibling.previousElementSibling);


      let req = {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          'todoNo': tno,
        }),
      };

      fetch('${pageContext.request.contextPath}/main/deleteTodo', req);
      console.log('삭제로직 완료');


      e.target.parentNode.parentNode.remove();
      // this.parentNode.remove();
      updateRemainingTodos(); // 삭제 후 "남은 할 일 n개" 업데이트
    }

    // 남은 할 일 계산 기능 함수
    function updateRemainingTodos() {
      let remainingTodosElement = document.querySelector('.remaining-todos');
      let remainingTodosCount = document.querySelectorAll(
        '.todos li:not(.completed)'
      ).length;
      remainingTodosElement.textContent =
        '남은 할 일 ' + remainingTodosCount + '개';
    }
    //----------------------------------달력----------------------------------------

    window.onload = function () {
      const $mostLikeBox = document.querySelector('.mostlikemain-jhb');

      getTodoOfDate(date.getDate());

      // '가장 많은 좋아요를 받은 할 일' 을 List<dto>로 받아오는 함수
      function getMostLike() {
        fetch('${pageContext.request.contextPath}/main/mostlike')
          .then((res) => res.json())
          .then((data) => {
            if (data == null) return;

            const $mostliketext = $mostLikeBox.firstElementChild;

            const $firstSiblings =
              $mostliketext.nextElementSibling.childNodes;
            const $secondSiblings =
              $mostliketext.nextElementSibling.nextElementSibling.childNodes;
            const $thirdSiblings =
              $mostliketext.nextElementSibling.nextElementSibling
              .nextElementSibling.childNodes;
            const $fourthSiblings =
              $mostliketext.nextElementSibling.nextElementSibling
              .nextElementSibling.nextElementSibling.childNodes;

            $firstSiblings[1].setAttribute(
              'style',
              'background-color: #' + data.mostLike[0].profileColor
            );
            $firstSiblings[3].firstElementChild.textContent =
              data.mostLike[0].userId;
            $firstSiblings[3].firstElementChild.nextElementSibling.textContent =
              data.mostLike[0].content;
            $firstSiblings[5].firstElementChild.textContent =
              data.mostLike[0].boardLikeCnt;

            $secondSiblings[1].setAttribute(
              'style',
              'background-color: #' + data.mostLike[1].profileColor
            );
            $secondSiblings[3].firstElementChild.textContent =
              data.mostLike[1].userId;
            $secondSiblings[3].firstElementChild.nextElementSibling.textContent =
              data.mostLike[1].content;
            $secondSiblings[5].firstElementChild.textContent =
              data.mostLike[1].boardLikeCnt;

            $thirdSiblings[1].setAttribute(
              'style',
              'background-color: #' + data.mostLike[2].profileColor
            );
            $thirdSiblings[3].firstElementChild.textContent =
              data.mostLike[2].userId;
            $thirdSiblings[3].firstElementChild.nextElementSibling.textContent =
              data.mostLike[2].content;
            $thirdSiblings[5].firstElementChild.textContent =
              data.mostLike[2].boardLikeCnt;

            $fourthSiblings[1].setAttribute(
              'style',
              'background-color: #' + data.mostLike[3].profileColor
            );
            $fourthSiblings[3].firstElementChild.textContent =
              data.mostLike[3].userId;
            $fourthSiblings[3].firstElementChild.nextElementSibling.textContent =
              data.mostLike[3].content;
            $fourthSiblings[5].firstElementChild.textContent =
              data.mostLike[3].boardLikeCnt;
          });
      }

      function getNickname(userId) {
        fetch('${pageContext.request.contextPath}/main/nickname/' + userId)
          .then((res) => res.text())
          .then((data) => {
            const $userid = document.querySelector('.userid-DHs');
            console.log(data);
            $userid.textContent = data + '님, 어서오세요';
          });
      }

      getMostLike();
      // 더미데이터 입력해놓음. 나중에 세션에서 가져온 로그인아이디 넣어놓을 것임.
      getNickname('id2');
    };

    document.querySelector('.headuserprofile-Ewj').onclick = () => {
      location.href = '${pageContext.request.contextPath}/myaccount';
    };
  </script>
</body>

</html>