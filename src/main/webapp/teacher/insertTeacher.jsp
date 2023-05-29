<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1>강사 추가</h1>
	<form action="<%=request.getContextPath()%>/teacher/insertTeacherAction.jsp" method="post">
		<table>
			<tr>
				<th>추가할 강사 아이디 : </th>
				<td><input type="text" name="teacherId"></td>
			</tr>
			<tr>
				<th>추가할 강사 이름 : </th>
				<td><input type="text" name="teacherName"></td>
			</tr>
			<tr>
				<th>추가할 강사 정보 : </th>
				<td><input type="text" name="teacherHistory"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">추가</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>