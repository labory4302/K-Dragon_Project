package food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class commentDAOImpl implements commentDAO{
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
	@Override
	public List<commentVO> getList(Long no) {
		// TODO Auto-generated method stub
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//	데이터 전송을 위한 리스트
		List<commentVO> list = new ArrayList<>();

		try {
			conn = getConnection();
			stmt = conn.createStatement();

			String sql = "SELECT no,username, bcomment, " +
					"pubdate FROM boardcomment where no="+no+" order by pubdate desc";

			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				commentVO commentVO = new commentVO(
						rs.getLong(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4)
						);
				list.add(commentVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		return list;
	}
	@Override
	public boolean insert(Long no,String comment, String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;
		
		try {
			conn = getConnection();
			String sql = "insert into boardcomment values(?,seq_comment_no.nextval,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, no);
			pstmt.setString(2, name);
			pstmt.setString(3, comment);
			
			insertedCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return insertedCount == 1;
	}
}

