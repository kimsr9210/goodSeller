package hotsix.goodseller.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.board.model.vo.Board;
import hotsix.goodseller.common.JDBCTemplate;

public class BoardDAO {
	
	public ArrayList<Board> selectAllListPage(Connection conn, int currentPage, int recordPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> list = new ArrayList<Board>();

		int start = currentPage * recordPerPage - (recordPerPage-1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by BOARDNO DESC) "
				+ "AS Row_Num,BOARD.* "
				+ "FROM BOARD WHERE DEL_YN='N') WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board board = new Board();
				board.setBoardNo(rset.getInt("boardNo"));
				board.setUserId(rset.getString("userId"));
				board.setSubject(rset.getString("subject"));
				board.setBoardContent(rset.getString("boardContent"));
				board.setHit(rset.getInt("hit"));
				board.setWriteDate(rset.getDate("writeDate"));
				board.setAnswerYN(rset.getString("answer_YN").charAt(0));
				
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}
	
	public int postTotalCount(Connection conn)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0 ;
		
		String query = "SELECT COUNT(*) as totalCount "
				+ "FROM CSBOARD "
				+ "WHERE DEL_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			postTotalCount = rset.getInt("totalCount");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return postTotalCount;
	}
	
	public String getpageNavi(Connection conn, int currentPage, int recordPerPage, int naviCountPerPage) {
		int postTotalCount = postTotalCount(conn);
		
		int pageTotalCount;
		if(postTotalCount % recordPerPage > 0) {
			pageTotalCount = postTotalCount / recordPerPage + 1;
		}else {
			pageTotalCount = postTotalCount / recordPerPage;
		}
		
		int startNavi = currentPage ;
		int endNavi = startNavi + 4;
		
		if(endNavi > pageTotalCount)
		{
			endNavi = pageTotalCount;
		}

		StringBuilder sb = new StringBuilder();

		if(startNavi!=1)
		{
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="+(startNavi-1)+"'> < </a></li>");	
		}
		
		for(int i = startNavi; i<=endNavi; i++)
		{
			if(i==currentPage)
			{
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="+i+"'><b> "+ i +" </b></a></li>");
			}else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="+i+"'> "+ i +" </a></li>");	
			}
		}
		if(endNavi != pageTotalCount)
		{
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/boardAllListPage.do?currentPage="+(endNavi+1)+"'> > </a></li>");	
		}

	return sb.toString();
	
	}
	
	public int writeBoard(Connection conn, String userId, String subject, String content) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO CSBOARD VALUES(boardNo_seq.nextval, ?, ?, ?, default, sysdate , 'N', 'N' )"; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	//조회수 증가 메소드 ?? 
	public void updateHit(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update CSBOARD SET hit=hit+1 where boardNo=?";
		//이런식으로? 조금 더 생각.. 
	
	}



}
