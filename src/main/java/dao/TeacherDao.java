package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Teacher;

public class TeacherDao {
	
	// 1) 강사목록
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT t.teacher_no 강사번호, t.teacher_id 강사아이디, t.teacher_name 강사이름, ts.subject_no 과목번호, IFNULL(GROUP_CONCAT(s.subject_name),'없음') 담당과목 FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> HashList = new HashMap<>();
			HashList.put("강사번호", rs.getInt("강사번호"));
			HashList.put("강사아이디", rs.getString("강사아이디"));			
			HashList.put("강사이름", rs.getString("강사이름"));			
			HashList.put("과목번호", rs.getString("과목번호"));			
			HashList.put("담당과목", rs.getString("담당과목"));					
			list.add(HashList);
		}
		return list;		
	}
	
	// 2) 강사추가
	public int insertTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "INSERT INTO teacher(teacher_id, teacher_name, teacher_history, updatedate, createdate) VALUES(?, ?, ?, now(), now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		row = stmt.executeUpdate();
		return row;
	}
	
	// 3) 강사삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "DELETE FROM teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		row = stmt.executeUpdate();
		return row;
	}
	
	// 4) 강사수정
	public int updateTeacher(Teacher teacher) throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE teacher SET teacher_id = ?, teacher_name = ?, teacher_history = ?, updatedate = now(), createdate = now() WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setInt(4, teacher.getTeacherNo());
		row = stmt.executeUpdate();
		return row;
	}

	// 5) 강사 1명 상세보기
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT teacher_no teacherNo, teacher_id teacherId, teacher_name teacherName, teacher_history teacherHistory, updatedate, createdate from teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(rs.getInt("teacherNo"));		
			teacher.setTeacherName(rs.getString("teacherName"));
			teacher.setTeacherId(rs.getString("teacherId"));
			teacher.setTeacherHistory(rs.getString("teacherHistory"));
			teacher.setUpdatedate(rs.getString("updatedate"));
			teacher.setCreatedate(rs.getString("createdate"));
		}
		return teacher;
	}
	
	// 6) 강사전체
	public int selectTeacherCount() throws Exception {
		int row = 0;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT COUNT(*) FROM teacher";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt(1);
		}
		
		return row;
	}
	
	
	
	
	
	
	
	
	
	
	
}
