package hotsix.goodseller.auction.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.auction.model.dao.AuctionDAO;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Auction;

public class AuctionService {
	AuctionDAO aDAO = new AuctionDAO();
	public String selectTransactionInfo(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		String result = aDAO.selectTransactionInfo(conn, writer);
		JDBCTemplate.close(conn);
		
		return result;
	}
	public Auction getAuctionInfo(int postNo) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		Auction auction = aDAO.getAuctionInfo(conn, postNo);
		JDBCTemplate.close(conn);
		
		return auction;
	}
	
	public ArrayList<Auction> selectMyBidInfo(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Auction> list = aDAO.selectMyBidInfo(conn, userId);
		JDBCTemplate.close(conn);
		
		return list;
	}
}
