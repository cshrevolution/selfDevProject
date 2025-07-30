<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ include file="/views/common/header.jsp" %>
  <title>통계 기능</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
	background: #f2f2f2;
    background-size: cover;
    padding: 40px;
  }
  .container {
    max-width: 700px;
    margin: auto;
    background: rgba(255, 255, 255, 0.8);
    border-radius: 16px;
    padding: 40px 30px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
  }
  h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 1.6em;
    color: #333;
  }
  canvas {
    width: 100% !important;
    max-width: 400px;
    height: auto !important;
    display: block;
    margin: 0 auto;
  }
  .btn-back {
    position: fixed;
    top: 16px;
    left: 16px;
    padding: 8px 14px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 0.9em;
    cursor: pointer;
    z-index: 100;
  }
  .btn-back:hover {
    background: #e2e2e2;
  }
</style>
</head>
<body>

<!-- 메인으로 돌아가기 버튼 -->
<button class="btn-back" onclick="location.href='${pageContext.request.contextPath}/main'">메인으로</button>
 <div class="container">
 <h2>챌린지 성공/실패 통계</h2>
 <canvas id="challengePieChart"></canvas>
</div>

<script>
  // 임시 데이터 (DB 연동 시 이 부분에 값 바인딩)
  const successCount = ${successCount != null ? successCount : 5};
  const failCount = ${failCount != null ? failCount : 3};
  const chartCtx = document.getElementById('challengePieChart').getContext('2d');
  new Chart(chartCtx, {
    type: 'doughnut',
    data: {
      labels: ['성공', '실패'],
      datasets: [{
        data: [successCount, failCount],
        backgroundColor: ['#4caf50', '#f44336'],
        borderWidth: 1
      }]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { position: 'bottom' },
        tooltip: {
          callbacks: {
            label: function(context) {
              return `${context.label}: ${context.parsed}건`;
            }
          }
        }
      }
    },
	plugins: [{
	  id: 'centerTextPlugin',
	  beforeDraw: function(chart) {
	    const {width} = chart;
	    const {height} = chart;
	    const ctx = chart.ctx;
	    ctx.restore();

	    const fontSize = (height / 150).toFixed(2);
	    ctx.font = `${fontSize}em BMJUA`;
	    ctx.textBaseline = 'middle';
	    ctx.textAlign = 'center';
	    ctx.fillStyle = '#444';

	    const total = successCount + failCount;
	    const text = `총 ${total}건`;
	    ctx.fillText(text, width / 2, height / 2);

	    ctx.save();
	  }
	}]

  });
</script>
<%-- 
  [Controller 예시 - 실제 데이터 연결 시 사용]
  int successCount = challengeService.getSuccessCount(userId);
  int failCount = challengeService.getFailCount(userId);
  request.setAttribute("successCount", successCount);
  request.setAttribute("failCount", failCount);
--%>

</body>
</html>
