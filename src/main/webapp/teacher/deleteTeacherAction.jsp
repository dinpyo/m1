<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*"%>

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
	int row = teacherDao.deleteTeacher(teacherNo);
	
	if(row==1){
		System.out.println("teacher 삭제 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else{
		System.out.println("teacher 삭제 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}






%>