<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#000000" />
<title>Board</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Inter%3A400" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles/board.css" />
</head>

<body>
	<div class="board-xLZ">
		<div class="auto-group-skmt-U41">
			<img class="todoksidelogo-zHF" id="homeBtn"
				src="${pageContext.request.contextPath}/assets/todoksidelogo-jBw.png" />

			<div class="regboardinputbox-WWV">
				<div class="regboarduserprofile-1y3" name="profileColor"
					id="profileColor"></div>
				<div class="auto-group-d2mf-VdK">
					<div class="regboarduser-dDj" name="nickName" id="nickName"
						readonly></div>
					<textarea class="auto-group-naob-iky" name="content" maxlength="40"
						id="content" placeholder="당신이 생각하는 색다른 할 일을 모두에게 추천해주세요~"
						spellcheck="false"></textarea>
				</div>

				<button type="button" id="registBtn"
					style="margin-top: 88px; border: none; background: transparent">
					<img class="regbtn-8ph"
						src="${pageContext.request.contextPath}/assets/regbtn.png" />
				</button>
			</div>
		</div>

		<div class="boardorderbtn-oA9">
			<button type="button" id="newBtn" value="1"
				class="recomdorderbtn-WqF">등록순</button>
			<button type="button" id="bestBtn" value="2"
				class="latestorderbtn-LpH">인기순</button>
		</div>

		<div id="contentDiv">
			비동기 방식으로 서버와 통신을 진행한 후 목록을 만들어서 붙일 예정.
			<!-- <div class="boardtodo-QZF">
          <div class="boardtodo1-W6V">
            <div class="boardlistprofile-RjF"></div>
            <div class="auto-group-8wsh-Kpd">
              <div class="boardlistuser-rZf">
                efgihilkfkelokwoqktkywidkwnjgl
              </div>
              <div class="boardlistdate-9Ym">2023/10/30 23:47</div>
              <div class="boardlistcontent-fn1">
                여기는 투두리스트 등록 목록입니다. <br />
                두번째 줄입니다. 확인 부탁드립니다.
              </div>
            </div>
            <div class="auto-group-mgfb-PCD">
              <button
                type="button"
                style="border: none; background: transparent"
              >
                <img
                  class="like-XZK"
                  src="${pageContext.request.contextPath}/assets/like-VSR.png"
                />
              </button>
              <p class="heartnum-sdB">2</p>
            </div>
          </div> -->

			<!-- asdf -->

			<!-- <div class="boardtodo2-Lmf">
            <div class="boardlistprofile-TbP"></div>
            <div class="auto-group-bx4y-kqP">
              <div class="boardlistuser-JM7">
                efgihilkfkelokwoqktkywidkwnjgl
              </div>
              <div class="boardlistdate-apR">2023/10/30 23:47</div>
              <div class="boardlistcontent-JkR">
                여기는 투두리스트 등록 목록입니다. <br />
                두번째 줄입니다. 확인 부탁드립니다.
              </div>
            </div>
            <div class="auto-group-htzd-d21">
              <button
                type="button"
                style="border: none; background: transparent"
              >
                <img
                  class="like-yLm"
                  src="${pageContext.request.contextPath}/assets/like-zqf.png"
                />
              </button>
              <p class="heartnum-iJM">2</p>
            </div>
          </div>
          <div class="boardtodo3-PQV">
            <div class="boardlistprofile-7rH"></div>
            <div class="auto-group-omqs-EAD">
              <div class="boardlistuser-y7o">
                efgihilkfkelokwoqktkywidkwnjgl
              </div>
              <div class="boardlistdate-sDB">2023/10/30 23:47</div>
              <div class="boardlistcontent-Bjf">
                여기는 투두리스트 등록 목록입니다. <br />
                두번째 줄입니다. 확인 부탁드립니다.
              </div>
            </div>
            <div class="auto-group-cwts-WG9">
              <button
                type="button"
                style="border: none; background: transparent"
              >
                <img
                  class="like-rau"
                  src="${pageContext.request.contextPath}/assets/like-3n1.png"
                />
              </button>
              <p class="heartnum-om3">2</p>
            </div>
          </div>
          <div class="boardtodo4-6EM">
            <div class="boardlistprofile-1MK"></div>
            <div class="auto-group-4nj3-iWd">
              <div class="boardlistuser-FWZ">
                efgihilkfkelokwoqktkywidkwnjgl
              </div>
              <div class="boardlistdate-ANd">2023/10/30 23:47</div>
              <div class="boardlistcontent-VA1">
                여기는 투두리스트 등록 목록입니다. <br />
                두번째 줄입니다. 확인 부탁드립니다.
              </div>
            </div>
            <div class="auto-group-ovem-oRb">
              <button
                type="button"
                style="border: none; background: transparent"
              >
                <img
                  class="like-xJV"
                  src="${pageContext.request.contextPath}/assets/like-n9f.png"
                />
              </button>
              <p class="heartnum-WL1">2</p>
            </div>
          </div>
        </div> -->

			<!-- asdf -->
		</div>
	</div>

	<script>

      document.getElementById('homeBtn').onclick = () => {
        location.href = '${pageContext.request.contextPath}/main';
      };
  

      //글 목록 함수 호출
      let str = '';
      let page = 1;
      let isFinish = false;
      let reqStatus = false;
      let selectNum; // 등록순(1), 인기순(2)
  
      const $contentDiv = document.getElementById('contentDiv');

      let likeImg = null;
  
      const userId = '${login}';
  
      const $nickName = document.getElementById('nickName');
      
  
	// 화면 들어오면 무조건 등록된 자료를 일단 조회    
      window.onload = function () {
        document.getElementById('homeBtn').onclick = () => {
          location.href = '${pageContext.request.contextPath}/main';
        };

        selectNum = 1;
        getNickName(userId);
    
        getList(1, true, selectNum, userId);
  
        return;
      };
  
	// 닉네임 가져오는 함수
      function getNickName(userId) {
   
        fetch('${pageContext.request.contextPath}/board/getNickName/' + userId, {
          method: 'post',
          headers: {
            'Content-Type': 'application/json',
          },
        })
          .then((res) => res.json())
          .then((data) => {
            $nickName.insertAdjacentHTML('afterbegin', data.nickName);
	        document.getElementById('profileColor').style.backgroundColor =
            '#' + data.profileColor;
          });
       
      } // 닉네임 끝

	//추천 글 등록 버튼 클릭 
      document.getElementById('registBtn').onclick = () => {
        insertBoard();
      };
  
    //최신 조회순 버튼 클릭
      document.getElementById('newBtn').onclick = () => {
  		selectNum = 1;
        //글 목록 함수 호출
	    str = '';
	    page = 1;
	    isFinish = false;
	    reqStatus = false;
    	getList(1, true, selectNum, userId);
    	
      };
      
     //인기 조회순  조회
      document.getElementById('bestBtn').onclick = () => {
      
        selectNum = 2;
        str = '';
	    page = 1;
	    isFinish = false;
	    reqStatus = false;
        getList(1, true, selectNum, userId);
    
      };
  
  	// 추천글 입력
      function insertBoard() {
        const content = document.getElementById('content').value;
  
        if (userId === '') {
          alert('로그인이 필요한 화면입니다');
          return;
        } else if (content === '') {
          alert('추천 할일을 입력해 주세요.');
  
          document.getElementById('content').focus();
  
          return;
        }
  
        const formData = new FormData();
  
        formData.append('content', document.getElementById('content').value); //글 내용 추가
        formData.append('userId', userId); //작성자 추가
  
        //FormData객체를 보낼 때는 따로 headers 설정을 진행하지 않습니다.
        fetch('${pageContext.request.contextPath}/board/regist', {
          method: 'post',
          body: formData,
        })
          //응답 데이터는 text 로 전달합니다.(uploadSuccess)
          //file input 내용을 비워 주시고, 글 영역 비워 주시고,
          //class 이름이 fileDiv(미리보기)영업을 감춰 주세요 --> display 속성을 none 으로.
          .then((res) => res.text())
          .then((data) => {
            document.getElementById('content').value =
              '당신이 생각하는 색다른 할 일을 모두에게 추천해주세요~'; //file input 비우기
            // textarea의 내용을 가져오는 부분 수정
  
            document.getElementById('content').onclick = () => {
              document.getElementById('content').value = '';
            };
  
            selectNum = 1;
            str = '';
		        page = 1;
		        isFinish = false;
		        reqStatus = false;
            getList(page, true, selectNum, userId);
          });
      } //추천 등록 끝
  
      
  
      //추천 등록 list 함수
      function getList(page, reset, selectNum, userId) {
  
        str = '';
        isFinish = false;
        
        fetch('${pageContext.request.contextPath}/board/getList', {
          method: 'post',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            page: page,
            selectNum: selectNum,
            userId: userId,
          }),
        })
          .then((res) => res.json())
          .then((list) => {
            // console.log(list.length);
            if (list.length <= 0) {
              isFinish = true;
              reqStatus = true;
              return;
            }
  
            if (reset) {
              while ($contentDiv.firstChild) {
                $contentDiv.firstChild.remove();
              }
              page = 1;
            }
            for (board of list) {
              let parseTimeCall = parseTime(board.boardRegdate);
  
 
              if (board.likeFlag === '1') {
                likeImg = 'like-VSR.png';
              } else {
                likeImg = 'like-empty.png';
              }
              
              str +=
                `
                <div class="boardtodo-QZF">
                  <div class="boardtodo1-W6V">
                    <div class="boardlistprofile-RjF" style="background-color: #` +
                board.profileColor +
                `"></div>
                <div class="auto-group-8wsh-Kpd">
                  <div class="boardlistuser-rZf">` +
                    board.nickName +
                    `</div>
                    <input type="hidden" value="`+ board.boardBno +`" />
                    <div class="boardlistdate-9Ym">` +
                      parseTimeCall +
                `</div>
              <div class="boardlistcontent-fn1">` +
                board.content +
                `
                </div>
            </div>
            <div class="auto-group-mgfb-PCD "  id='likeCountParent' >
              <a
                id="likeBtn"
                style="border: none; background: transparent"
              >
              <img
                  class="like-XZK"
                  id="likeImg"
                  name="` + board.likeFlag + ` ` + board.boardBno + `"
                  src="${pageContext.request.contextPath}/assets/`+ likeImg +`"
              >
              
              </a>
              <p class="heartnum-sdB" class="likeCountDiv" name = 'likeCount' id='likeCount'>` +
              board.likeCount +
              `</p>  
              </div>
            </div>
          </div>`;
                
            }
            if (!reset) {
              $contentDiv.insertAdjacentHTML('beforeend', str);
            } else {
              $contentDiv.insertAdjacentHTML('afterbegin', str);
            }
  
            isFinish = true;
          }); //end fetch
   



        } //추천 등록 list 함수


		//무한 스크롤 시작
        const handleScroll = _.throttle(() => {
           
           /*
                   쓰로틀링 - 일정한 간격으로 함수를 실행.
                   쓰로틀링은 사용자가 이벤트를 몇번이나 발생시키든, 일정한 간격으로
                   한 번만 실행하도록 하는 기법.
                   마우스 움직임, 스크롤 이벤트 같은 짧은 주기로 자주 발생하는 경우에 사용하는 기법 (lodash 라이브러리를 이용해 구현)
                   -> 쓰로틀이 랜더링을 1초에 한번씩만 되도록 강제해줌 -> 랜더링 문제가 사라짐.
                   - 이 기능을 브라우저엔 없어서 쓰로틀을 호출해서 사용해야 한다!
               */
   
        
           const scrollPosition = window.pageYOffset;
           const height = document.body.offsetHeight;
           const windowHeight = window.innerHeight;
   
           if (isFinish) {
             if (scrollPosition + windowHeight >= height * 0.9) {
               //스크롤이 전체 바의 길이의 90% 이상 내려왔냐?
               // console.log('next page call!');
             
               getList(++page, false,  selectNum, userId); //getList -> getLikeList로 변경
           
             }
           }
         }, 1000);   //무한 스크롤 끝
        
        
         
         //무한 스크롤 페이징
         //브라우저 창에서 스크롤이 발생할 때마다 이벤트 발생!
         window.addEventListener('scroll', () => {
           if (!reqStatus) handleScroll();
         });
 
 


        var boardBno;
        // onclick이벤트가 자꾸 null값이라고 값을 못찾아서 아예 반복문이 끝난
        // 여기다가 이벤트를 걸어보겠음.
          //좋아요 버튼 기능 구현 시작
         $contentDiv.addEventListener('click', (e) => {
            // 일단 button -> a 기능 막기

            if (userId === '') {
          		alert('로그인이 필요한 합니다');
          		return;
       		 } ;
            
            
            
            
            e.preventDefault();
            if (!e.target.matches('#likeBtn') && !e.target.matches('#likeImg')) {
              return;
            }
            
            var FlagAndBno = e.target.getAttribute('name');
            
            // string 타입으로 값 뻄.
            boardBno = FlagAndBno.toString().substring(2,FlagAndBno.toString().length);
            var likeFlag = FlagAndBno.toString().substring(0,1);

        
            // 목적 : like_board에 좋아요 정보 업데이트 하기 위해서 비동기 요청
            fetch('${pageContext.request.contextPath}/board/likeupdate', {
              method: 'post', //조회 요청이 아니기 때문에 post
              headers: {
                'Content-Type': 'application/json',
              },
              body: JSON.stringify({
                userId: userId,
                likeFlag: likeFlag,
                boardBno: boardBno,
              }),
            })
            .then(res => res.json())
            .then(data => {
              if(data.message === "InsertSuccess"){
                // 1. likeFlag -> 1로 변경해줘야함.
                FlagAndBno = data.likeFlag + ' ' + boardBno;
                e.target.setAttribute('name' , FlagAndBno);


                // 2. 하트 회색 -> 빨간색으로 변경 need
                e.target.setAttribute(
                'src',
                '${pageContext.request.contextPath}/assets/like-VSR.png'
                );

                // 3. likeCount값 밀어넣기. <p>태그의 값에 밀어 넣기
                const parentDiv = e.target.closest('div');
                let pContent = parentDiv.querySelector('p').innerHTML;
                parentDiv.querySelector('p').innerHTML = data.likeCount;

              }else{

                // 1. likeFlag -> 1로 변경해줘야함.           
                FlagAndBno = data.likeFlag + ' ' + boardBno;
                e.target.setAttribute('name' , FlagAndBno);
                
                // 2. 하트 빨간색 -> 회색 으로 변경 need
                e.target.setAttribute(
                'src',
                '${pageContext.request.contextPath}/assets/like-empty.png'
                );

                // 3. likeCount값 밀어넣기. <p>태그의 값에 밀어 넣기
                  const parentDiv = e.target.closest('div');
                  let pContent = parentDiv.querySelector('p').innerHTML;
                  parentDiv.querySelector('p').innerHTML = data.likeCount;
              }
            })

           
          })  // LIKE UPDATE  끝

      //댓글 날짜 변환 함수
      function parseTime(regDate) {
        let time =
          regDate[0] +
          '.' +
          regDate[1] +
          '.' +
          regDate[2] +
          '. ' +
          regDate[3] +
          ' : '+
          regDate[4];
        
        return time;
      }
    </script>
</body>
</html>