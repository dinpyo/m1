<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="util.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>

<%

	int beginRow = 0;
	int rowPerPage = 10;
	
	SubjectDao subjectDao = new SubjectDao();
	ArrayList<Subject> list = subjectDao.selectSubjectListByPage(beginRow, rowPerPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>과목번호</th>
			<th>과목이름</th>
			<th>과목시간</th>
			<th>CREATEDATE</th>
			<th>UPDATEDATE</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
			for(Subject s : list){
		%>
			<tr>
				<td><%=s.getSubjectNo()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/subject/subjectOne.jsp?subjectNo=<%=s.getSubjectNo()%>">
						<%=s.getSubjectName()%>
					</a>
				</td>
				<td><%=s.getSubjectTime()%></td>
				<td><%=s.getCreatedate()%></td>
				<td><%=s.getUpdatedate()%></td>
				<td><a href="<%=request.getContextPath()%>/subject/updateSubject.jsp?subjectNo=<%=s.getSubjectNo()%>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/subject/deleteSubjectAction.jsp?subjectNo=<%=s.getSubjectNo()%>">삭제</a></td>
			</tr>
		<%
			}
		%>
	</table>
	
	<a href="<%=request.getContextPath()%>/subject/insertSubject.jsp">과목 추가</a>
</body>
</html>