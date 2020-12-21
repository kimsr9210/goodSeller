package hotsix.goodseller.post.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.post.model.dao.PostDAO;
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

}
