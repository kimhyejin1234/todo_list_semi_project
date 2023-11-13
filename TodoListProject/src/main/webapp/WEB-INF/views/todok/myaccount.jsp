<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <title>Todok MyAccount</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/myaccount.css" />

    <!-- colorpicekr : pickr -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@simonwep/pickr/dist/themes/classic.min.css" />
  </head>

  <body>
    <div class="myaccount-Grd">
      <div class="profilebox-xUZ">
        <div class="profile-FTf">
          <div class="auto-group-rhqm-mgu">
            <div class="profilcricle-tmX" style="background-color:#${profBox.profileColor};"></div>
            <div class="userid-maR">${profBox.nickname}</div>
          </div>
          <div class="auto-group-cga5-FVb">
            <div class="auto-group-mokv-Pbo">
              <div class="k-WRX">${profBox.boardLikeCnt}</div>
              <div class="like-CJM">like</div>
            </div>
            <!-- <img class="divlnprofile-q6R" src="REPLACE_IMAGE:162:336" /> -->
            <div class="whiteline"></div>
            <div class="auto-group-ezzz-YmX">
              <div class="item-50-dny">${profBox.boardCnt}</div>
              <div class="my-list-hXw">my list</div>
            </div>
          </div>
        </div>
        <div class="mypagemenu-3ER">
          <button type="button" class="logout-qs3">Logout</button>
        </div>
        <img class="todoksidelogo-LMw" src="${pageContext.request.contextPath}/assets/todoksidelogo-CDw.png" />
      </div>
      <div class="auto-group-pd2h-Dgd">
        <div class="mypagetitle-MH3">My Account</div>


        <form action="${pageContext.request.contextPath}/myaccount/update" method="post" name="updateForm">
          <div class="auto-group-ynrd-PUd">
            <div class="auto-group-ktu7-K7P">
              <div class="auto-group-eq3f-q5j">
                <div class="infoname-L2V">
                  <input type="hidden" name="userId" id="userId" value="${userInfo.userId}" />
                  <div class="infotitle-FfF">name</div>
                  <input type="text" name="name" id="name" class="infovalue-jqK" readonly value="${userInfo.name}" />
                </div>
                <div class="infonickname-BxD">
                  <div class="infotitle-Y25">nickname</div>
                  <input type="text" name="nickName" id="nickName" class="infovalue-2xq" value="${userInfo.nickName}"
                    placeholder="새로운 닉네임" />
                </div>
                <div class="infoemail-sTf">
                  <div class="infobox-buT"></div>
                  <div class="infotitle-tNm">email</div>
                  <input type="text" name="email" id="email" class="infovalue-CPT" readonly value="${userInfo.email}" />
                </div>
              </div>
              <div class="editpic-skV">
                <div class="infotitle-CXs">profile color</div>
                <div class="profilcricle-XKF" id="previewColor" style="background-color:#${profBox.profileColor};">
                </div>


                <!-- 커스텀 -->
                <div class="color-picker">
                  <input type="color" id="profileColor" name="profileColor" value="#ff0000" />
                </div>



              </div>
            </div>
            <div class="auto-group-vc2d-nFB">
              <div class="infopassword-5zy">
                <div class="infotitle-R3F">password</div>
                <input type="password" name="userPw" id="userPw" class="infovalue-vkh" placeholder="새로운 비밀번호를 입력해주세요" />
                <input type="password" name="userPwCheck" id="userPwCheck" class="infochk-qsf"
                  placeholder="입력한 비밀번호를 다시 입력해주세요" />
              </div>
              <div class="auto-group-3imf-usX">
                <button type="button" class="compledit-qWH">수정완료</button>
                <button type="button" class="canceledit-EoK">취소</button>
              </div>
            </div>
          </div>
        </form>


      </div>
    </div>

    <script src="script.js"></script>
    <script>
      // 프로필컬러 피커 
      document.addEventListener('DOMContentLoaded', function () {
        const profileColor = document.getElementById('profileColor');
        const previewColor = document.getElementById('previewColor');

        // 컬러피커 색상 동기화
        profileColor.addEventListener('input', function () {
          const color = profileColor.value;
          previewColor.style.backgroundColor = color;
        });
      });










      let pwFlag = true;
      let pwcFlag = true; //정규표현식 유효성 검사 여부 판단. 

      // 닉네임검증과 비밀번호 검증은 회원가입에서 사용한 검증법과 동일하게 적용
      // 검증을 통과했다면, update를 할 수 있도록 하면됨.

      // 검증이 통과되고 난 뒤에 DB 업데이트가 일어날 요청
      // 1. 일단 value를 가져오고
      // 2. fetch말고 redirect 할거임
      // 3. 요청을 받으면 무지성으로 update 갈겨~



      // 수정완료 버튼을 누르면 검증 시작
      document.querySelector('.compledit-qWH').onclick = (e) => {
        console.log('수정완료 검증');


        if (document.getElementById('nickName').value.trim() === '') {
          console.log('닉네임 인증(폼)');
          alert('닉네임을 입력해주세요.');
          document.getElementById('nickName').focus();
          return;
        }

        // 비밀번호가 입력되지않았으면 확인검사는 생략하고 닉네임만 수정할 것.
        if (document.getElementById("userPw") === '' &&
          document.getElementById("userPwCheck") === '') {

          /*비밀번호 형식 검사 스크립트*/
          var pw = document.getElementById("userPw");

          var regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
          // 비밀번호 숫자, 영문 대, 소문자 를포함하여 8~16 사이 
          if (regex.test(document.getElementById("userPw").value.trim())) {
            document.getElementById("userPw").style.backgroundColor = "rgb(150 255 160 / 50%)";
            pwFlag = true;
          } else {
            document.getElementById("userPw").focus();
            alert('비밀번호는 영문+숫자로 10자 이상 입력해주세요.');
            pwFlag = false;
          }

          /*비밀번호 확인검사*/
          var pwConfirm = document.getElementById("userPwCheck");
          console.log('비밀번호 유효성검사 시작')
          var regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;
          if (regex.test(document.getElementById("userPwCheck").value.trim())) {
            if (document.getElementById("userPwCheck").value.trim() == document.getElementById("userPw").value
              .trim()) {
              document.getElementById("userPwCheck").style.backgroundColor = "rgb(150 255 160 / 50%)";
              pwcFlag = true;
            }
          } else {
            document.getElementById("userPwCheck").focus();
            alert('비밀번호가 잘 입력되었는지 확인해주세요');
            pwcFlag = false;
          }
        }


        if (pwFlag && pwcFlag) {


          // 모든 값이 유효하다면 confirm 띄우고 요청보냄.
          if (confirm('회원정보를 수정하시겠습니까?')) {
            console.log('서브밋 하겠음');
            document.updateForm.submit();
          } else {
            return;
          }

        } else {
          alert('비밀번호를 다시 확인해주세요.');
          return;
        }
      };



      // 취소버튼을 누르면 기존의 값으로 다시 세팅해줄 것.
      document.querySelector('.canceledit-EoK').onclick = () => {

        if (!confirm('변경사항을 되돌리시겠습니까?')) {
          return;
        }
        document.getElementById("nickName").value = "${userInfo.nickName}";

        document.getElementById("profileColor").setAttribute('style', 'background-color:#${profBox.profileColor};');

        document.getElementById("userPw").value = "";

        document.querySelector('.infochk-qsf').value = "";
      };

      // 로그아웃버튼
      document.querySelector('.logout-qs3').onclick = () => {
        if (!confirm('로그아웃하시겠습니까?')) {
          return;
        }
        sessionStorage.removeItem('login');
        location.href = '${pageContext.request.contextPath}/main';
      };

      // 로고클릭 -> main.jsp 로 이동
      document.querySelector('.todoksidelogo-LMw').onclick = () => {
        location.href = '${pageContext.request.contextPath}/main';
      };
    </script>


  </body>

  </html>