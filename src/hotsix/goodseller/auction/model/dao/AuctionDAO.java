package hotsix.goodseller.auction.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hotsix.goodseller.common.JDBCTemplate;

public class AuctionDAO {

	public String selectTransactionInfo(Connection conn, String writer) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = "";
		String query = "select count(*) from auction WHERE userId=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, writer);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getString("count(*)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

}
