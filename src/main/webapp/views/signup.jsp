<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <style>
        body {
            background: #fff;
            font-family: 'Segoe UI', '맑은 고딕', Arial, sans-serif;
        }
        .container {
            max-width: 420px;
            margin: 70px auto 0 auto;
            padding: 35px 32px 32px 32px;
            background: #999a9c;
            border-radius: 35px;
            box-shadow: 0 2px 14px rgba(50,50,50,0.13);
        }
        .project-name {
            margin: 46px auto 14px auto;
            text-align: center;
            font-size: 1.28em;
            letter-spacing: 0.07em;
            color: #222;
            font-weight: 500;
        }
        .join-title {
            margin-bottom: 28px;
            font-size: 1.25em;
            font-weight: bold;
            color: #222;
            text-align: center;
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
		    margin: 0;
		    padding: 11px 40px 11px 10px;  /* 오른쪽 40px은 눈아이콘 여백 */
		    font-size: 1.07em;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
		    outline: none;
		    background: #fff;
		    box-sizing: border-box; /* ← 중요! */
		}
        .toggle-pw {
			position: absolute;
			top: 34px;
			right: 10px;  /* ← px로! */
			background: transparent;
			border: none;
			cursor: pointer;
			font-size: 1.18em;
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
            display: block;
            margin-top: 18px;
            text-align: right;
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
                btn.innerHTML = "&#128065;"; // 눈 아이콘 (열림)
            } else {
                pwInput.type = "password";
                btn.innerHTML = "&#128065;"; // 눈 아이콘 (닫힘)
            }
        }

        function checkPwMatch() {
            var pw = document.getElementById("password").value;
            var pwc = document.getElementById("password_confirm").value;
            var msg = document.getElementById("pw-msg");
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
            var pw = document.getElementById("password").value;
            var pwc = document.getElementById("password_confirm").value;
            if (pw !== pwc) {
                document.getElementById("pw-msg").textContent = "비밀번호가 일치하지 않습니다.";
                document.getElementById("pw-msg").className = "msg-error";
                document.getElementById("password_confirm").focus();
                e.preventDefault();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="project-name">프로젝트 이름</div>
    <div class="container">
        <div class="join-title">회원가입</div>
        <form action="/sign_up" method="post" autocomplete="off" onsubmit="return checkForm(event);">
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
                <input class="form-input" type="password" id="password" name="password" required
                       oninput="checkPwMatch();">
                <button type="button" class="toggle-pw" onclick="togglePw('password', this)">&#128065;</button>
            </div>
            <div class="form-group">
                <label class="form-label" for="password_confirm">비밀번호 확인</label>
                <input class="form-input" type="password" id="password_confirm" name="password_confirm" required
                       oninput="checkPwMatch();">
                <button type="button" class="toggle-pw" onclick="togglePw('password_confirm', this)">&#128065;</button>
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
