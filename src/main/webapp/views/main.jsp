<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	
	<title>Certification Page</title>
	<%@ include file="/views/common/header.jsp" %>
    <title>메인 화면</title>
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
            background-color: #f7f7f7;
            padding: 30px;
            background-size: cover;
            background-position: center;
            transition: background 0.5s ease;
        }

        .wrapper {
            max-width: 1200px;
            margin: auto;
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        /* ── 알림바 ── */
        .alert-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #999a9c;
            border-radius: 15px;
            padding: 15px 25px;
            font-size: 1.3em;
        }
        .alert-bar .btn-alert {
            background: #fff;
            border: none;
            border-radius: 12px;
            padding: 8px 16px;
            cursor: pointer;
            font-size: 1em;
        }
        .alert-bar .btn-bg {
            background: #fff;
            border: none;
            border-radius: 12px;
            padding: 8px 14px;
            margin-left: 10px;
            cursor: pointer;
            font-size: 0.95em;
        }

        /* ── rows & boxes ── */
        .row {
            display: flex;
            gap: 30px;
        }
        .box {
            background-color: #999a9c;
            border-radius: 25px;
            padding: 25px;
            text-align: center;
            font-size: 1.2em;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: transform 0.2s;
        }
        .box:hover {
            transform: translateY(-5px);
        }

        /* 정확한 비율/높이 */
        .row-sm .left  { width: 45%; height: 160px; }
        .row-sm .right { width: 55%; height: 160px; }

        .row-md .left  { width: 55%; height: 280px; }
        .row-md .right { width: 45%; height: 280px; }

        .row-lg .left  { width: 45%; height: 240px; }
        .row-lg .right { width: 55%; height: 240px; }

        /* ── 모달 팝업 ── */
        .modal {
            display: none;
            position: fixed; top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.4);
            justify-content: center; align-items: center;
            z-index: 1000;
        }
        .modal-content {
            background: #fff;
            border-radius: 12px;
            width: 90%; max-width: 400px;
            padding: 20px; position: relative;
        }
        .modal-content h2 {
            margin-bottom: 12px; font-size: 1.2em;
        }
        .modal-content ul {
            list-style: none; padding: 0;
            max-height: 300px; overflow-y: auto;
        }
        .modal-content li {
            padding: 8px 0; border-bottom: 1px solid #eee;
        }
        .modal-content .close {
            position: absolute; top: 10px; right: 15px;
            font-size: 1.4em; cursor: pointer;
        }
    </style>
</head>
<body>
<div class="wrapper">

    <!-- 알림바 -->
    <div class="alert-bar">
        <button class="btn-alert" id="notifBtn">🔔 알림</button>
        <div>
            <button class="btn-bg" id="exerciseBtn">운동 배경</button>
            <button class="btn-bg" id="studyBtn">공부 배경</button>
        </div>
    </div>

    <!-- 모달 팝업 -->
    <div id="notifModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <h2>알림 목록</h2>
            <ul>
                <li>01/01 챌린지 “30일 독서” 시작</li>
                <li>01/02 사용자 A님이 댓글을 남겼습니다.</li>
                <li>01/03 “첫 인증” 배지를 획득하셨습니다.</li>
            </ul>
        </div>
    </div>


	<!-- 1) 사용자 정보 / 2) 인증 기능 -->
	<div class="row row-sm">
	  <div class="box left"
	       onclick="location.href='${pageContext.request.contextPath}/userInfo'">
	    사용자 정보
	  </div>
	  <div class="box right"
	       onclick="location.href='${pageContext.request.contextPath}/cert'">
	    인증 기능
	  </div>
	</div>

	<!-- 3) 소셜 기능 / 4) 목표 설정 기능 -->
	<div class="row row-md">
	  <div class="box left"
	       onclick="location.href='${pageContext.request.contextPath}/social'">
	    소셜 기능
	  </div>
	  <div class="box right"
	       onclick="location.href='${pageContext.request.contextPath}/goal'">
	    목표 설정 기능
	  </div>
	</div>

	<!-- 5) 통계 기능 / 6) 뱃지 뽑기 기능 -->
	<div class="row row-lg">
	  <div class="box left"
	       onclick="location.href='${pageContext.request.contextPath}/stats'">
	    통계 기능
	  </div>
	  <div class="box right"
	       onclick="location.href='${pageContext.request.contextPath}/badgeDraw'">
	    뱃지 뽑기 기능
	  </div>
	</div>

</div>

<script>
    // 모달 열기/닫기
    const modal = document.getElementById('notifModal');
    document.getElementById('notifBtn').onclick = () => modal.style.display = 'flex';
    document.getElementById('closeModal').onclick = () => modal.style.display = 'none';
    window.onclick = e => { if (e.target === modal) modal.style.display = 'none'; };

    // 마지막 배경 복원
    document.addEventListener('DOMContentLoaded', () => {
        const bg = localStorage.getItem('lastBg');
    });

    // 배경 변경 & 저장
    document.getElementById('exerciseBtn').onclick = () => {
        document.body.style.backgroundImage = "url('../images/exercise.jpg')";
        localStorage.setItem('lastBg','exercise');
    };
    document.getElementById('studyBtn').onclick = () => {
        document.body.style.backgroundImage = "url('../images/study.jpg')";
        localStorage.setItem('lastBg','study');
    };
</script>
</body>
</html>
