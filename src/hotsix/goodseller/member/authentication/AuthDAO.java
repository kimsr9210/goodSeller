package hotsix.goodseller.member.authentication;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hotsix.goodseller.common.JDBCTemplate;

public class AuthDAO {
	
	public int insertAuthNum(Connection conn, int rand) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;

		String query = "INSERT INTO AUTHENTICATION VALUES (?)";

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rand);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	public boolean checkAuth(Connection conn, int inputNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM authentication WHERE AUTHNUM=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, inputNum);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return false;
	}
	
	public boolean deleteAuthNum(Connection conn) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM authentication";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);

			result = pstmt.executeUpdate();

			if (result > 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return false;
	}
}
