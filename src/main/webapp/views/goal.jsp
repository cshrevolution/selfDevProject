<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/views/common/header.jsp" %>
  <title>목표 설정 기능 – 챌린지 관리</title>
  <style>
    /* (기존 스타일 그대로 유지) */
    @font-face{font-family:'BMJUA';src:url('../fonts/BMJUA_ttf.ttf') format('truetype');}
    *{font-family:'BMJUA',sans-serif;box-sizing:border-box;margin:0;padding:0}
    body{background:#f7f7f7;padding:30px;background-size:cover;background-position:center;transition:background .5s ease;}
    .container{max-width:800px;margin:auto;background:rgba(153,153,156,0.9);border-radius:20px;padding:30px;}
    h2{margin-bottom:20px;font-size:1.4em;color:#222;text-align:center;}
    #openAddChallenge{display:block;margin:0 auto 20px auto;padding:10px 20px;background:#1677bb;color:#fff;border:none;border-radius:8px;cursor:pointer;font-size:1em;}
    #challengeList{list-style:none;padding:0;}
    .challenge-item{background:#fff;border-radius:12px;padding:16px;margin-bottom:12px;display:flex;justify-content:space-between;align-items:center;}
    .challenge-item .info{flex:1;}
    .challenge-item .info h3{margin-bottom:6px;font-size:1.1em;color:#333;}
    .challenge-item .info p{font-size:0.95em;color:#555;margin:4px 0;}
    .challenge-item .info .due{font-size:0.9em;color:#888;}
    .challenge-item .actions button{margin-left:8px;padding:6px 12px;border:none;border-radius:6px;cursor:pointer;transition:background .2s;font-size:0.9em;}
    .actions .btn-edit{background:#f1c40f;color:#fff;} .actions .btn-edit:hover{background:#d4ac0d;}
    .actions .btn-delete{background:#e74c3c;color:#fff;} .actions .btn-delete:hover{background:#c0392b;}

    /* 모달 */
    .modal{display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,0.4);justify-content:center;align-items:center;z-index:1000;}
    .modal-content{background:#fff;border-radius:12px;width:90%;max-width:500px;padding:20px;position:relative;text-align:left;max-height:90vh;overflow-y:auto;}
    .modal-content h3{margin-bottom:14px;font-size:1.2em;color:#222;}
    .modal-group{margin-bottom:12px;}
    .modal-group label{display:block;margin-bottom:6px;font-weight:500;}
    .modal-group input[type="text"],
    .modal-group input[type="date"],
    .modal-group textarea{width:100%;padding:8px;border:1px solid #ccc;border-radius:6px;font-size:1em;}
    .modal-group textarea{resize:vertical;height:80px;}
    .modal-actions{text-align:right;margin-top:16px;}
    .modal-actions button{margin-left:8px;padding:8px 14px;border:none;border-radius:6px;cursor:pointer;font-size:0.95em;transition:background .2s;}
    .btn-cancel{background:#ccc;color:#333;} .btn-cancel:hover{background:#aaa;}
    .btn-save{background:#1677bb;color:#fff;} .btn-save:hover{background:#135a9b;}
	.date-picker-wrapper {
	  position: relative;
	}
	.date-picker-wrapper .calendar-icon {
	  position: absolute;
	  top: 50%;
	  right: 10px;
	  transform: translateY(-50%);
	  cursor: pointer;
	  font-size: 1.2em;
	  color: #555;
	}
	
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
	<!-- 메인으로 돌아가기 버튼 -->
	<button class="btn-back"
	        onclick="location.href='${pageContext.request.contextPath}/main'">
	  메인으로
	</button>
  <div class="container">
    <h2>챌린지 관리</h2>
    <button id="openAddChallenge">새 챌린지 등록</button>
    <ul id="challengeList"></ul>
  </div>

  <!-- 등록/수정 모달 -->
  <div id="challengeModal" class="modal">
    <div class="modal-content">
      <span class="close" id="closeModal" style="position:absolute;top:10px;right:15px;cursor:pointer;font-size:1.4em;">&times;</span>
      <h3 id="modalTitle">챌린지 등록</h3>
      <div class="modal-group">
        <label for="challengeTitle">제목</label>
        <input type="text" id="challengeTitle">
      </div>
      <div class="modal-group">
        <label for="challengeDesc">설명</label>
        <textarea id="challengeDesc"></textarea>
      </div>
	  <div class="modal-group">
	    <label for="challengeDue">기한</label>
	    <div class="date-picker-wrapper">
	      <!-- readonly로 두면 직접 입력 차단, 아이콘 클릭/클릭 시 열림 -->
	      <input type="text" id="challengeDue" placeholder="YYYY-MM-DD" readonly>
	      <span class="calendar-icon">&#128197;</span>
	    </div>
	  </div>
      <div class="modal-actions">
        <button type="button" class="btn-cancel" id="btnCancel">취소</button>
        <button type="button" class="btn-save" id="btnSave">저장</button>
      </div>
    </div>
  </div>

  <script>
    // 배경 복원 (생략: 앞서 적용한 코드)

    // 챌린지 데이터 구조: {title, desc, dueDate (YYYY-MM-DD), reminded3, reminded1}
    var challenges = [], editingIndex = -1;

    function render() {
      var ul = document.getElementById('challengeList');
      ul.innerHTML = '';
      challenges.forEach(function(ch, i){
        var li = document.createElement('li');
        li.className = 'challenge-item';
        li.innerHTML =
          '<div class="info">' +
            '<h3>' + ch.title + '</h3>' +
            '<p>' + ch.desc + '</p>' +
            '<p class="due">기한: ' + ch.dueDate + '</p>' +
          '</div>' +
          '<div class="actions">' +
            '<button class="btn-edit" data-i="'+i+'">수정</button>' +
            '<button class="btn-delete" data-i="'+i+'">삭제</button>' +
          '</div>';
        ul.appendChild(li);
      });
    }

    // 모달 제어
    var modal      = document.getElementById('challengeModal'),
        openBtn    = document.getElementById('openAddChallenge'),
        closeBtn   = document.getElementById('closeModal'),
        cancelBtn  = document.getElementById('btnCancel'),
        saveBtn    = document.getElementById('btnSave'),
        fldTitle   = document.getElementById('challengeTitle'),
        fldDesc    = document.getElementById('challengeDesc'),
        fldDue     = document.getElementById('challengeDue'),
        modalTitle = document.getElementById('modalTitle');

    function showModal(isEdit, idx) {
      editingIndex = isEdit ? idx : -1;
      modalTitle.textContent = isEdit ? '챌린지 수정' : '챌린지 등록';
      if (isEdit) {
        var ch = challenges[idx];
        fldTitle.value = ch.title;
        fldDesc.value  = ch.desc;
        fldDue.value   = ch.dueDate;
      } else {
        fldTitle.value = '';
        fldDesc.value  = '';
        fldDue.value   = '';
      }
      modal.style.display = 'flex';
      fldTitle.focus();
    }

    openBtn.onclick     = () => showModal(false);
    closeBtn.onclick    = cancelBtn.onclick = () => modal.style.display = 'none';
    window.onclick      = e => e.target===modal && (modal.style.display='none');

    saveBtn.onclick     = function(){
      var t = fldTitle.value.trim(),
          d = fldDesc.value.trim(),
          due = fldDue.value;
      if (!t || !due) { alert('제목과 기한을 모두 입력하세요.'); return; }
      var item = { title:t, desc:d, dueDate:due, reminded3:false, reminded1:false };
      if (editingIndex>=0) challenges[editingIndex] = item;
      else                 challenges.push(item);
      modal.style.display='none';
      render();
      checkReminders();  // 저장 직후에도 알림 체크
    };

    document.getElementById('challengeList').addEventListener('click', function(e){
      var i = +e.target.dataset.i;
      if (e.target.classList.contains('btn-edit'))  showModal(true, i);
      if (e.target.classList.contains('btn-delete')){
        if (confirm('삭제하시겠습니까?')) {
          challenges.splice(i,1);
          render();
        }
      }
    });

    // 알림 로직
    function checkReminders(){
      var today = new Date();
      challenges.forEach(function(ch){
        var dd = new Date(ch.dueDate),
            diffDays = Math.ceil((dd - today) / (1000*60*60*24));
        if (diffDays===3 && !ch.reminded3) {
          alert('챌린지 "'+ch.title+'" 기한 3일 전입니다.');
          ch.reminded3 = true;
        }
        if (diffDays===1 && !ch.reminded1) {
          alert('챌린지 "'+ch.title+'" 기한 하루 전입니다.');
          ch.reminded1 = true;
        }
      });
    }

    // 초기 렌더 & 알림 스케줄
    render();
    checkReminders();
    setInterval(checkReminders, 60*1000);  // 1분마다 체크

	document.addEventListener('DOMContentLoaded', function(){
	  var fp = flatpickr("#challengeDue", {
	    dateFormat: "Y-m-d"
	  });
	  // 달력 아이콘 클릭 시 flatpickr 열기
	  document.querySelector(".calendar-icon").addEventListener("click", function(){
	    fp.open();
	  });
	});
	
  </script>
</body>
</html>
