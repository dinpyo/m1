<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>

<%
	//한글 깨짐 방지 코드
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
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
<title>Insert title here</title>
</head>
<body>
	<h1>과목 수정</h1>
	<form action="<%=request.getContextPath()%>/subject/updateSubjectAction.jsp" method="post">
		<table class="table">
			<tr>
				<td>과목 번호</td>
				<td><input type ="number" name="subjectNo" readonly="readonly" value="<%=subject.getSubjectNo()%>"></td>
			</tr>
			<tr>
				<td>과목 이름</td>
				<td><input type ="text" name="subjectName" value="<%=subject.getSubjectName()%>"></td>
			</tr>
			<tr>
				<td>과목 시간</td>
				<td><input type ="number" name="subjectTime" value="<%=subject.getSubjectTime()%>"></td>
				
			</tr>
			<tr>
				<td>생성일</td>
				<td><input type ="text" name="createdate" readonly="readonly" value="<%=subject.getCreatedate()%>"></td>
			</tr>
			<tr>
				<td>수정일</td>
				<td><input type ="text" name="updatedate" readonly="readonly" value="<%=subject.getUpdatedate()%>"></td>
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