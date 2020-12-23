package hotsix.goodseller.admin.board.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import hotsix.goodseller.admin.board.qna.model.dao.BoardDAO;
import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.admin.board.qna.model.vo.BoardPageData;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.vo.Board;

public class BoardService {

	public BoardPageData csBoardAllListPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordPerPage = 15;

		ArrayList<Board> list = BoardDAO.csBoardAllListPage(conn, currentPage, recordPerPage);

		int naviCountPerPage = 5;

		String pageNavi = BoardDAO.getPageNavi(conn, currentPage, recordPerPage, naviCountPerPage);

		BoardPageData cs = new BoardPageData();
		cs.setList(list);
		cs.setCSpageNavi(pageNavi);

		JDBCTemplate.close(conn);

		return cs;
	}

	public Board CSOneClick(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		Board board = BoardDAO.CSOneClick(conn, boardNo);

		return board;
	}

	public ArrayList<BoardAnswer> csBoardAnwser(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BoardAnswer> answer = BoardDAO.csBoardAnwser(conn, boardNo);
		return answer;
	}
	
	public void insertAdminAnswerBoard(HttpServletRequest request) {
		Connection conn = JDBCTemplate.getConnection();
		BoardDAO.insertAdminAnswerBoard(conn, request);
	}
	
	

}
