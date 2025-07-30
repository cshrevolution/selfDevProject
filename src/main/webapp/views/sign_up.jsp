<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <style>
        @font-face {
           font-family: 'BMJUA';
           src: url('../fonts/BMJUA_ttf.ttf') format('truetype');
        } /* ← 빠졌던 닫는 중괄호 */

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
            margin: 70px auto;
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
        .join-title {
            text-align: center;
            font-size: 1.25em;
            font-weight: bold;
            color: #222;
            margin-bottom: 28px;
        }
        .form-group {
            margin-bottom: 23px;
            text-align: left;
            position: relative;
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
            padding: 11px 40px 11px 10px;
            font-size: 1.07em;
            border: 1px solid #c1c1c1;
            border-radius: 5px;
            outline: none;
            background: #fff;
            box-sizing: border-box;
        }
        /* 기본 네이티브 ★ 마스킹 */
        .form-input[type="password"] {
          -webkit-text-security: disc;
        }
        .toggle-pw {
            position: absolute;
            top: 38px;
            right: 10px;
            background: transparent;
            border: none;
            cursor: pointer;
            font-size: 1.2em;
            color: #555;
            padding: 0 5px;
            z-index: 2;
        }
        .join-btn {
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
        .login-link {
            text-align: right;
            margin-top: 18px;
            font-size: 1.08em;
        }
        .login-link a {
            color: #1677bb;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
        .msg-error {
            color: #e04343;
            margin-bottom: 5px;
            font-size: 0.98em;
            min-height: 22px;
        }
        .msg-success {
            color: #098c23;
            margin-bottom: 5px;
            font-size: 0.98em;
            min-height: 22px;
        }
    </style>
    <script>
        function togglePw(id, btn) {
            const pwInput = document.getElementById(id);
            if (pwInput.type === "password") {
                pwInput.type = "text";
                btn.textContent = '🙈'; // 눈 감김 아이콘
            } else {
                pwInput.type = "password";
                btn.textContent = '👁️'; // 눈 뜸 아이콘
            }
        }

        function checkPwMatch() {
            const pw  = document.getElementById("password").value;
            const pwc = document.getElementById("password_confirm").value;
            const msg = document.getElementById("pw-msg");
            if (!pwc) {
                msg.textContent = "";
                msg.className = "";
                return;
            }
            if (pw === pwc) {
                msg.textContent = "비밀번호가 일치합니다.";
                msg.className = "msg-success";
            } else {
                msg.textContent = "비밀번호가 일치하지 않습니다.";
                msg.className = "msg-error";
            }
        }

        function checkForm(e) {
            const pw  = document.getElementById("password").value;
            const pwc = document.getElementById("password_confirm").value;
            if (pw !== pwc) {
                const msg = document.getElementById("pw-msg");
                msg.textContent = "비밀번호가 일치하지 않습니다.";
                msg.className = "msg-error";
                document.getElementById("password_confirm").focus();
                e.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="project-name">프로젝트 이름</div>
        <div class="join-title">회원가입</div>
        <form id="signUpForm"
              action="/signupProcess"
              method="post"
              autocomplete="off"
              onsubmit="return checkForm(event);">

            <div class="form-group">
                <label class="form-label" for="uname">아이디 (ID)</label>
                <input class="form-input" type="text" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="email">이메일 (Email)</label>
                <input class="form-input" type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">비밀번호 (Password)</label>
                <input class="form-input"
                       type="password"
                       id="password"
                       name="password"
                       required
                       oninput="checkPwMatch();">
                <button type="button"
                        class="toggle-pw"
                        onclick="togglePw('password', this)">👁️</button>
            </div>

            <div class="form-group">
                <label class="form-label" for="password_confirm">비밀번호 확인</label>
                <input class="form-input"
                       type="password"
                       id="password_confirm"
                       name="password_confirm"
                       required
                       oninput="checkPwMatch();">
                <button type="button"
                        class="toggle-pw"
                        onclick="togglePw('password_confirm', this)">👁️</button>
                <div id="pw-msg"></div>
            </div>

            <div class="form-group">
                <label class="form-label" for="nickname">닉네임 (선택)</label>
                <input class="form-input" type="text" id="nickname" name="nickname">

            </div>

            <button class="join-btn" type="submit">회원가입</button>
        </form>

        <div class="login-link">
            <a href="/login">로그인</a>
        </div>
    </div>
</body>
</html>
