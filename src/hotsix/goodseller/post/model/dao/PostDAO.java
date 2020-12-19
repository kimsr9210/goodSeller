package hotsix.goodseller.post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import hotsix.goodseller.common.JDBCTemplate;

public class PostDAO {

	public int insertPost(Connection conn, String userId, String subject, String content, String endDate, int sPrice,
			int bPrice, String sellMethod, String mainCategory, String subCategory, String mainChangedFileName,
			String subChangedFileName_1, String subChangedFileName_2, String subChangedFileName_3,
			String subChangedFileName_4) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO POSTTBL VALUES(POSTTBL_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,?,?,?,?,NULL,NULL,?,?,?,'N','N')";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, userId);
			pstmt.setString(4, endDate);
			pstmt.setString(5, mainChangedFileName);
			pstmt.setString(6, subChangedFileName_1);
			pstmt.setString(7, subChangedFileName_2);
			pstmt.setString(8, subChangedFileName_3);
			pstmt.setString(9, subChangedFileName_4);
			pstmt.setInt(10, sPrice);
			pstmt.setInt(11, bPrice);
			pstmt.setString(12, sellMethod);
			pstmt.setString(13, mainCategory);
			pstmt.setString(14, subCategory);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
