package hotsix.goodseller.post.model.service;

import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.post.model.dao.PostDAO;

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

}
