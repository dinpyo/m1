<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>과목 상세</h1>
		<a href="<%=request.getContextPath()%>/subject/subjectList.jsp">
			<button type="button">목록으로</button>
		</a>
	<form action="<%=request.getContextPath()%>/subject/updateSubject.jsp" method="post">
		<table class="table">
			<tr>
				<th>과목번호</th>
				<td>
					<input type="hidden" name="subjectNo" value="<%=subject.getSubjectNo()%>">
					<%=subject.getSubjectNo()%>
				</td>
			</tr>
			<tr>
				<th>과목이름</th>
				<td><%=subject.getSubjectName()%></td>
			</tr>
			<tr>
				<th>과목시간</th>
				<td><%=subject.getSubjectTime()%></td>
			</tr>
			<tr>
				<th>생성일</th>
				<td><%=subject.getCreatedate()%></td>
			</tr>
			<tr>
				<th>수정일</th>
				<td><%=subject.getUpdatedate()%></td>
			</tr>
			<tr>
				<td><a href="<%=request.getContextPath()%>/subject/updateSubject.jsp?subjectNo=<%=subjectNo%>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp?subjectNo=<%=subjectNo%>">삭제</a></td>
			</tr>	
		</table>
	</form>
</body>
</html>