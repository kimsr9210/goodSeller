package hotsix.goodseller.admin.board.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import hotsix.goodseller.admin.board.qna.model.dao.BoardDAO;
import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.admin.board.qna.model.vo.BoardPageData;
import hotsix.goodseller.admin.board.report.vo.ReportAnswer;
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

	public int boardAnswerWrite(int boardNo, String adminId, String subject, String content) {
Connection conn = JDBCTemplate.getConnection();
		
		int boardAnswerInsertResult = BoardDAO.boardAnswerWrite(conn, boardNo, adminId, subject, content);
		
		//reportTBL에 ANS_YN='Y'로 변경
		int changeAnswerYNResult = BoardDAO.boardAnswerYNUpdate(conn,boardNo);
		
		if(boardAnswerInsertResult>0 && changeAnswerYNResult>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		int result = boardAnswerInsertResult + changeAnswerYNResult ;

		return result;
	}

	public BoardAnswer BoardAnswerInfo(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		BoardAnswer dAnswer = BoardDAO.reportAnswerInfo(conn, boardNo);
		return dAnswer;
	}
	
	

}
