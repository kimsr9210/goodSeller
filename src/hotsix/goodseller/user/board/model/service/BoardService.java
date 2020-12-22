package hotsix.goodseller.user.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.dao.BoardDAO;
import hotsix.goodseller.user.board.model.vo.Board;
import hotsix.goodseller.user.board.model.vo.BoardPageData;
import hotsix.goodseller.user.board.model.vo.Report;
import hotsix.goodseller.user.board.model.vo.ReqBoardPageData;

public class BoardService {
	BoardDAO boardDAO = new BoardDAO();
	
	public BoardPageData selectAllListPage(int currentPage) {
		
		Connection conn = JDBCTemplate.getConnection();
		int recordPerPage = 15;
		ArrayList<Board> list = boardDAO.selectAllListPage(conn, currentPage, recordPerPage);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getpageNavi(conn,currentPage,recordPerPage,naviCountPerPage);
		
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return bpd;
		
	}
	
	public int writeBoard(String userId, String subject, String content, char postLockYN) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.writeBoard(conn, userId, subject, content, postLockYN);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}
	public void updateHit(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.updateHit(conn, boardNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
	}
	
	public Board postOneClick(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		Board board = boardDAO.postOneClick(conn, boardNo);
		return board;
	}

	public int boardDelete(int boardNo, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = boardDAO.boardDelete(conn, boardNo, userId);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public BoardPageData BoardSearchSubject(int currentPage, String searchText) {

		Connection conn = JDBCTemplate.getConnection();
		
		int recordPerPage = 15; 
		ArrayList<Board> list = boardDAO.boardSearchSubjectList(conn, currentPage, recordPerPage, searchText);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getpageNavi(conn, currentPage, recordPerPage, naviCountPerPage);
				
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		
		return bpd;
	}

	public BoardPageData BoardSearchContent(int currentPage, String searchText) {

		Connection conn = JDBCTemplate.getConnection();
		
		int recordPerPage = 15; 
		ArrayList<Board> list = boardDAO.boardSearchContentList(conn, currentPage, recordPerPage, searchText);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getpageNavi(conn, currentPage, recordPerPage, naviCountPerPage);
				
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		
		return bpd;
	}

	public BoardPageData BoardSearchWriter(int currentPage, String searchText) {

		Connection conn = JDBCTemplate.getConnection();
		
		int recordPerPage = 15; 
		ArrayList<Board> list = boardDAO.boardSearchWriterList(conn, currentPage, recordPerPage, searchText);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getpageNavi(conn, currentPage, recordPerPage, naviCountPerPage);
				
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		
		return bpd;		
	}

	public int ReportInsert(String userId, String subject, String content, String reportId) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result = boardDAO.ReportInsert(conn,userId,subject,content,reportId);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}


	public BoardPageData MyPageQnAList(int currentPage, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordPerPage = 15; 
		ArrayList<Board> list = boardDAO.MyPageQnAList(conn, currentPage, recordPerPage, userId);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getMyQnAPageNavi(conn, currentPage, recordPerPage, naviCountPerPage);
				
		BoardPageData bpd = new BoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		
		return bpd;
	}

	public ReqBoardPageData MyPageRegisterList(int currentPage, String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int recordPerPage = 15; 
		ArrayList<Report> list = boardDAO.MyPageRegisterList(conn, currentPage, recordPerPage, userId);
		
		int naviCountPerPage = 5;
		String pageNavi = boardDAO.getMyRegisterPageNavi(conn, currentPage, recordPerPage, naviCountPerPage);
				
		ReqBoardPageData rbpd = new ReqBoardPageData();
		rbpd.setList(list);
		rbpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		
		return rbpd;
	}

	
}
