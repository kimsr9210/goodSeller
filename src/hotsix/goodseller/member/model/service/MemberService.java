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
	
	public String phoneCheck(String checkPhone) {
		Connection conn = JDBCTemplate.getConnection();
		String phone = mDAO.phoneCheck(conn, checkPhone);
		JDBCTemplate.close(conn);
		return phone;
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
	
	public Member memberFindId(String method, String userName, String userInfo) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = mDAO.memberFindId(conn,method,userName,userInfo);
		JDBCTemplate.close(conn);
		return m;
	}
	
	public Member memberFindPw(String method, String userName, String userId, String userInfo) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = mDAO.memberFindPw(conn,method,userName,userId,userInfo);
		JDBCTemplate.close(conn);
		return m;
	}

	public int memberTempPw( String method, String userName, String userId, String userInfo, String userNewPw) {
		Connection conn = JDBCTemplate.getConnection();
		int result = mDAO.memberTempPw(conn,method,userName,userId,userInfo,userNewPw);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
		
		
	}

	public Member adminLogin(String userId, String userPw) {
		Connection conn = JDBCTemplate.getConnection();
		Member admin=mDAO.adminLogin(conn, userId, userPw);
		JDBCTemplate.close(conn);
		return admin;
	}
}
