<%@page import="User.UserDAO"%>
<%@page import="User.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	UserDTO dto=new UserDTO();
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	boolean userCheck=UserDAO.getInstance().checkIdPw(id, pw);
	if(userCheck==true){
	UserDAO.getInstance().loginstate=true;
	%>
	<script>
	alert(id+"님 환영합니다!");
	</script>
	<%
	
}
%>
</body>
</html>