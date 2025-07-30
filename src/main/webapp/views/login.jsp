<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        @font-face {
            font-family: 'BMJUA';
            src: url('../fonts/BMJUA_ttf.ttf') format('truetype');
        }

        * {
            font-family: 'BMJUA', sans-serif;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background: #fff;
            padding: 30px;
        }

        .container {
            max-width: 420px;
            margin: 70px auto 0;
            padding: 35px 32px 32px;
            background: #999a9c;
            border-radius: 35px;
            box-shadow: 0 2px 14px rgba(50,50,50,0.13);
        }

        .project-name {
            text-align: center;
            font-size: 1.28em;
            letter-spacing: 0.07em;
            color: #222;
            font-weight: 500;
            margin-bottom: 14px;
        }

        .login-title {
            text-align: center;
            font-size: 1.25em;
            font-weight: bold;
            color: #222;
            margin-bottom: 28px;
        }

        .error-text {
            color: #c0392b;
            font-size: 0.95em;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 23px;
            text-align: left;
        }
        .form-label {
            display: block;
            margin-bottom: 6px;
            font-size: 1.07em;
            color: #181818;
            margin-left: 4px;
            font-weight: 500;
        }
        .form-input {
            width: 100%;
            padding: 11px 10px;
            font-size: 1.07em;
            border: 1px solid #c1c1c1;
            border-radius: 5px;
            outline: none;
            background: #fff;
        }
        .login-btn {
            width: 100%;
            padding: 12px 0;
            background: #222;
            color: #fff;
            font-size: 1.13em;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 7px;
        }
        .signup-link {
            text-align: right;
            margin-top: 18px;
            font-size: 1.08em;
        }
        .signup-link a {
            color: #1677bb;
            text-decoration: none;
        }
        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="project-name">프로젝트 이름</div>
        <div class="login-title">로그인</div>

        <c:if test="${not empty error}">
            <div class="error-text">${error}</div>
        </c:if>

        <form id="loginForm" action="/loginProcess" method="post" autocomplete="off">
            <div class="form-group">
                <label class="form-label" for="id">아이디 (ID)</label>
                <input class="form-input" type="text" id="uname" name="uname" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="pwdMask">비밀번호 (PWD)</label>
                <!-- 사용자에게 별표(*)로만 보이는 입력 -->
                <input class="form-input" type="text" id="pwdMask" autocomplete="new-password" required>
                <!-- 실제 비밀번호는 이 hidden 필드에 담겨 전송 -->
                <input type="hidden" id="password" name="password">
            </div>

            <button class="login-btn" type="submit">로그인</button>
        </form>

        <div class="signup-link">
            <a href="/signup">회원가입</a>
        </div>
    </div>

    <script>
    (function(){
      const maskInput = document.getElementById('pwdMask');
      const realInput = document.getElementById('password');
      const form      = document.getElementById('loginForm');
      let realValue = '';

      // 백스페이스 처리
      maskInput.addEventListener('keydown', e => {
        if (e.key === 'Backspace' || e.key === 'Delete') {
          realValue = realValue.slice(0, -1);
          maskInput.value = '*'.repeat(realValue.length);
          e.preventDefault();
        }
      });

      // 문자 입력 처리
      maskInput.addEventListener('keypress', e => {
        if (e.key.length === 1) {
          realValue += e.key;
          maskInput.value = '*'.repeat(realValue.length);
          e.preventDefault();
        }
      });

      // 폼 제출 전에 실제 비밀번호를 hidden 필드로 복사
      form.addEventListener('submit', () => {
        realInput.value = realValue;
      });
    })();
    </script>
</body>
</html>
