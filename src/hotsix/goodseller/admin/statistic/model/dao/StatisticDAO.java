package hotsix.goodseller.admin.statistic.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.member.model.vo.Member;

public class StatisticDAO {

	public ArrayList incomeMonthSelect(Connection conn) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int income = 0;

		// 회원정보를 담을 객체
		ArrayList list = new ArrayList();

		String query = "select sum(auctionPrice)*0.03 as incomeMonth " + "from posttbl "
				+ "where buyer is not null and del_yn='N' and sell_yn='Y' "
				+ "and postNo IN (select postNo from auction "
				+ "where (postNo,offerPrice) IN (select postNo,Max(offerPrice) from auction group by postNo) and biddingDate like ?)"
				+ "order by postNo";

		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 1; i <= 12; i++) {
				if (i < 10) {
					pstmt.setString(1, "20/0" + i + "/%");
				} else {
					pstmt.setString(1, "20/" + i + "/%");
				}

				rset = pstmt.executeQuery();
				if (rset.next()) {
					income = rset.getInt("incomeMonth");
					list.add(income);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public ArrayList signUpMonthly(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int countMember = 0;

		// 회원정보를 담을 객체
		ArrayList list = new ArrayList();

		String query = "select count(*) as countMember from member " + 
				"where enrolldate like ?";

		try {
			pstmt = conn.prepareStatement(query);
			for (int i = 1; i <= 12; i++) {
				if (i < 10) {
					pstmt.setString(1, "20/0" + i + "/%");
				} else {
					pstmt.setString(1, "20/" + i + "/%");
				}

				rset = pstmt.executeQuery();
				if (rset.next()) {
					countMember = rset.getInt("countMember");
					list.add(countMember);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
