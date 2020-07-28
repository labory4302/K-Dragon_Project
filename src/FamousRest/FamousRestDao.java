package FamousRest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FamousRestDao {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(dburl, "test", "test");
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC 드라이버 로드 실패!");
		}
		return conn;
	}
	
	public List<FamousRestVo> getFamousRestList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<FamousRestVo> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * " +
						"FROM famousRest";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				FamousRestVo famousRestVo = new FamousRestVo(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getFloat(4),
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12)
						);
				list.add(famousRestVo);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public FamousRestVo getFamousRestInformation(Long restNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		FamousRestVo vo = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * " +
						"FROM famousRest " +
						"WHERE rest_no = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, restNo);
			
			rs = stmt.executeQuery();
			
			rs.next();
			vo = new FamousRestVo(
					rs.getLong(1),
					rs.getString(2),
					rs.getString(3),
					rs.getFloat(4),
					rs.getString(5),
					rs.getString(6),
					rs.getInt(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getString(11),
					rs.getString(12)
					);
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return vo;
	}
	
	public void updateRating(float ratingAverage, Long restNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection();
			String sql = "UPDATE famousrest " +
						 "SET restrating = ? " +
						 "WHERE rest_no = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setFloat(1, ratingAverage);
			stmt.setLong(2, restNo);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
	}
	
}
