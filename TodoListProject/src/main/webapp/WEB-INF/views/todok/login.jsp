<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.net.URLEncoder" %>
    <%@ page import="java.security.SecureRandom" %>
      <%@ page import="java.math.BigInteger" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

          <%-- <%@ include file="../include/header.jsp" %> --%>
            <!DOCTYPE html>
            <html>

            <head>
              <meta charset="utf-8" />
              <link rel="icon" href="/favicon.ico" />
              <meta name="viewport" content="width=device-width, initial-scale=0.8" />
              <meta name="theme-color" content="#000000" />
              <title>Todok Login</title>
              <link rel="stylesheet" href="${pageContext.request.contextPath}/font/AmSeuTeReuDam.ttf" />
              <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro%3A400" />
              <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter%3A400" />
              <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/login.css" />
              <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
                charset="utf-8"></script>
              <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
            </head>

            <body>


              <img class="todoksidelogo-qmK" id="miniLogo"
                src="${pageContext.request.contextPath}/assets/todoksidelogo-eNM.png" />
              <div class="login-o3w">
                <div class="loginheader-74d">
                  <img class="todoktitle-x5F" src="${pageContext.request.contextPath}/assets/todoktitle.png" />
                </div>


                <form action="" method="post" name="loginForm">
                  <div class="loginbox-6BT">
                    <div class="auto-group-xsar-2L1">
                      <div class="inputbox-mYV">
                        <input name="userId" class="auto-group-jqam-tND" type="text" placeholder="id"></input>
                        <input name="userPw" class="auto-group-yafk-2sj" type="password" placeholder="password"></input>
                      </div>
                      <button type="submit" class="loginbtn-ghP" id="loginBtn">로그인</button>
                    </div>
                    <div class="joinbtn-KEZ">
                      <div class="kakaojoinbtn-sG5">
                        <button type="button" class="kakaojointext-ofX">
                          카카오 아이디
                          <br />
                          회원가입
                        </button>
                      </div>
                      <div class="naverjoinbtn-qcD">
                        <div class="naver_id_login">
                          <a href="naver-login">
                            <button type="button" class="naverjointext-Ns3" id="naver_id_login">
                              네이버 아이디
                              <br />
                              회원가입
                            </button>
                          </a>
                        </div>
                      </div>
                      <button type="button" class="joinbtn-3CV"><a
                          href="${pageContext.request.contextPath}/todok/join">회원가입</a></button>
                    </div>
                  </div>
                </form>


                <div class="joinfooter-fzZ">
                  <div class="footerline"></div>
                  <div class="joinfootertext-YYZ">문의하기 sakdjfa@naver.com 개발자: 김혜진 강태승 박찬규 이종선 정유진 최정현</div>
                </div>
              </div>

              <% HttpSession setId=request.getSession(); Object sessioncon=setId.getAttribute("userId"); %>



                <script type="text/javascript">



                  if (sessionStorage.getItem('userId')) {



                    var targetPage = "${pageContext.request.contextPath}/todok/main";

                    // 리다이렉션 수행
                    window.location.href = targetPage;
                  }





                  // 네아로 설정 주석처리
                  // var naver_id_login = new naver_id_login("W7Mq7kXYF3dBqzpj2kxG", "http://localhost/todoproject/todok/main");
                  // var state = naver_id_login.getUniqState();
                  // naver_id_login.setButton("white", 2, 40);
                  // naver_id_login.setDomain("http://localhost/todoproject/todok/login");
                  // naver_id_login.setState(state);
                  // naver_id_login.setPopup();
                  // naver_id_login.init_naver_id_login();


                  /* console.log(state); */


                  // sessionStrorage에 저장해놨던 userId담은 변수 sessioncon
                  const sessioncon = '<%= sessioncon %>';
                  console.log("세션가져옴", sessioncon);


                  const msg = '${result}';
                  if (msg === 'Success') {
                    alert('로그인 성공함')
                    sessionStorage.setItem('userId', sessioncon);
                    var targetPage = "${pageContext.request.contextPath}/todok/main";

                    // 리다이렉션 수행
                    window.location.href = targetPage;

                  } else if (msg === 'Fail') {
                    // 실패하면 경고만 띄움
                    alert('로그인 실패');
                  }

                  document.getElementById('loginBtn').onclick = () => {
                    if (document.loginForm.userId.value === '') {
                      alert('아이디를 입력하지 않으셨습니다');
                      return;
                    }
                    if (document.loginForm.userPw.value === '') {
                      alert('비밀번호를 입력하지 않으셨습니다.');
                      return;
                    }
                  }

























                </script>
            </body>