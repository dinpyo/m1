<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>

<%
	// 한글 깨짐 방지 코드
	request.setCharacterEncoding("utf-8");
	
	if(request.getParameter("subjectNo")==null
	||request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	
	SubjectDao subjectDao = new SubjectDao();
	int row = subjectDao.deleteSubject(subjectNo);
	
	if(row==1){
		System.out.println("subject삭제 성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}else{
		System.out.println("subject삭제 실패");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
%>