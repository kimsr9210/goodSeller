package hotsix.goodseller.user.trade.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.trade.model.dao.TradeDAO;
import hotsix.goodseller.user.trade.model.vo.Trade;

public class TradeService {
	// TODO Auto-generated method stub
	TradeDAO tDAO = new TradeDAO();
	public int insertTrade(int postNo , String sellerId, String buyerId) {
			
		Connection conn = JDBCTemplate.getConnection();
		int result = tDAO.insertTrade(conn, postNo, sellerId, buyerId);
			
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
			
		return result;

	}
	public int tradeSellerEnd(int postNo, String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = tDAO.tradeSellerEnd(conn, postNo, userId);
			
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
			
		return result;
	}
	
	public int tradeBuyerEnd(int postNo, String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = tDAO.tradeBuyerEnd(conn, postNo, userId);
			
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
			
		return result;
	}
	
	public Trade tradeStateCheck(int postNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		Trade t = tDAO.tradeStateCheck(conn, postNo);
		
		return t;
	}
	
	public int tradeEnd(int postNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = tDAO.tradeEnd(conn, postNo);
			
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
			
		return result;
	}
	
	public ArrayList<Trade> myPageTradeList(String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Trade> list = tDAO.myPageTradeList(conn, userId);
		
		return list;
	}
	
	public ArrayList<Trade> myPageBuyList(String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Trade> list = tDAO.myPageBuyList(conn, userId);
		
		return list;
	}
	
	public ArrayList<Trade> myPageSellList(String userId) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Trade> list = tDAO.myPageSellList(conn, userId);
		
		return list;
	}
}
