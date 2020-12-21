package hotsix.goodseller.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.board.model.dao.BoardDAO;
import hotsix.goodseller.board.model.vo.Board;
import hotsix.goodseller.board.model.vo.BoardPageData;
import hotsix.goodseller.board.model.vo.Register;
import hotsix.goodseller.board.model.vo.ReqBoardPageData;
import hotsix.goodseller.common.JDBCTemplate;

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

	public int InsertRegister(String userId, String subject, String content, String reguserId) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result =boardDAO.InsertRegister(conn,userId,subject,content,reguserId);

		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ReqBoardPageData selectRegisterAllListPage(int currentPage, String selectBox, String searchText) {
		Connection conn = JDBCTemplate.getConnection();
		int recordPerPage = 15; //한 페이지당 몇개씩 게시물이 보이게 할 것인지를 정함.
		ArrayList<Register> list = boardDAO.selectRegisterAllListPage(conn, currentPage, recordPerPage, selectBox, searchText);
		
		//네비바 만듬 12345> <678910> ...
		int naviCountPerPage = 5; // PageNavi 값이 몇개씩 보여줄 것인지 
		String regGetpageNavi = boardDAO.regGetpageNavi(conn,currentPage,recordPerPage,naviCountPerPage);
		
		ReqBoardPageData bpd = new ReqBoardPageData();
		bpd.setList(list);
		bpd.setPageNavi(regGetpageNavi);
		
		JDBCTemplate.close(conn);
		return bpd;
		
	}

	public Register RegisterOneClick(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		Register register = boardDAO.RegisterOneClick(conn,boardNo);
		
		
		return register;
	}





	
}
