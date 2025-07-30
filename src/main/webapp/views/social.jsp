<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ include file="/views/common/header.jsp" %>
  <title>소셜 피드</title>
  <style>
    @font-face{font-family:'BMJUA';src:url('../fonts/BMJUA_ttf.ttf') format('truetype')}
    *{font-family:'BMJUA',sans-serif;box-sizing:border-box;margin:0;padding:0}
    body{background:#f7f7f7;padding:30px}
	.container {
	  max-width: 880px;
	  margin: auto;
	  padding-right: 280px; /* 오른쪽 패널 공간 확보 */
	}
	.upload-box,
	.post {
	  background: #fff;
	  border-radius: 16px;
	  padding: 24px;
	  margin-bottom: 28px;
	  box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
	}
    .like-btn, .follow-btn{background:#eee;padding:6px 12px;border:none;border-radius:6px;cursor:pointer;margin-right:10px}
	.comment-box {
	  margin-top: 20px;
	}
    .comment-list{
		margin-top:8px;padding-left:14px
	}
	.comment-list li {
	  font-size: 0.95em;
	  margin-bottom: 6px;
	}
	.post img {
	  max-width: 100%;
	  border-radius: 12px;
	  margin-top: 14px;
	}
    .username{
		font-weight:bold;margin-right:4px
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
      z-index: 1000;
    }
	.user-panel {
	  position: fixed;
	  top: 20px;
	  right: 30px;
	  background: #fff;
	  border-radius: 14px;
	  padding: 16px;
	  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
	  width: 200px;
	  z-index: 1000;
	}
	.user-info {
	  display: flex;
	  align-items: center;
	  margin-bottom: 10px;
	}
	.profile-img {
	  width: 48px;
	  height: 48px;
	  border-radius: 50%;
	  object-fit: cover;
	  margin-right: 10px;
	}
	.user-meta .nickname {
	  font-size: 1.1em;
	  font-weight: bold;
	}
	.user-stats {
	  font-size: 0.95em;
	  color: #333;
	  line-height: 1.6;
	}
  </style>
</head>
<body>

  <button class="btn-back" onclick="location.href='${pageContext.request.contextPath}/main'">메인으로</button>

  <div class="container">

    <!-- 📸 게시물 업로드 -->
    <div class="upload-box">
      <h3>게시물 올리기</h3>
      <form enctype="multipart/form-data" method="post" action="#">
        <textarea name="content" rows="3" style="width:100%;padding:8px" placeholder="내용을 입력하세요..."></textarea><br><br>
        <input type="file" name="image"><br><br>
        <button type="submit">업로드</button>
      </form>
    </div>

    <!-- 게시물 반복 출력 영역 (목업) -->
    <div class="post" id="post123">
      <div style="display:flex;justify-content:space-between;align-items:center">
        <div>
          <span class="username">사용자A</span>
          <button class="follow-btn">팔로우</button>
        </div>
        <span style="font-size:0.9em;color:gray">3분 전</span>
      </div>
      <p>오늘의 독서 인증 ✨</p>
      <img src="../images/sample.jpg" alt="업로드 이미지">
      <div style="margin-top:10px;">
        <button class="like-btn">♥ 좋아요</button> <span>2개</span>
      </div>

      <!-- 💬 댓글 -->
      <div class="comment-box">
        <form action="#">
          <input type="text" placeholder="댓글을 입력하세요..." style="width:80%;padding:6px">
          <button type="submit">작성</button>
        </form>
        <ul class="comment-list">
          <li><span class="username">userB</span>좋아요!</li>
          <li><span class="username">userC</span>응원합니다 🔥</li>
        </ul>
      </div>
    </div>

  </div>
  <!-- 유저 패널 -->
  <div class="user-panel">
    <div class="user-info">
      <img src="${user.profileImgPath}" class="profile-img" alt="프로필">
      <div class="user-meta">
        <div class="nickname">${user.nickname}</div>
      </div>
    </div>
    <div class="user-stats">
      <div><strong>❤️</strong> 좋아요: ${user.totalLikes}</div>
      <div><strong>💬</strong> 댓글: ${user.commentCount}</div>
      <div><strong>👥</strong> 팔로워: ${user.followerCount}</div>
      <div><strong>👣</strong> 팔로잉: ${user.followingCount}</div>
    </div>
  </div>

  
  
</body>
</html>
