<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>

<%
	request.setCharacterEncoding("utf-8");
	
	if(request.getParameter("subjectName") == null 
		|| request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")) {
		response.sendRedirect(request.getContextPath()+"/subject/insertSubject.jsp");
		return;
	}
	
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));

	System.out.println(subjectName+ " <-- insertSubjectAction subjectName");
	System.out.println(subjectTime+ " <-- insertSubjectAction subjectTime");
	
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	SubjectDao subjectDao = new SubjectDao();
	int row = subjectDao.insertSubject(subject);
	
	if(row == 1){
		System.out.println("subject 추가 성공");
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}else{
		System.out.println("subject 추가 실패");
		response.sendRedirect(request.getContextPath()+"/subject/insertSubject.jsp");
		return;
	}
%>