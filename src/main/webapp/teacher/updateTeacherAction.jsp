<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>

<%@ page import = "vo.*" %>
<% 
	//한글 깨짐 방지 코드
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("teacherNo")==null
		||request.getParameter("teacherId")==null
		||request.getParameter("teacherName")==null
		||request.getParameter("teacherHistory")==null
		||request.getParameter("teacherNo").equals("")
		||request.getParameter("teacherId").equals("")
		||request.getParameter("teacherName").equals("")
		||request.getParameter("teacherHistory").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}

	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);

	TeacherDao teacherDao = new TeacherDao();
	int row = teacherDao.updateTeacher(teacher);
	
	if(row == 1){
		System.out.println("teacher 수정 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else {
		System.out.println("teacher 수정 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
%>