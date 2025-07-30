<%-- common/header.jsp --%>

<style>
  body {
    background-size: cover;
    background-position: center;
    transition: background 0.5s ease;
  }
  .btn-back {
    position: fixed;
    top: 16px;
    left: 16px;
    padding: 6px 12px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 0.95em;
    cursor: pointer;
    box-shadow: 0 1px 4px rgba(0,0,0,0.2);
    transition: background .2s;
    z-index: 1001;
  }
  .btn-back:hover {
    background: #f0f0f0;
  }
  
</style>
<script>
	const ctx = '${pageContext.request.contextPath}';
  document.addEventListener('DOMContentLoaded', function() {
	// localStorage에 저장된 lastBg 키 가져오기
    var bg = localStorage.getItem('lastBg');
    if (bg) {
    	// 웹앱 컨텍스트 경로까지 포함해 이미지 URL 설정
      
      document.body.style.backgroundImage =
        "url('" + ctx + "/images/" + bg + ".jpg')";
    }
  });
</script>
