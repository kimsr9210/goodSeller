package hotsix.goodseller.admin.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.admin.member.model.dao.AdminMemberDAO;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.dao.MemberDAO;
import hotsix.goodseller.member.model.vo.Member;

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

}
