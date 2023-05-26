<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>

<%
	if(request.getParameter("teacherNo") == null  
	|| request.getParameter("teacherNo").equals("")) {
	response.sendRedirect(request.getContextPath() + "/teacher/teacherList.jsp");
	return;
	}

	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	TeacherDao teacherDao = new TeacherDao();
		
	Teacher teacher = teacherDao.selectTeacherOne(teacherNo);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>강사 상세</h1>
		<a href="<%=request.getContextPath()%>/teacher/teacherList.jsp">
			<button type="button">목록으로</button>
		</a>
	<form action="<%=request.getContextPath()%>/teacher/updateTeacher.jsp" method="post">
		<table>
			<tr>
				<th>강사 번호</th>
				<td>
					<input type="hidden" name="teacherNo" value="<%=teacher.getTeacherNo()%>">
					<%=teacher.getTeacherNo()%>
				</td>
			</tr>
			<tr>
				<th>강사 아이디</th>
				<td><%=teacher.getTeacherId()%></td>
			</tr>
			<tr>
				<th>강사 이름</th>
				<td><%=teacher.getTeacherName()%></td>
			</tr>
			<tr>
				<th>강사 정보</th>
				<td><%=teacher.getTeacherHistory()%></td>
			</tr>
			<tr>
				<th>수정일</th>
				<td><%=teacher.getUpdatedate()%></td>
			</tr>
			<tr>
				<th>생성일</th>
				<td><%=teacher.getCreatedate()%></td>
			</tr>
			
			<tr>
				<td><a href="<%=request.getContextPath()%>/teacher/updateTeacher.jsp?teacherNo=<%=teacherNo%>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/teacher/deleteTeacherAction.jsp?teacherNo=<%=teacherNo%>">삭제</a></td>
			</tr>	
		</table>
	</form>
</body>
</html>