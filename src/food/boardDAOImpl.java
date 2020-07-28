package food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import food.boardVO;
public class boardDAOImpl implements boardDAO{
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
	public Long Like(Long no) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		long like=0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();

			String sql = "select length(likeup)-length(replace(likeup,',',''))-1 likeup from board where no="+no;
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				like=rs.getLong("likeup");
			}
			
		}
		catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		return like;

	}
	@Override
	public List<boardVO> getList(String search) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//	데이터 전송을 위한 리스트
		List<boardVO> list = new ArrayList<>();

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			if(search==null) {
				String sql = "SELECT no,title, username, " +
						"boardcontent,pubdate,length(likeup)-length(replace(likeup,',',''))-1 likeup FROM board order by pubdate desc";

				rs = stmt.executeQuery(sql);

				while(rs.next()) {
					boardVO boardVO = new boardVO(
							rs.getLong(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getLong(6)
							);
					list.add(boardVO);
				}
			}
			else {
				String sql = "SELECT no,title, username, " +
						"boardcontent,pubdate,length(likeup)-length(replace(likeup,',',''))-1 likeup FROM board where title like '%"+search+"%' or boardcontent like '%"+search+"%' order by pubdate desc";

				rs = stmt.executeQuery(sql);

				while(rs.next()) {
					boardVO boardVO = new boardVO(
							rs.getLong(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getLong(6)
							);
					list.add(boardVO);
				}
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}

		return list;
	}
	
	public int likecheck(Long no, String name) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int num=0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select CAST(nvl(max(no),0) AS Int) no from board where no="+no+" and likeup like '%,"+name+",%'";

			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				num=rs.getInt("no");
			}
		}
		catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}

		return num;
	}
	public void likeup(Long no, String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			
			String sql = "Update board SET likeup=concat(likeup,'"+name+",') where no="+no;
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
	}
	public void likedelete(Long no, String name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			
			String sql = "update board set likeup=(select replace(likeup,',"+name+"','') likeup from board where no="+no+") where no="+no;
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}
		
	}
	@Override
	public boolean insert(String title,String name,String content) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertedCount = 0;

		try {
			conn = getConnection();
			String sql = "INSERT INTO board VALUES(SEQ_BOARD_NO.nextval, ?, ?, ?, sysdate, ',')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2,name);
			pstmt.setString(3,content);

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

	public int updatecheck(Long no, String name) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int num=0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT CAST(nvl(max(no),0) AS Int) no FROM board where no="+no+" and username='"+name+"'";

			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				num=rs.getInt("no");
			}
		}
		catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}

		return num;
	}
	
	
	@Override
	public void boardUpdate(Long no,String title,String content) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String sql = "Update board SET title=? , boardcontent=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2,content);
			pstmt.setLong(3,no);

			pstmt.executeUpdate();
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
	}

	@Override
	public void boarddelete(Long no) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			String query="delete from boardcomment where no=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1,no);
			pstmt.executeUpdate();
			String sql = "delete from board where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,no);

			pstmt.executeUpdate();
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
	}


}
