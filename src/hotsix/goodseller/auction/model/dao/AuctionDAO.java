package hotsix.goodseller.auction.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Auction;

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

	public Auction getAuctionInfo(Connection conn, int postNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from (select * from auction WHERE postno=? order by OFFERPRICE desc) where rownum = 1";
		Auction auction = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				auction = new Auction();
				
				auction.setPostNo(rset.getInt("postno"));
				auction.setUserId(rset.getString("userid"));
				auction.setBiddingDate(rset.getTimestamp("biddingdate"));
				auction.setOfferPrice(rset.getInt("offerprice"));
				auction.setCancelYN(rset.getString("cancel_yn").charAt(0));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return auction;
	}

}
