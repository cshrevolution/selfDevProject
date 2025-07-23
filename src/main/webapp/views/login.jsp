<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
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
        .login-title {
            margin-bottom: 28px;
            font-size: 1.25em;
            font-weight: bold;
            color: #222;
            text-align: center;
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
			margin: 0;
			padding: 11px 40px 11px 10px;  /* 오른쪽 40px은 눈아이콘 여백 */
			font-size: 1.07em;
			border: 1px solid #c1c1c1;
			border-radius: 5px;
			outline: none;
			background: #fff;
			box-sizing: border-box;
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
            display: block;
            margin-top: 18px;
            text-align: right;
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
    <div class="project-name">프로젝트 이름</div>
    <div class="container">
        <div class="login-title">로그인</div>
        <form action="/login" method="post" autocomplete="off">
            <div class="form-group">
                <label class="form-label" for="uname">아이디 (ID)</label>
                <input class="form-input" type="text" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="password">비밀번호 (PWD)</label>
                <input class="form-input" type="password" id="password" name="password" required>
            </div>
            <button class="login-btn" type="submit">로그인</button>
        </form>
        <div class="signup-link">
            <a href="/signup">회원가입</a>
        </div>
    </div>
</body>
</html>
