package hotsix.goodseller.admin.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.vo.Member;

public class AdminMemberDAO {

	public ArrayList<Member> selectMemberAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		//회원정보를 담을 객체
		ArrayList<Member> list=new ArrayList<Member>();
		
		String query="SELECT * FROM MEMBER";
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

}
