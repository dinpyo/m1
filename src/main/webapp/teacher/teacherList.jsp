<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>

<%@ page import="java.util.*" %>

<%
	// DB 로딩
	TeacherDao teacherDao = new TeacherDao();

	//현재 페이지
	int currentPage = 1;
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 페이지 당 행 개수
	int rowPerPage  = 10;
	
	// 전체 페이지
	int totalRow = teacherDao.selectTeacherCount();
	
	// 시작행 = ((현재 페이지 - 1) x 페이지당 개수 10개) ex) 1페이지 > 0~9번 행
	int beginRow = (currentPage-1) * rowPerPage;
	
	// 마지막행 = 시작행 + (페이지당 개수 10개 - 1 = 9);
	int endRow = beginRow + (rowPerPage - 1);
	if(endRow > totalRow){
		endRow = totalRow;
	}
	
	// 마지막 페이지
	int lastPage = totalRow / rowPerPage; 
	if(totalRow % rowPerPage != 0){ // 페이지가 떨어지지않아 잔여 행이 있다면 
		lastPage = lastPage + 1; // 1 추가, 잔여 행을 lastPage에 배치
	}
	// 각 페이지 선택 버튼 몇개 표시?
	int pagePerPage = 10;

	// 최소페이지
	int minPage = ((currentPage-1) / pagePerPage * pagePerPage) + 1;
	
	// 최대 페이지
	int maxPage = minPage + (pagePerPage - 1);
	if(maxPage > lastPage){ // ex) lastPage는 27, maxPage가 30(21~30) 일 경우
		maxPage = lastPage;  // maxPage를 lastPage == 27로 한다. 
	}


	ArrayList<HashMap<String, Object>> list = teacherDao.selectTeacherListByPage(beginRow, rowPerPage);
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
	<h1>강사 리스트</h1>
	<table class="table">
		<tr class="table-info">
			<th>강사아이디</th>
			<th>강사이름</th>	
			<th>담당과목</th>
		</tr>
		<%
			for(HashMap<String, Object> t : list){
		%>
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=(Integer)(t.get("강사번호"))%>">
						<%=(String)(t.get("강사아이디"))%>
					</a>
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=(Integer)(t.get("강사번호"))%>">
						<%=(String)(t.get("강사이름"))%>
					</a>	
				</td>
				<td>
					<a href="<%=request.getContextPath()%>/teacher/teacherOne.jsp?teacherNo=<%=(Integer)(t.get("강사번호"))%>">
						<%=(String)(t.get("담당과목"))%>
					</a>	
				</td>
			</tr>
		<%
			}
		%>
	</table>
	
	<!-----------------------------  페이징 버튼-------------------------->
	<div class="container mt-3">
		<!-- 첫 페이지 버튼 표시 -->
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=1">첫페이지</a>&nbsp;
	<%
		if(minPage > 1){
	%>		
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage-rowPerPage%>">이전</a>&nbsp;
	<%	
		}	
		for(int i = minPage; i<=maxPage; i++){
			if(i == currentPage){
	%>		
					<a class="btn btn-secondary"><%=i%></a>			
	<%	
			} else {
	%>				
					<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=i%>"><%=i%></a>&nbsp;	
	<%			
			}
		}
		if(maxPage != lastPage){
	%>	
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=minPage+rowPerPage%>">다음</a>&nbsp;
	<%
		}
	%>
		<!-- 마지막 페이지 버튼 표시-->	
	<%
		// 게시물이 없어 활성화된 페이지가 없으면 현재 페이지(1p) 고정
		if(lastPage == 0){
	%>
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=1">마지막페이지</a>&nbsp;
			
	<%
		} else {
	%>	
				<a type="button" class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/teacher/teacherList.jsp?currentPage=<%=lastPage%>">마지막페이지</a>&nbsp;
	<%
		}
	%>		
	</div>
	
	<a href="<%=request.getContextPath()%>/teacher/insertTeacher.jsp">강사 추가</a>
</body>
</html>