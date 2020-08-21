<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>

</head>
<body>
<nav class="nabar navbar-expand-sm bg-light">
  <ul class="navbar-nav">
  <li class="nav-item">
  <a href="" class="nav-link">메뉴1</a>
  </li>
  <li class="nav-item">
  <a href="" class="nav-link">메뉴2</a>
  </li>
  <li class="nav-item">
  <a href="" class="nav-link">메뉴3</a>
  </li>
  <li class="nav-item">
  <a href="" class="nav-link">메뉴4</a>
  </li>
  </ul>
</nav>
<div class="container">
   ${sessionScope.user.uiName}님 반갑습니다.<br>
   <c:if test="${sessionScope.user.uiAdmin=='1'}">
   <a href="/views/list"><button class="btn btn-info">유저리스트</button></a>
   </c:if>
   <button class="btn btn-info" onclick="doLogout()">로그아웃</button>
   	<a href = "/views/modify"><button class = "btn btn-info">정보수정</button></a>
   	<input type="hidden" name="ui_num" id="ui_num" value="${user.uiNum}">
   <button class="btn btn-info" onclick="drop()">회원탈퇴</button>
</div>
<script>
function doLogout(){
	alert('로그아웃');
	$.ajax({
		url : '/ajax/user',
		method : 'POST',
		data : JSON.stringify({cmd:'logout'}),
		success : function(res){
			if(res.result){
				alert('로그아웃 되었습니다.');
				location.href='/views/login';
			}
			
		}
		
	})
}
</script>
<script language="javascript">
function drop(){
alert('회원탈퇴 하시겠습니까?');
	document.wirte('Yes')
	$.ajax({
		url : '/ajax/user',
		method : 'POST',
		data : JSON.stringify({cmd:'Delete'}),
		success : function(res){
		}else if(res==result){
				alert('회원탈퇴가 정상적으로 실행되었습니다.');
				location.href='/views/login';
}else if{
document.write('No'){
	location.href='/';
}
}
}
	}
}
</script>
</body>
</html>