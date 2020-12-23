package hotsix.goodseller.admin.post.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Post;

public class AdminPostDAO {

	public ArrayList<Post> selectAllList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Post p = null;
		ArrayList<Post> list = new ArrayList<Post>();
		
		String query = "SELECT * FROM POSTTBL";
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p = new Post();

				p.setPostNo(rset.getInt("postNo"));
				p.setSubject(rset.getString("subject"));
				p.setContent(rset.getString("content"));
				p.setWriter(rset.getString("writer"));
				p.setEndDate(rset.getDate("endDate"));
				p.setRegDate(rset.getDate("regDate"));
				p.setMainImgName(rset.getString("mainImgName"));
				p.setSubImgName_1(rset.getString("subImgName_1"));
				p.setSubImgName_2(rset.getString("subImgName_2"));
				p.setSubImgName_3(rset.getString("subImgName_3"));
				p.setSubImgName_4(rset.getString("subImgName_4"));
				p.setStartPrice(rset.getInt("startPrice"));
				p.setBuyPrice(rset.getInt("buyPrice"));
				p.setAuctionPrice(rset.getInt("auctionPrice"));
				p.setBuyer(rset.getString("buyer"));
				p.setSellMethod(rset.getString("sellMethod"));
				p.setMainCategory(rset.getString("mainCategory"));
				p.setSubCategory(rset.getString("subCategory"));
				p.setSell_yn(rset.getString("sell_yn").charAt(0));
				p.setDel_yn(rset.getString("del_yn").charAt(0));
				p.setHit(rset.getInt("hit"));
				
				list.add(p);
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

	public ArrayList<Post> selectPostAllList(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		Post p = null;
		
		int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY PostNO DESC) AS ROW_NUM, POSTTBL.* "+
						"FROM POSTTBL) WHERE ROW_NUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				p = new Post();
				p.setPostNo(rset.getInt("postNo"));
				p.setSubject(rset.getString("subject"));
				p.setContent(rset.getString("content"));
				p.setWriter(rset.getString("writer"));
				p.setEndDate(rset.getDate("endDate"));
				p.setRegDate(rset.getDate("regDate"));
				p.setMainImgName(rset.getString("mainImgName"));
				p.setSubImgName_1(rset.getString("subImgName_1"));
				p.setSubImgName_2(rset.getString("subImgName_2"));
				p.setSubImgName_3(rset.getString("subImgName_3"));
				p.setSubImgName_4(rset.getString("subImgName_4"));
				p.setStartPrice(rset.getInt("startPrice"));
				p.setBuyPrice(rset.getInt("buyPrice"));
				p.setAuctionPrice(rset.getInt("auctionPrice"));
				p.setBuyer(rset.getString("buyer"));
				p.setSellMethod(rset.getString("sellMethod"));
				p.setMainCategory(rset.getString("mainCategory"));
				p.setSubCategory(rset.getString("subCategory"));
				p.setSell_yn(rset.getString("sell_yn").charAt(0));
				p.setDel_yn(rset.getString("del_yn").charAt(0));
				p.setHit(rset.getInt("hit"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}

	public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int postTotalCount = postTotalCount(conn);	
		
		int pageTotalCount;		//전체 페이지의 개수를 저장하는 변수
		
		if(postTotalCount % recordCountPerPage > 0) {
			pageTotalCount = postTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = postTotalCount / recordCountPerPage + 0;
		}
		int startNavi = ((currentPage-1) / naviCountPerPage) * naviCountPerPage + 1;
		
		int endNavi = startNavi + naviCountPerPage - 1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		StringBuilder sb = new StringBuilder();
		
		if(startNavi!=1) {
			sb.append("<li class='page-item'><a href='/adminPostAllList.do?currentPage="+(startNavi-1)+"'> < </a></li>");
		}
		
		for(int i=startNavi; i<=endNavi; i++) {
			if(i==currentPage) {
				sb.append("<li class='page-item'><a href='/adminPostAllList.do?currentPage="+i+"'><b> "+i+" </b> </a></li>");
			}else {
				sb.append("<li class='page-item'><a href='/adminPostAllList.do?currentPage="+i+"'> "+i+" </a></li>");
			}
		}
		if(endNavi!=pageTotalCount) {
			sb.append("<li class='page-item'><a href='/adminPostAllList.do?currentPage="+(endNavi+1)+"'> > </a></li>");
		}

		return sb.toString();
	}

	public int postTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0;
		
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM POSTTBL";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			rset.next();
			postTotalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return postTotalCount;
	}

	public int updateSellStatePost(Connection conn, int postNo, char sell_yn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		if(sell_yn=='Y') {
			sell_yn='N';
		}else {
			sell_yn='Y';
		}
		
		String query = "UPDATE POSTTBL SET SELL_YN=? WHERE postNo=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, Character.toString(sell_yn));
			pstmt.setInt(2, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}

	public int updateDelStatePost(Connection conn, int postNo, char del_yn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		if(del_yn=='Y') {
			del_yn='N';
		}else {
			del_yn='Y';
		}
		
		String query = "UPDATE POSTTBL SET del_YN=? WHERE postNo=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, Character.toString(del_yn));
			pstmt.setInt(2, postNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	


}
