<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>

<%@ page import = "vo.*" %>
<%
	//한글 깨짐 방지 코드
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("teacherNo")==null
	||request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>강사 수정</h1>
	<form action="<%=request.getContextPath()%>/teacher/updateTeacherAction.jsp" method="post">
		<table class="table">
			<tr>
				<td>강사 번호</td>
				<td><input type ="number" name="teacherNo" readonly="readonly" value="<%=teacher.getTeacherNo()%>"></td>
			</tr>
			<tr>
				<td>강사 아이디</td>
				<td><input type ="text" name="teacherId" value="<%=teacher.getTeacherId()%>"></td>
			</tr>
			<tr>
				<td>강사 이름</td>
				<td><input type ="text" name="teacherName" value="<%=teacher.getTeacherName()%>"></td>
			</tr>
			<tr>
				<td>강사 정보</td>
				<td><input type ="text" name="teacherHistory" value="<%=teacher.getTeacherHistory()%>"></td>
				
			</tr>
			<tr>
				<td>수정일</td>
				<td><input type ="text" name="updatedate" readonly="readonly" value="<%=teacher.getUpdatedate()%>"></td>
			</tr>
			<tr>
				<td>생성일</td>
				<td><input type ="text" name="createdate" readonly="readonly" value="<%=teacher.getCreatedate()%>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">전송</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>