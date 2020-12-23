package hotsix.goodseller.auction.model.service;

import java.sql.Connection;

import hotsix.goodseller.auction.model.dao.AuctionDAO;
import hotsix.goodseller.common.JDBCTemplate;

public class AuctionService {
	AuctionDAO aDAO = new AuctionDAO();
	public String selectTransactionInfo(String writer) {
		Connection conn = JDBCTemplate.getConnection();
		String result = aDAO.selectTransactionInfo(conn, writer);
		JDBCTemplate.close(conn);
		
		return result;
	}

}
