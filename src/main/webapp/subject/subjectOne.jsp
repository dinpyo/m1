<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<%
	
	if(request.getParameter("subjectNo") == null  
		|| request.getParameter("subjectNo").equals("")) {
		response.sendRedirect(request.getContextPath() + "/subject/subjectList.jsp");
		return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao subjectDao = new SubjectDao();
		
	Subject subject = subjectDao.selectSubjectOne(subjectNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>subjectOne</title>
</head>
<body>
	<div class="container">
		<h1>과목 상세</h1>
			<a href="<%=request.getContextPath()%>/subject/subjectList.jsp">
				<button type="button">목록으로</button>
			</a>
		<form action="<%=request.getContextPath()%>/subject/updateSubject.jsp" method="post">
			<table>
				<tr>
					<th>과목이름</th>
					<td>
						<input type="hidden" name="subjectNo" value="<%=subject.getSubjectNo()%>">
						<%=subject.getSubjectName()%>
					</td>
				</tr>
				<tr>
					<th>과목시간</th>
					<td><%=subject.getSubjectTime()%></td>
				</tr>
				<tr>
	
					<th>createdate</th>
					<td><%=subject.getCreatedate()%></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>