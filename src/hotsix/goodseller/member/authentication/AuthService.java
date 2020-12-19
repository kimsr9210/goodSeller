package hotsix.goodseller.member.authentication;


import java.sql.Connection;

import hotsix.goodseller.common.JDBCTemplate;

public class AuthService {
	AuthDAO aDAO = new AuthDAO();
	
	public int insertAuthNum(int rand) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		int result = aDAO.insertAuthNum(conn, rand);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public boolean checkAuth(int inputNum) {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		boolean result = aDAO.checkAuth(conn, inputNum);
		
		if (result) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public void deleteAuthNum() {
		// TODO Auto-generated method stub
		Connection conn = JDBCTemplate.getConnection();
		boolean result = aDAO.deleteAuthNum(conn);
		
		if (result) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
	}
}
