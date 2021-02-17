<%@page import="java.util.ArrayList"%>
<%@page import="User.UserDTO"%>
<%@page import="User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<a href="signup.jsp">회원가입</a>
<a href="login.jsp">로그인</a>
<%
UserDAO dao=UserDAO.getInstance();
UserDTO dto=new UserDTO();
dao.realpath=application.getRealPath("/");
dao.loadData();

ArrayList<UserDTO>userList=dao.getuserList();
out.print(userList.size()+"<br>");
for(int i=0;i<userList.size();i++){
	out.print("이름 : "+userList.get(i).getName());
	out.print(" ID : "+userList.get(i).getId());
	out.print(" PW : "+userList.get(i).getPw());
	out.print(" 시작 날짜 : "+userList.get(i).getStartDate());
	out.print("<br>");
}

%>

</body>
</html>