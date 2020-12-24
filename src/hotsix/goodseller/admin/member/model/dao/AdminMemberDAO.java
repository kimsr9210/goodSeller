package hotsix.goodseller.admin.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.vo.Post;

public class AdminMemberDAO {

	public ArrayList<Member> selectMemberAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		//회원정보를 담을 객체
		ArrayList<Member> list=new ArrayList<Member>();
		
		String query="SELECT * FROM MEMBER WHERE USERNO>=1000 AND END_YN='N'";
		//SELECT * FROM MEMBER WHERE END_YN='N'
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Member> selectEndMemberAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		//회원정보를 담을 객체
		ArrayList<Member> list=new ArrayList<Member>();
		
		String query="SELECT * FROM MEMBER WHERE USERNO>=1000 AND END_YN='Y'";
		//SELECT * FROM MEMBER WHERE END_YN='N'
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectAdminAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		//회원정보를 담을 객체
		ArrayList<Member> list=new ArrayList<Member>();
		
		String query="SELECT * FROM MEMBER WHERE USERNO<=100";
		//SELECT * FROM MEMBER WHERE END_YN='N'
		
		try {
			pstmt=conn.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectMemberListPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		Post p = null;
		
		int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY userNo DESC) AS ROW_NUM, "
				+ "Member.* FROM Member WHERE USERNO>=1000 AND END_YN='N') WHERE ROW_NUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
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

	public String getMemberPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int postTotalCount = memberTotalCount(conn);	
		
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
		
		if (startNavi != 1) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/memberAllList.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/memberAllList.do?currentPage=" + i
						+ "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/memberAllList.do?currentPage=" + i
						+ "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/memberAllList.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();
	}

	private int memberTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int memberTotalCount = 0;
		
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM MEMBER WHERE USERNO>=1000 AND END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			rset.next();
			memberTotalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return memberTotalCount;
	}

	public ArrayList<Member> selectEndMemberListPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		Post p = null;
		
		int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY userNo DESC) AS ROW_NUM, "
				+ "Member.* FROM Member WHERE USERNO>=1000  AND END_YN='Y') WHERE ROW_NUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
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

	public String getEndMemberPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int postTotalCount = endMemberTotalCount(conn);	
		
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
		
		if (startNavi != 1) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/endMemberAllList.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/endMemberAllList.do?currentPage=" + i
						+ "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/endMemberAllList.do?currentPage=" + i
						+ "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/endMemberAllList.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();
	}
	
	private int endMemberTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int memberTotalCount = 0;
		
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM MEMBER WHERE USERNO>=1000 AND END_YN='Y'";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			rset.next();
			memberTotalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return memberTotalCount;
	}

	public ArrayList<Member> selectAdminListPage(Connection conn, int currentPage, int recordCountPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		Post p = null;
		
		int start = (currentPage*recordCountPerPage)-(recordCountPerPage-1);
		int end = currentPage*recordCountPerPage;
		
		String query = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY userNo DESC) AS ROW_NUM, "
				+ "Member.* FROM Member WHERE USERNO<=100) WHERE ROW_NUM between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m=new Member();
				m.setUserNo(rset.getInt("USERNO"));
				m.setUserId(rset.getString("USERID"));
				m.setUserPw(rset.getString("USERPW"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserNick(rset.getString("USERNICK"));
				m.setBirth(rset.getString("BIRTH"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setAddress(rset.getString("ADDRESS"));
				m.setReported(rset.getInt("REPORTED"));
				m.setCancellation(rset.getInt("CANCELLATION"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				list.add(m);
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
	public String getAdminPageNavi(Connection conn, int currentPage, int recordCountPerPage, int naviCountPerPage) {
		int postTotalCount = adminTotalCount(conn);	
		
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
		
		if (startNavi != 1) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminAllList.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminAllList.do?currentPage=" + i
						+ "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminAllList.do?currentPage=" + i
						+ "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminAllList.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();
	}
	
	private int adminTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int memberTotalCount = 0;
		
		String query = "SELECT COUNT(*) AS TOTALCOUNT FROM MEMBER WHERE USERNO<=100";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			rset.next();
			memberTotalCount = rset.getInt("TOTALCOUNT");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return memberTotalCount;
	}
}

