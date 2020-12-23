package hotsix.goodseller.admin.post.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.admin.post.model.dao.AdminPostDAO;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

public class AdminPostService {
	AdminPostDAO apDAO = new AdminPostDAO();
	public PostPageData selectPostAllPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 30; //한 페이지 당 몇개씩 보여줄 것이냐
		
		//화면 만들기
		ArrayList<Post> list = apDAO.selectPostAllList(conn, currentPage, recordCountPerPage);
		
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //navi 값 몇개 보여줄지
		String pageNavi = apDAO.getPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		PostPageData ppd = new PostPageData();
		ppd.setList(list);
		ppd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return ppd;
	}
	public int updateSellStatePost(int postNo, char sell_yn) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = apDAO.updateSellStatePost(conn, postNo, sell_yn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
	}
	public int updateDelStatePost(int postNo, char del_yn) {
Connection conn = JDBCTemplate.getConnection();
		
		int result = apDAO.updateDelStatePost(conn, postNo, del_yn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
