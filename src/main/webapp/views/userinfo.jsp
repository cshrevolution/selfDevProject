<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/views/common/header.jsp" %>
  <title>사용자 정보</title>
  <style>
    @font-face{font-family:'BMJUA';src:url('../fonts/BMJUA_ttf.ttf') format('truetype');}
    *{font-family:'BMJUA',sans-serif;box-sizing:border-box;margin:0;padding:0}
    body{background:#f7f7f7;padding:30px}
    .container{
      position:relative;
      max-width:600px;
      margin:auto;
      background:rgba(153,153,156,0.9);
      border-radius:20px;
      padding:30px;
      text-align:center;
    }
    .btn-edit{
      position:absolute;top:16px;right:16px;
      background:#fff;border:none;border-radius:8px;
      padding:6px 12px;cursor:pointer;transition:background .2s;
      font-size:0.9em;
    }
    .btn-edit:hover{background:#e0e0e0;}
    .avatar{width:100px;height:100px;border-radius:50%;margin-bottom:12px}
    h2{margin-bottom:8px}
    .info{margin-bottom:20px;font-size:1em}
    .badges{display:flex;justify-content:center;gap:12px;margin:16px 0}
    .badge{display:flex;flex-direction:column;align-items:center;font-size:0.85em}
    .badge img{width:48px;height:48px;margin-bottom:4px}
    #logoutBtn{
      padding:8px 16px;margin-top:16px;border:none;border-radius:8px;
      background:#fff;cursor:pointer;transition:background .2s;font-size:0.95em;
    }
    #logoutBtn:hover{background:#e0e0e0;}
    .modal{
      display:none;position:fixed;top:0;left:0;
      width:100%;height:100%;background:rgba(0,0,0,0.4);
      justify-content:center;align-items:center;z-index:1000;
    }
	.modal-content {
	  background: #fff;
	  border-radius: 12px;
	  /* 가로 크기: 화면 너비의 80%, 최대 800px */
	  width: 80%;
	  max-width: 800px;
	  /* 세로 크기: 화면 높이의 90% 이내, 넘치면 스크롤 */
	  max-height: 90vh;
	  overflow-y: auto;
	  padding: 30px;
	  position: relative;
	  text-align: left;
	}
    .modal-content .close{
      position:absolute;top:10px;right:15px;font-size:1.4em;cursor:pointer;
    }
    .modal-content h3{margin-bottom:16px;}
    .modal-group{margin-bottom:16px;}
    .modal-group label{display:block;margin-bottom:6px;font-weight:500;}
    .preview-avatar{
      display:flex;align-items:center;gap:12px;margin-top:4px;
    }
    .preview-avatar img{
      width:60px;height:60px;border-radius:50%;object-fit:cover;border:1px solid #ccc;
    }
    .badge-selection{
      display:flex;flex-wrap:wrap;gap:12px;margin-top:4px;
    }
    .badge-option{
      cursor:pointer;border:2px solid transparent;padding:6px;border-radius:8px;
      text-align:center;font-size:0.85em;
    }
    .badge-option.selected{
      border-color:#1677bb;background:rgba(22,119,187,0.1);
    }
    .badge-option img{width:48px;height:48px;display:block;margin-bottom:4px;}
    .actions{text-align:right;margin-top:20px;}
    .actions button{
      margin-left:8px;padding:8px 14px;border:none;border-radius:8px;
      cursor:pointer;transition:background .2s;
    }
    .btn-cancel{background:#ccc;color:#333;}
    .btn-cancel:hover{background:#aaa;}
    .btn-save{background:#1677bb;color:#fff;}
    .btn-save:hover{background:#135a9b;}
	
  </style>
  

</head>
<body>
	  <!-- 메인으로 돌아가기 버튼 -->
	  <button class="btn-back"
	          onclick="location.href='/main'">
	    메인으로
	  </button>

  <div class="container">
    <button class="btn-edit" id="openEdit">정보 수정</button>

    <img id="currentAvatar" src="/images/avatar.png" class="avatar" alt="Avatar">
    <h2 id="displayName"><%= request.getAttribute("nickname") %></h2>
    <div class="info" id="displayEmail"><%= request.getAttribute("email") %></div>

    <div class="badges" id="displayBadges">
      <div class="badge"><img src="../images/badge1.png"><span>첫 인증</span></div>
      <div class="badge"><img src="../images/badge2.png"><span>7일 출석</span></div>
      <div class="badge"><img src="../images/badge3.png"><span>챌린지 달성</span></div>
    </div>

    <button id="logoutBtn">로그아웃</button>	
  </div>

  <div id="editModal" class="modal">
    <div class="modal-content">
      <span class="close" id="closeEdit">&times;</span>
      <h3>회원 정보 수정</h3>

      <div class="modal-group">
        <label for="avatarInput">프로필 사진</label>
        <div class="preview-avatar">
          <img id="avatarPreview" src="../images/avatar.png" alt="Avatar">
          <input type="file" id="avatarInput" accept="image/*">
        </div>
      </div>

      <div class="modal-group">
        <label for="nameInput">이름</label>
        <input type="text" id="nameInput" value="<%= request.getAttribute("uname") %>" style="width:100%;padding:8px;border:1px solid #ccc;border-radius:6px;">
      </div>

      <div class="modal-group">
        <label for="emailInput">이메일</label>
        <input type="email" id="emailInput" value="<%= request.getAttribute("email") %>" style="width:100%;padding:8px;border:1px solid #ccc;border-radius:6px;">
      </div>

      <div class="modal-group">
        <label>뱃지 선택 (최대 3개)</label>
        <div class="badge-selection" id="badgeSelection">
          <label class="badge-option">
            <input type="checkbox" name="badges" value="badge1" hidden>
            <img src="../images/badge1.png"><span>첫 인증</span>
          </label>
          <label class="badge-option">
            <input type="checkbox" name="badges" value="badge2" hidden>
            <img src="../images/badge2.png"><span>7일 출석</span>
          </label>
          <label class="badge-option">
            <input type="checkbox" name="badges" value="badge3" hidden>
            <img src="../images/badge3.png"><span>챌린지 달성</span>
          </label>
          <label class="badge-option">
            <input type="checkbox" name="badges" value="badge4" hidden>
            <img src="../images/badge4.png"><span>30일 완주</span>
          </label>
          <label class="badge-option">
            <input type="checkbox" name="badges" value="badge5" hidden>
            <img src="../images/badge5.png"><span>친구 초대</span>
          </label>
        </div>
      </div>

      <div class="actions">
        <button type="button" class="btn-cancel" id="cancelEdit">취소</button>
        <button type="button" class="btn-save" id="saveEdit">저장</button>
      </div>
    </div>
  </div>

  <script src='/script/jquery-3.7.1.js'></script>
  <script>
  //const ctx = '${pageContext.request.contextPath}';		//20250730 csh 이것때문에 정보수정 안 뜸.
  const editModal = document.getElementById('editModal');
  const openEdit  = document.getElementById('openEdit');
  const closeEdit = document.getElementById('closeEdit');
  const cancelBtn = document.getElementById('cancelEdit');
  const saveBtn   = document.getElementById('saveEdit');


  openEdit.onclick  = () => editModal.style.display = 'flex';
  
  closeEdit.onclick = cancelBtn.onclick = () => editModal.style.display = 'none';
  window.onclick = e => { if(e.target === editModal) editModal.style.display = 'none'; };

  document.getElementById('logoutBtn').onclick = () => {
    //location.href = '/login';			// 20250730 csh 이건 도대체 왜???
    location.href = '/logout';
  };

  document.getElementById('avatarInput').addEventListener('change', e => {
    const file = e.target.files[0];
    if (!file) return;
    document.getElementById('avatarPreview').src = URL.createObjectURL(file);
  });

  document.querySelectorAll('.badge-option').forEach(label => {
    label.addEventListener('click', () => {
      const cb = label.querySelector('input[type="checkbox"]');
      if (!cb.checked && document.querySelectorAll('input[name="badges"]:checked').length >= 3) return;
      cb.checked = !cb.checked;
      label.classList.toggle('selected', cb.checked);
    });
  });

  saveBtn.onclick = function() {
    // 업데이트된 값 가져오기
    const newName  = document.getElementById('nameInput').value;
    const newEmail = document.getElementById('emailInput').value;
    const fileInput = document.getElementById('avatarInput');
    const fileName  = fileInput.files[0] ? fileInput.files[0].name : '변경없음';
    const selectedBadges = Array.from(
      document.querySelectorAll('input[name="badges"]:checked')
    ).map(cb => cb.value);

    // 화면에 반영
    document.getElementById('displayName').textContent  = newName;
    document.getElementById('displayEmail').textContent = '이메일: ' + newEmail;
    if (fileInput.files[0]) {
      document.getElementById('currentAvatar').src = document.getElementById('avatarPreview').src;
    }
    const displayBadges = document.getElementById('displayBadges');
    displayBadges.innerHTML = '';
    selectedBadges.forEach(key => {
      const div = document.createElement('div');
      div.className = 'badge';
      div.innerHTML = '<img src="../images/'+ key +'.png"><span>'+ {
        badge1:'첫 인증',badge2:'7일 출석',badge3:'챌린지 달성',
        badge4:'30일 완주',badge5:'친구 초대'
      }[key] +'</span>';
      displayBadges.appendChild(div);
    });

    editModal.style.display = 'none';
    
    // controller 전달 필요
    


  };
  </script>
</body>
</html>
