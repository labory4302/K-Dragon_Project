package USER1;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class UserDAO {
	
	private Connection conn; // connection:db�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�떦怨ㅼ삕 �뜝�룞�삕�뜝�뙇�뙋�삕 �뜝�룞�삕泥�
	private PreparedStatement pstmt;
	private ResultSet rs;

	
	public UserDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, "test", "test");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword, userID FROM USERA WHERE userID = ?";
		try {
			
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				if (rs.getString(1).equals(userPassword)) {
					return 1;
				} else
					return 0;
			}
			return -1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public int join(String id, String pass,String name, String gender,String mail) {
		String query = "INSERT INTO USERA VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, mail);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public boolean confirmId(String name) {
		boolean result = false;
		PreparedStatement pstmt = null;
        ResultSet rs = null;

		try {
			String sql = "SELECT userid from userA where userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { 
				result = true;
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return result;
		 
	 }
	public int[] loginCheck(String id, String password) 
    {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db?��?�� 꺼낸 비�?번호�? ?��?�� �??��
        int x = -1;
 
        try {
            // 쿼리 - 먼�? ?��?��?�� ?��?��?���? DB?��?�� 비�?번호�? 조회?��?��.
            StringBuffer query = new StringBuffer();
            query.append("SELECT userid, userpassword FROM userA WHERE userid=?");
 
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // ?��?��?�� ?��?��?��?�� ?��?��?��?�� 비번 ?��?��경우
            {
                dbPW = rs.getString("userpassword"); // 비번?�� �??��?�� ?��?��?��.
 
                if (dbPW.equals(password)) 
                    x = 1; // ?��겨받?? 비번�? 꺼내?�� 배번 비교. 같으�? ?��증성�?
                else                  
                    x = 0; // DB?�� 비�?번호?? ?��?��받�? 비�?번호 ?���?, ?��증실?��
                
            } else {
                x = -1; // ?��?�� ?��?��?���? ?��?�� 경우
            }
            
            int[] re_int = {x, rs.getInt(2)};
 
            return re_int;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
	public boolean update(String user_num, String password) {

		PreparedStatement pstmt = null;
		int updatedCount = 0;
		
		try {
			String sql = "UPDATE userA SET " +
					"userpassword=? " +
					"WHERE userid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, user_num);
			
			updatedCount = pstmt.executeUpdate();
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
		return 1 == updatedCount;
	}
}



