<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- <%@ page import="com.javaex.dao.PhoneDao"%>
<%@ page import="com.javaex.vo.PersonVo"%>
<%@ page import="java.util.List"%>
 --%>
<%-- <%
//Request 안에 데이터사용 --> pList
List<PersonVo> personList = (List<PersonVo>) request.getAttribute("pList");

System.out.println("List===============");
System.out.println(personList);
%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전화번호 리스트</h1>
	<p>입력한 정보 내역입니다.</p>
<%-- 	<%
	for (int i = 0; i < personList.size(); i++) {
	%> --%>
	
	<c:forEach items="${pList}" var="pList" varStatus="status">
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%-- <%=personList.get(i).getName()%> --%>${pList.name}</td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><%-- <%=personList.get(i).getHp()%> --%>${pList.hp}</td>
		</tr>
		<tr>
			<td>회사</td>
			<td><%-- <%=personList.get(i).getCompany()%> --%> ${pList.company}</td>
		</tr>
		<tr>
			<td><a href="./pbc?action=delete&no=<%-- <%=personList.get(i).getPersonId()%> --%>${pList.personId}">[삭제]</a></td>
			<td><a href="./pbc?action=uform&no=<%-- <%=personList.get(i).getPersonId()%> --%>${pList.personId}">[수정]</a></td>
		</tr>
	</table>
	<br>
	</c:forEach>
	
<%-- 	<%
	}
	%> --%>
	
	<a href="./pbc?action=wform">추가번호 등록</a>
</body>
</html>