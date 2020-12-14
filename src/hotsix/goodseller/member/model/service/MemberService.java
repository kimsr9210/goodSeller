package hotsix.goodseller.member.model.service;

import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.dao.MemberDAO;
import hotsix.goodseller.member.model.vo.Member;

public class MemberService {
	MemberDAO mDAO = new MemberDAO();
	
	public int memberJoin(Member m) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.memberJoin(conn, m);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		System.out.println(result);
		return result;
	}
	
	public Member memberLogin(String userId, String userPw) {
		Connection conn = JDBCTemplate.getConnection();
		Member m=mDAO.memberLogin(conn, userId, userPw);
		JDBCTemplate.close(conn);
		return m;
	}
	
	public String idCheck(String userIdCheck) {
		Connection conn = JDBCTemplate.getConnection();
		String userId = mDAO.idCheck(conn, userIdCheck);
		JDBCTemplate.close(conn);
		return userId;
	}
	
	public String nickCheck(String userNickCheck) {
		Connection conn = JDBCTemplate.getConnection();
		String userNick = mDAO.nickCheck(conn, userNickCheck);
		JDBCTemplate.close(conn);
		return userNick;
	}

	public int deleteMember(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.deleteMember(conn,userId);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return result;
	}

	public int memberUpdate(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.memberUpdate(conn,m);
		if(result>0)
		{
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
