package hotsix.goodseller.user.trade.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.trade.model.vo.Trade;

public class TradeDAO {

	public int insertTrade(Connection conn, int postNo, String sellerId, String buyerId) {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO TRADESTATE VALUES(?,?,?,'N','N','N')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			pstmt.setString(2, sellerId);
			pstmt.setString(3, buyerId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int tradeSellerEnd(Connection conn, int postNo, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE TRADESTATE SET SELLER_STATE = 'Y' WHERE POSTNO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int tradeBuyerEnd(Connection conn, int postNo, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE TRADESTATE SET BUYER_STATE = 'Y' WHERE POSTNO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public Trade tradeStateCheck(Connection conn, int postNo) {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Trade t = null;
		
		String query = "SELECT * FROM TRADESTATE WHERE POSTNO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				t = new Trade();
				
				t.setPostNo(rset.getInt("postNo"));
				t.setBuyerId(rset.getString("buyerID"));
				t.setSellerId(rset.getString("sellerId"));
				t.setTradeEnd(rset.getString("trade_end").charAt(0));
				t.setBuyerState(rset.getString("buyer_state").charAt(0));
				t.setSellerState(rset.getString("seller_state").charAt(0));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return t;
	}

	public int tradeEnd(Connection conn, int postNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE TRADESTATE SET TRADE_END = 'Y' WHERE POSTNO = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Trade> myPageTradeList(Connection conn, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = null;
		
		String query = "SELECT * FROM TRADESTATE WHERE buyerId = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				Trade t = new Trade();
				
				t.setPostNo(rset.getInt("postNo"));
				t.setBuyerId(rset.getString("buyerID"));
				t.setSellerId(rset.getString("sellerId"));
				t.setTradeEnd(rset.getString("tarde_end").charAt(0));
				t.setBuyerState(rset.getString("buyer_state").charAt(0));
				t.setSellerState(rset.getString("seller_state").charAt(0));
				
				list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public ArrayList<Trade> myPageBuyList(Connection conn, String userId) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = new ArrayList<Trade>();
		
		String query = "SELECT * FROM TRADESTATE WHERE buyerId = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Trade t = new Trade();
				
				t.setPostNo(rset.getInt("postNo"));
				t.setBuyerId(rset.getString("buyerID"));
				t.setSellerId(rset.getString("sellerId"));
				t.setTradeEnd(rset.getString("trade_end").charAt(0));
				t.setBuyerState(rset.getString("buyer_state").charAt(0));
				t.setSellerState(rset.getString("seller_state").charAt(0));
				
				list.add(t);
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
	
	public ArrayList<Trade> myPageSellList(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = new ArrayList<Trade>();
		
		String query = "SELECT * FROM TRADESTATE WHERE sellerId = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Trade t = new Trade();
				
				t.setPostNo(rset.getInt("postNo"));
				t.setBuyerId(rset.getString("buyerID"));
				t.setSellerId(rset.getString("sellerId"));
				t.setTradeEnd(rset.getString("trade_end").charAt(0));
				t.setBuyerState(rset.getString("buyer_state").charAt(0));
				t.setSellerState(rset.getString("seller_state").charAt(0));
				
				list.add(t);
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
