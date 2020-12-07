package hotsix.goodseller.member.model.service;

import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.dao.MemberDAO;
import hotsix.goodseller.member.model.vo.Member;

public class MemberService {
	MemberDAO mDAO = new MemberDAO();
	
	public boolean memberJoin(Member m) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		boolean result = mDAO.memberJoin(conn, m);
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public Member memberLogin(String userId, String userPw) {
		Connection conn = JDBCTemplate.getConnection();
		Member m=mDAO.memberLogin(conn, userId, userPw);
		JDBCTemplate.close(conn);
		return m;
	}
}
