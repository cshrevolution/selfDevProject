<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/views/common/header.jsp" %>
  <title>뱃지 뽑기</title>
  <style>
    @font-face{font-family:'BMJUA';src:url('../fonts/BMJUA_ttf.ttf') format('truetype')}
    *{font-family:'BMJUA',sans-serif;box-sizing:border-box;margin:0;padding:0}
    body{background:#f7f7f7;padding:30px}
    .container{
		max-width:500px;margin:auto;text-align:center
	}
    h2{
		margin-bottom:20px
	}
    .btn{
		padding:12px 24px;border:none;border-radius:8px;background:#fff;cursor:pointer;transition:background .2s
	}
    .btn:hover{
		background:#e0e0e0
	}
    .result{
		margin-top:30px
	}
    .badge{
		display:inline-flex;flex-direction:column;align-items:center
	}
    .badge img{
		width:80px;height:80px;margin-bottom:8px
	}
	.box-wrapper {
		background: rgba(255, 255, 255, 0.8); /* 반투명 흰 배경 */
		border-radius: 20px;
		padding: 30px;
		box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
		backdrop-filter: blur(6px); /* 배경 흐림 효과 */
	}
  </style>
</head>
<body>
	<!-- 메인으로 돌아가기 버튼 -->
	<button class="btn-back"
	        onclick="location.href='${pageContext.request.contextPath}/main'">
	  메인으로
	</button>
	<div class="container">
	  <div class="box-wrapper">
	    <h2>뱃지 뽑기 시스템</h2>
	    <button class="btn" id="drawBtn">뱃지 뽑기</button>
	    <div class="result" id="result">
	      <p>버튼을 눌러 뱃지를 뽑아보세요!</p>
	    </div>
	  </div>
	</div>

  
	<script>
	  const badges = [
	    {key:'badge1',name:'첫 인증'},
	    {key:'badge2',name:'7일 출석'},
	    {key:'badge3',name:'챌린지 달성'},
	    {key:'badge4',name:'30일 완주'},
	    {key:'badge5',name:'친구 초대'}
	  ];
	  document.getElementById('drawBtn').onclick = () => {
	    const pick = badges[Math.floor(Math.random()*badges.length)];
	    document.getElementById('result').innerHTML = `
	      <div class="badge">
	        <img src="../images/${pick.key}.png" alt="${pick.name}">
	        <span>${pick.name}</span>
	      </div>`;
	};
	</script>
</body>
</html>
