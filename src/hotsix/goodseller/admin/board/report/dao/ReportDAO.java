package hotsix.goodseller.admin.board.report.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import hotsix.goodseller.admin.board.report.vo.ReportAnswer;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.vo.Report;

public class ReportDAO {
	

	private int reportNo;
	private String userId;
	private String reporId;
	private String subject;
	private String content;
	private Timestamp writeDate;
	private char answerYN;

	public ArrayList<Report> selectAllListPage(Connection conn, int currentPage, int recordPerPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Report> list = new ArrayList<Report>();

		int start = currentPage * recordPerPage - (recordPerPage - 1);
		int end = currentPage * recordPerPage;

		String query = "SELECT * FROM (SELECT Row_NUMBER() OVER (order by writeDate) " + "AS Row_Num,REPORTTBL.* "
				+ "FROM REPORTTBL) WHERE Row_Num between ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Report r = new Report();
				r.setReportNo(rset.getInt("reportNo"));
				r.setUserId(rset.getString("userId"));
				r.setReportId(rset.getString("reportId"));
				r.setSubject(rset.getString("subject"));
				r.setContent(rset.getString("content"));
				r.setWriteDate(rset.getTimestamp("writeDate"));
				r.setAnswerYN(rset.getString("answer_YN").charAt(0));

				list.add(r);
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

	public int postTotalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int postTotalCount = 0;

		String query = "SELECT COUNT(*) as totalCount " + "FROM REPORTTBL";

		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			rset.next();
			postTotalCount = rset.getInt("totalCount");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return postTotalCount;
	}

	public String getpageNavi(Connection conn, int currentPage, int recordPerPage, int naviCountPerPage) {
		int postTotalCount = postTotalCount(conn);

		int pageTotalCount;
		if (postTotalCount % recordPerPage > 0) {
			pageTotalCount = postTotalCount / recordPerPage + 1;
		} else {
			pageTotalCount = postTotalCount / recordPerPage;
		}

		int startNavi = currentPage;
		int endNavi = startNavi + 4;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		StringBuilder sb = new StringBuilder();

		if (startNavi != 1) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
					+ (startNavi - 1) + "'> < </a></li>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage=" + i
						+ "'><b> " + i + " </b></a></li>");
			} else {
				sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage=" + i
						+ "'> " + i + " </a></li>");
			}
		}
		if (endNavi != pageTotalCount) {
			sb.append("<li class=\"page-item\"><a class=\"page-link\" href='/adminReportAllPageList.do?currentPage="
					+ (endNavi + 1) + "'> > </a></li>");
		}

		return sb.toString();

	}

	public Report postOneClick(Connection conn, int reportNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Report r = null;

		String query = "SELECT * FROM REPORTTBL WHERE reportNo = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				r = new Report();

				r.setReportNo(rset.getInt("reportNo"));
				r.setUserId(rset.getString("userId"));
				r.setReportId(rset.getString("reportId"));
				r.setSubject(rset.getString("subject"));
				r.setContent(rset.getString("content"));
				r.setWriteDate(rset.getTimestamp("writeDate"));
				r.setAnswerYN(rset.getString("answer_YN").charAt(0));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return r;
	}

	public int reportAnswerWrite(Connection conn, int reportNo, String adminId, String subject, String content) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO REPORTANSWER VALUES(?, ?, ?, ?, default)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			pstmt.setString(2, adminId);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;

	}

	public int reportAnswerYNUpdate(Connection conn, int reportNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "UPDATE REPORTTBL SET ANSWER_YN='Y' where reportNo=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public ReportAnswer reportAnswerInfo(Connection conn, int reportNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReportAnswer rAnswer = null;

		String query = "SELECT * FROM REPORTANSWER WHERE reportNo = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reportNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				rAnswer = new ReportAnswer();

				rAnswer.setReportNo(rset.getInt("reportNo"));
				rAnswer.setAdminId(rset.getString("adminId"));
				rAnswer.setSubject(rset.getString("subject"));
				rAnswer.setContent(rset.getString("content"));
				rAnswer.setWriteDate(rset.getTimestamp("writeDate"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return rAnswer;
	}

	

	
}