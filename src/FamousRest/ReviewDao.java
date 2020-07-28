package FamousRest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {
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
	
	public List<ReviewVo> getReviewList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ReviewVo> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT * " +
						"FROM review";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ReviewVo reviewVo = new ReviewVo(
						rs.getLong(1),
						rs.getLong(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6)
						);
				list.add(reviewVo);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public ReviewVo getReviewInformation(Long reviewNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ReviewVo vo = null;
		
		try {
			conn = getConnection();
			String sql = "SELECT * " +
						"FROM review " +
						"WHERE review_no = ?";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, reviewNo);
			
			rs = stmt.executeQuery();
			
			rs.next();
			vo = new ReviewVo(
					rs.getLong(1),
					rs.getLong(2),
					rs.getString(3),
					rs.getInt(4),
					rs.getString(5),
					rs.getString(6)
					);
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return vo;
	}
	
	public List<ReviewVo> getFamousRestReviewList(Long restNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<ReviewVo> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			String sql = "SELECT * " +
						 "FROM review " +
						 "WHERE rest_no = ? " +
						 "ORDER BY creation_date DESC";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, restNo);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				ReviewVo reviewVo = new ReviewVo(
						rs.getLong(1),
						rs.getLong(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6)
						);
				list.add(reviewVo);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return list;
	}
	
	public void insert(ReviewVo reviewVo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO review " +
					"VALUES(seq_review_no.nextval, ?, ?, ?, SYSDATE, ?)";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, reviewVo.getRestNo());
			stmt.setString(2, reviewVo.getContent());
			stmt.setInt(3, reviewVo.getUserRating());
			stmt.setString(4, reviewVo.getUserID());
			
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
	
	
	public int getReviewsNumber(Long restNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		int reviewsNumber = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT count(*) " +
						 "FROM review " +
						 "WHERE rest_no = ? ";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, restNo);
			
			rs = stmt.executeQuery();
			
			rs.next();
			reviewsNumber = rs.getInt(1);
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return reviewsNumber;
	}
	
	public int getReviewsTotalScore(Long restNo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		int totalScore = 0;
		
		try {
			conn = getConnection();
			String sql = "SELECT SUM(userrating) " +
						 "FROM review " +
						 "WHERE rest_no = ? ";
			
			stmt = conn.prepareStatement(sql);
			stmt.setLong(1, restNo);
			
			rs = stmt.executeQuery();
			
			rs.next();
			totalScore = rs.getInt(1);
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
		return totalScore;
	}
}
