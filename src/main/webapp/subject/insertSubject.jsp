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
	<h1>과목 추가</h1>
	<form action="<%=request.getContextPath()%>/subject/insertSubjectAction.jsp" method="post">
		<table class="table">
			<tr>
				<th>추가할 과목 이름 : </th>
				<td><input type="text" name="subjectName"></td>
			</tr>
			<tr>
				<th>추가할 과목 시간 : </th>
				<td><input type="number" name="subjectTime"></td>
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