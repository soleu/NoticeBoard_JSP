<%@page import="User.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="User.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	UserDTO dto=new UserDTO();
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	Date d=new Date();
	SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");
	dto.setUser(id,pw,name,sdf.format(d));
boolean idCheck=UserDAO.getInstance().checkId(id);
if(idCheck==true){
	%>
	<script>
	alert("중복된 아이디 입니다.");
	window.location.href="signup.jsp";
	</script>
	<%
}
else{
	UserDAO.getInstance().insertUser(dto);
	%>
	<script>
	alert(id+"님, 회원가입을 축하합니다.");
	window.location.href="MainPage.jsp";
	</script>
	<%
}
%>
</body>
</html>