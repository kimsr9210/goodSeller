package hotsix.goodseller.admin.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.admin.member.model.dao.AdminMemberDAO;
import hotsix.goodseller.admin.member.model.vo.MemberPageData;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.dao.MemberDAO;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

public class AdminMemberService {
	AdminMemberDAO aDAO = new AdminMemberDAO();

	public ArrayList<Member> selectMemberAll() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = aDAO.selectMemberAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Member> selectEndMemberAll() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = aDAO.selectEndMemberAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<Member> selectAdminAll() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = aDAO.selectAdminAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public MemberPageData selectMemberListPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.selectMemberListPage(conn, currentPage, recordCountPerPage);
		
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getMemberPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public MemberPageData selectEndMemberListPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.selectEndMemberListPage(conn, currentPage, recordCountPerPage);
		
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getEndMemberPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public MemberPageData selectAdminListPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.selectAdminListPage(conn, currentPage, recordCountPerPage);		
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getAdminPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public MemberPageData memberSearchList(String select, String keyword, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.memberSearchList(conn, currentPage, recordCountPerPage, select, keyword);
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getMemberSearchPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage, select, keyword);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public MemberPageData endMemberSearchList(String select, String keyword, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.endMemberSearchList(conn, currentPage, recordCountPerPage, select, keyword);
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getEndMemberSearchPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage, select, keyword);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

	public MemberPageData adminSearchList(String select, String keyword, int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordCountPerPage = 5; //한 페이지 당  회원 명수
		
		//화면 만들기
		ArrayList<Member> list = aDAO.adminSearchList(conn, currentPage, recordCountPerPage, select, keyword);
		
		//navi 값 보여주기
		int naviCountPerPage = 5; //한번에 navi 값 몇 개
		String pageNavi = aDAO.getAdminSearchPageNavi(conn, currentPage, recordCountPerPage, naviCountPerPage, select, keyword);
		
		MemberPageData mpd = new MemberPageData();
		mpd.setList(list);
		mpd.setPageNavi(pageNavi);
		JDBCTemplate.close(conn);
		return mpd;
	}

}
