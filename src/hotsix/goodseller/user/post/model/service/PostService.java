package hotsix.goodseller.user.post.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.dao.PostDAO;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

public class PostService {

	PostDAO pDAO = new PostDAO();
	public int insertPost(String userId, String subject, String content, String endDate, int sPrice, int bPrice,
			String sellMethod, String mainCategory, String subCategory, String mainChangedFileName,
			String subChangedFileName_1, String subChangedFileName_2, String subChangedFileName_3,
			String subChangedFileName_4) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = pDAO.insertPost(conn, userId, subject, content, endDate, sPrice, bPrice, sellMethod,
				mainCategory, subCategory, mainChangedFileName,subChangedFileName_1,subChangedFileName_2,subChangedFileName_3,subChangedFileName_4);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}
	public PostPageData selectPostClothingPage(int currentPage, String mainCategory, String subCategory) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 12; //한 페이지 당 몇개씩 보여줄 것이냐
		
		//화면 만들기
		ArrayList<Post> list = pDAO.selectPostPage(conn, currentPage, recordCountPerPage, mainCategory, subCategory);
		
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //navi 값 몇개 보여줄지
		String pageNavi = pDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage, mainCategory, subCategory);
		
		PostPageData ppd = new PostPageData();
		ppd.setList(list);
		ppd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return ppd;
		
		
	}
	public ArrayList<Post> selectHitPost() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Post> list = pDAO.selectHitPost(conn);
		JDBCTemplate.close(conn);
		return list;
		
	}
	
	public Post auctionDetail(int postNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Post p = pDAO.auctionDetail(conn, postNo);
		JDBCTemplate.close(conn);
		
		return p;
	}

	public void updateHit(int postNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = pDAO.updateHit(conn, postNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		
	}
	
	public ArrayList<Post> auctionMainPostClothing(String cateClothing) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostClothing(conn, cateClothing);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostLiving(String cateLiving) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostLiving(conn, cateLiving);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostHomeAppliances(String cateHomeAppliances) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostHomeAppliances(conn, cateHomeAppliances);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostDigital(String cateDigital) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostDigital(conn, cateDigital);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostBooks(String cateBooks) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostBooks(conn, cateBooks);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostBeauty(String cateBeauty) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostBeauty(conn, cateBeauty);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public ArrayList<Post> auctionMainPostSports(String cateSports) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Post> list = pDAO.auctionMainPostSports(conn, cateSports);
		JDBCTemplate.close(conn);
		
		return list;
	}
	public int AuctionPriceUpdate(int postNo, String userId, int offerPrice) {
		
		Connection conn = JDBCTemplate.getConnection();
		int auctionInsertResult = pDAO.auctionTblInsert(conn, postNo, userId, offerPrice);
		int postTBLUpdateResult = pDAO.auctionPriceUpdate(conn, postNo, userId, offerPrice);
		
		if(auctionInsertResult>0 && postTBLUpdateResult>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		int result = auctionInsertResult + postTBLUpdateResult ;

		return result;
		
		
	}
	public int AuctionSellUpdate(int postNo, String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = pDAO.AuctionSellUpdate(conn, postNo);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}
	
}
