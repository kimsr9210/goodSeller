package hotsix.goodseller.auction.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Auction;
import hotsix.goodseller.user.trade.model.vo.Trade;

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
			if (rset.next()) {
				result = rset.getString("count(*)");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
			if (rset.next()) {
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
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return auction;
	}

	public ArrayList<Auction> selectMyBidInfo(Connection conn, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Auction> list = new ArrayList<Auction>();

		String query = "SELECT * FROM auction WHERE userId = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Auction a = new Auction();

				a.setPostNo(rset.getInt("postNo"));
				a.setUserId(rset.getString("userID"));
				a.setBiddingDate(rset.getTimestamp("BIDDINGDATE"));
				a.setOfferPrice(rset.getInt("offerPrice"));
				a.setCancelYN(rset.getString("cancel_YN").charAt(0));

				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		System.out.println(userId);
		System.out.println(list);
		return list;
	}

}
