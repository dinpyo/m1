<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="dao.*"%>
<%@ page import="vo.*"%>

<%
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("teacherId") == null
		||request.getParameter("teacherName") == null
		||request.getParameter("teacherHistory")==null
		||request.getParameter("teacherId").equals("")
		||request.getParameter("teacherName").equals("")
		||request.getParameter("teacherHistory").equals("")) {
		response.sendRedirect(request.getContextPath()+"/teacher/insertTeacher.jsp");
		return;
	}

	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	
	System.out.println(teacherId+ " <-- insertTeacherAction teacherId");
	System.out.println(teacherName+ " <-- insertTeacherAction teacherName");
	System.out.println(teacherHistory+ " <-- insertTeacherAction teacherHistory");

	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	TeacherDao teacherDao = new TeacherDao();
	int row = teacherDao.insertTeacher(teacher);
	
	if(row==1){
		System.out.println("teacher 추가 성공");
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}else{
		System.out.println("teacher 추가 실패");
		response.sendRedirect(request.getContextPath()+"/teacher/insertTeacher.jsp");
		return;
	
	}
%>