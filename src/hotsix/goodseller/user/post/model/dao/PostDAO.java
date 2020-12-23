package hotsix.goodseller.user.post.model.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.post.model.vo.Post;

public class PostDAO {

	public int insertPost(Connection conn, String userId, String subject, String content, String endDate, int sPrice,
			int bPrice, String sellMethod, String mainCategory, String subCategory, String mainChangedFileName,
			String subChangedFileName_1, String subChangedFileName_2, String subChangedFileName_3,
			String subChangedFileName_4) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO POSTTBL VALUES(POSTTBL_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?,?,?,?,?,?,?,NULL,?,?,?,'N','N',0)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, userId);
			pstmt.setString(4, endDate);
			pstmt.setString(5, mainChangedFileName);
			pstmt.setString(6, subChangedFileName_1);
			pstmt.setString(7, subChangedFileName_2);
			pstmt.setString(8, subChangedFileName_3);
			pstmt.setString(9, subChangedFileName_4);
			pstmt.setInt(10, sPrice);
			pstmt.setInt(11, bPrice);
			pstmt.setInt(12, sPrice);
			pstmt.setString(13, sellMethod);
			pstmt.setString(14, mainCategory);
			pstmt.setString(15, subCategory);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<Post> selectPostPage(Connection conn, int currentPage, int recordCountPerPage, String mainCategory, String subCategory) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Post> list = new ArrayList<Post>();
		Post p = null;
		//여기서 필요한 로직이 바로 Top-N분석
		//5개씩 가져오려면 BoardNo를 바탕으로 내림차순으 한 뒤 가장 상위 5개를 가져와야 하기 때문에
		//TOP-N 분석 형태가 필요
		/*
		-- 1page 라면 1~5 까지의 Row_Num에 해당되는 데이터를 보여주어라
		SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY BOARDNO DESC) AS Row_Num , BOARD.*
		FROM BOARD) WHERE Row_Num between 1 and 5;

		-- 2page 라면 1~5 까지의 Row_Num에 해당되는 데이터를 보여주어라
		SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY BOARDNO DESC) AS Row_Num , BOARD.*
		FROM BOARD) WHERE Row_Num between 6 and 10;
		*/
		/*
		 start 와 end 구하는 공식
		 start = 현재페이지 * 보여줄 게시물 개수 - 4
		 end = 현재페이지 * 보여줄 게시물 개수
		 */
		int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY PostNO DESC) AS ROW_NUM, POSTTBL.* "+
						"FROM POSTTBL WHERE DEL_YN='N' AND MAINCATEGORY=? AND subCategory=?) WHERE ROW_NUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mainCategory);
			pstmt.setString(2, subCategory);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);
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
	
	//게시물 페이지에 대한 메소드
		public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage, String mainCategory, String subCategory) {
			// 현재 변수를 재확인
			// currentPage			: 현재 페이지를 가지고 있는 변수
			// recordCountperPage	: 한 페이지당 보여질 게시물 개수
			// naviCountPerPage		: pageNavi가 몇개씩 보여질 것인지에 대한 개수
			
			int postTotalCount = postTotalCount(conn, mainCategory, subCategory);	//전체 개시물의 개수를 구하기 위한 메소드
			
			// 생성될 페이지 개수를 구하기
			// ex) postTotalCount에 108이라는 값이 있따면? 22개의 page가 생성 되면 됨
			// 108 / 5 -> 몪이 페이지가 되는데, 나머지가 있으면 +1 없으면 0
			// ex) 105 / 5 -> 몫: 21 나머지:0 => 몫 + 0 => 21page
			// ex) 108 / 5 -> 몫: 21 나머지:3 => 몫 + 1 => 22page
			
			int pageTotalCount;		//전체 페이지의 개수를 저장하는 변수
			
			if(postTotalCount % recordCountPerPage > 0) {
				pageTotalCount = postTotalCount / recordCountPerPage + 1;
				// ex) pageTotalCount = 108 / 5 + 1 => 22page
			} else {
				pageTotalCount = postTotalCount / recordCountPerPage + 0;
				// ex) pageTotalCount = 105 / 5 + 0 => 21page
			}
			
			// 이제는 현재 페이지를 중심으로 pageNavi를 계산해야함
			// 만약 내가 현재 1page에 있다면 pageNavi는 어떻게 될까 (1~5페이지를 가진 pageNavi)
			// 만약 내가 현재 3page에 있다면 pageNavi는 어떻게 될까 (1~5페이지를 가진 pageNavi)
			// 만약 내가 현재 6page에 있다면 pageNavi는 어떻게 될까 (6~10페이지를 가진 pageNavi)
			// 만약 내가 현재 12page에 있다면 pageNavi는 어떻게 될까 (11~15페이지를 가진 pageNavi)
			// 만약 내가 현재 21page에 있다면 pageNavi는 어떻게 될까 (21~22페이지를 가진 pageNavi)
			
			//위 개념들을 바탕으로 현재 페이지를 중점으로 startNavi 페이지 번호와 endNavi 페이지 번호를 구할 것임
			
			//startNavi = ((현재페이지-1) / 보여질 navi개수) * 보여질navi 개수 +1;
			//-> ( / ) 얘는 몫만 구하는 공식임
			int startNavi = ((currentPage-1) / naviCountPerPage) * naviCountPerPage + 1;
			// ex) 1페이지 일 경우 (결과 : startNavi는 1이 나와야함)
			// ((1-1)/5)*5*1; -> 1
			// ex) 3페이지 일 경우 (결과 : startNavi는 1이 나와야함)
			// ((3-1)/5)*5*1; -> 1
			// ex) 6페이지 일 경우 (결과 : startNavi는 6이 나와야함)
			// ((6-1)/5)*5*1; -> 6
			// ex) 12페이지 일 경우 (결과 : startNavi는 11이 나와야함)
			// ((12-1)/5)*5*1; -> 11
			
			// endNavi = 시작navi번호 + 보여질 navi개수 - 1;
			int endNavi = startNavi + naviCountPerPage - 1;
			
			if(endNavi > pageTotalCount) {
				endNavi = pageTotalCount;
			}
			
			//공식계산 끝
			//이제 pageNavi의 모양을 구성해야함
			
			StringBuilder sb = new StringBuilder();
			
			if(startNavi!=1) {
				sb.append("<li class='page-item'><a class='page-link' aria-label='Previous' href='/auctionList.do?subCategory="+subCategory+"&mainCategory="+mainCategory+"&currentPage="+(startNavi-1)+"'><span aria-hidden='true'>&raquo;</span></a></li>");
			}
			
			for(int i=startNavi; i<=endNavi; i++) {
				if(i==currentPage) {
					sb.append("<li class='page-item'><a class='page-link' href='/auctionList.do?subCategory="+subCategory+"&mainCategory="+mainCategory+"&currentPage="+i+"'><b>"+i+"</b> </a></li>");
				}else {
					sb.append("<li class='page-item'><a class='page-link' href='/auctionList.do?subCategory="+subCategory+"&mainCategory="+mainCategory+"&currentPage="+i+"'>"+i+" </a></li>");
				}
			}
			if(endNavi!=pageTotalCount) {
				sb.append("<li class='page-item'><a class='page-link' aria-label='Next' href='/auctionList.do?subCategory="+subCategory+"&mainCategory="+mainCategory+"&currentPage="+(endNavi+1)+"'><span aria-hidden='true'>&raquo;</span> </a></li>");
			}

			return sb.toString();
		}

		//페이지의 총 갯수를 구하는 메소드
		public int postTotalCount(Connection conn, String mainCategory, String subCategory) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int postTotalCount = 0;
			
			String query = "SELECT COUNT(*) AS TOTALCOUNT " + 
					"FROM POSTTBL WHERE DEL_YN='N' AND MAINCATEGORY=? AND subCategory=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, mainCategory);
				pstmt.setString(2, subCategory);
				
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

		public ArrayList<Post> selectHitPost(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT * FROM POSTTBL WHERE SELL_YN='N' ORDER BY hit DESC) WHERE ROWNUM <= 8";
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
			} finally {
				JDBCTemplate.close(pstmt);
				JDBCTemplate.close(rset);
			}
			
			return list;
		}

		public Post auctionDetail(Connection conn, int postNo) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Post p = null;
			
			String query = "SELECT * FROM POSTTBL WHERE postNo = ? ";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, postNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
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
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return p;
		}
		

		public int updateHit(Connection conn, int postNo) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = "UPDATE POSTTBL SET hit = hit+1 where postNo=?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, postNo);
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}

			return result;

		}

		public ArrayList<Post> auctionMainPostClothing(Connection conn, String cateClothing) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateClothing);
				
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

		public ArrayList<Post> auctionMainPostLiving(Connection conn, String cateLiving) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateLiving);
				
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

		public ArrayList<Post> auctionMainPostHomeAppliances(Connection conn, String cateHomeAppliances) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateHomeAppliances);
				
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

		public ArrayList<Post> auctionMainPostDigital(Connection conn, String cateDigital) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateDigital);
				
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

		public ArrayList<Post> auctionMainPostBooks(Connection conn, String cateBooks) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateBooks);
				
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

		public ArrayList<Post> auctionMainPostBeauty(Connection conn, String cateBeauty) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N' AND SELL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateBeauty);
				
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

		public ArrayList<Post> auctionMainPostSports(Connection conn, String cateSports) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY hit DESC) AS Row_Num , postTbl.* FROM POSTTBL "
					+ "WHERE mainCategory like ? AND DEL_YN='N') WHERE Row_Num between 1 and 8";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, cateSports);
				
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

		public int auctionPriceUpdate(Connection conn, int postNo, String userId, int offerPrice) {
			
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = "UPDATE POSTTBL SET buyer=? , auctionPrice=? WHERE POSTNO=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setInt(2, offerPrice);
				pstmt.setInt(3, postNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
		}

		public int auctionTblInsert(Connection conn, int postNo, String userId, int offerPrice) {
			
			PreparedStatement pstmt = null;
			int result = 0;
			String query = "INSERT INTO auction VALUES(?,?,sysdate,?,'N')";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1,postNo);
				pstmt.setString(2, userId);
				pstmt.setInt(3, offerPrice);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
			
		}

		public int updatePostSellyn(Connection conn, int postNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = "UPDATE POSTTBL SET SELL_YN='Y' WHERE POSTNO=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, postNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int AuctionSellUpdate(Connection conn, int postNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = "UPDATE POSTTBL SET SELL_YN='Y' WHERE POSTNO=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, postNo);
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
		}

		public String selectPostNum(Connection conn, String writer) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String result = "";
			String query = "select count(*) from POSTTBL WHERE writer=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, writer);
				rset = pstmt.executeQuery();
				if(rset.next()) {
					result = rset.getString("count(*)");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
			
		}

		public ArrayList<Post> selectSearchPost(Connection conn, int currentPage, int recordCountPerPage,
				String keyword) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Post> list = new ArrayList<Post>();
			Post p = null;
			
			int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
			int end = currentPage*recordCountPerPage;
			
			String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY PostNO DESC) AS ROW_NUM, POSTTBL.* " + 
					"FROM POSTTBL WHERE DEL_YN='N' AND (CONTENT LIKE ? OR SUBJECT LIKE ?)) " + 
					"WHERE ROW_NUM between ? and ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
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

		public String getPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage,
				String keyword) {
			
			int postTotalCount = postTotalCount(conn, keyword);	
			
			
			int pageTotalCount;	
			
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
				sb.append("<li class='page-item'><a class='page-link' aria-label='Previous' href='/postingSearch.do?keyword="+keyword+"&currentPage="+(startNavi-1)+"'><span aria-hidden='true'>&raquo;</span></a></li>");
			}
			
			for(int i=startNavi; i<=endNavi; i++) {
				if(i==currentPage) {
					sb.append("<li class='page-item'><a class='page-link' href='/postingSearch.do?keyword="+keyword+"&currentPage="+i+"'><b>"+i+"</b> </a></li>");
				}else {
					sb.append("<li class='page-item'><a class='page-link' href='/postingSearch.do?keyword="+keyword+"&currentPage="+i+"'>"+i+" </a></li>");
				}
			}
			if(endNavi!=pageTotalCount) {
				sb.append("<li class='page-item'><a class='page-link' aria-label='Next' href='/postingSearch.do?keyword="+keyword+"&currentPage="+(endNavi+1)+"'><span aria-hidden='true'>&raquo;</span> </a></li>");
			}

			return sb.toString();
		}
		
		
		public int postTotalCount(Connection conn, String keyword) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			int postTotalCount = 0;
			
			String query = "SELECT COUNT(*) AS TOTALCOUNT FROM POSTTBL WHERE DEL_YN='N' AND (CONTENT LIKE ? OR SUBJECT LIKE ?)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				
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


}
