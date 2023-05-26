package dao;

import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.Subject;

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
	
	// 페이징
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
