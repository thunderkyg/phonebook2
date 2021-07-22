<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <%@ page import = "com.javaex.vo.PersonVo"  %> --%>
    
<%-- <%
	//Encoding
	request.setCharacterEncoding("UTF-8");

	// Set Attribute
	PersonVo personVo = (PersonVo)request.getAttribute("getPerson");	
%>     --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전화번호 수정</h1>
	<p>수정화면 입니다. 아래 항목을 수정하고 "수정" 버튼을 클릭하세요</p>
	
	<form action="./pbc" method ="post">
		이름: <input type="text" name="name" value="<%-- <%=personVo.getName() %> --%>${requestScope.getPerson.name}"> <br>
		핸드폰: <input type="text" name="hp" value="<%-- <%=personVo.getHp() %> --%>${requestScope.getPerson.hp}"> <br>
		회사: <input type="text" name="company" value="<%-- <%=personVo.getCompany() %> --%>${requestScope.getPerson.company}"> <br>
		<input type="hidden" name="no" value="<%-- <%=personVo.getPersonId() %> --%>${requestScope.getPerson.personId}">
		<input type="hidden" name="action" value="update">
		
		<button type="submit">수정</button>
	</form>
	
</body>
</html>