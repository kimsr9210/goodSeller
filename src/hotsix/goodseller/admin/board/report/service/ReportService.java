package hotsix.goodseller.admin.board.report.service;

import java.sql.Connection;
import java.util.ArrayList;

import hotsix.goodseller.admin.board.report.dao.ReportDAO;
import hotsix.goodseller.admin.board.report.vo.ReportAnswer;
import hotsix.goodseller.admin.board.report.vo.ReportPageData;
import hotsix.goodseller.common.JDBCTemplate;
import hotsix.goodseller.user.board.model.vo.Report;

public class ReportService {
	ReportDAO rDAO = new ReportDAO();
	
	public ReportPageData selectAllListPage(int currentPage) {
		Connection conn = JDBCTemplate.getConnection();
		int recordPerPage = 15;
		ArrayList<Report> list = rDAO.selectAllListPage(conn, currentPage, recordPerPage);
		
		int naviCountPerPage = 5;
		String pageNavi = rDAO.getpageNavi(conn,currentPage,recordPerPage,naviCountPerPage);
		
		ReportPageData rpd = new ReportPageData();
		rpd.setList(list);
		rpd.setPageNavi(pageNavi);
		
		JDBCTemplate.close(conn);
		
		return rpd;
	}

	public Report postOneClick(int reportNo) {
		Connection conn = JDBCTemplate.getConnection();
		Report r = rDAO.postOneClick(conn, reportNo);
		return r;
	}

	public int reportAnswerWrite(int reportNo, String adminId, String subject, String content) {
		Connection conn = JDBCTemplate.getConnection();
		
		int reportAnswerInsertResult = rDAO.reportAnswerWrite(conn, reportNo, adminId, subject, content);
		
		//reportTBL에 ANS_YN='Y'로 변경
		int changeAnswerYNResult = rDAO.reportAnswerYNUpdate(conn,reportNo);
		
		if(reportAnswerInsertResult>0 && changeAnswerYNResult>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		int result = reportAnswerInsertResult + changeAnswerYNResult ;

		return result;
	}

	public ReportAnswer reportAnswerInfo(int reportNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		ReportAnswer rAnswer = rDAO.reportAnswerInfo(conn, reportNo);
		return rAnswer;
	}

	public int memberReportInsert(String reportId, String adminId, String reportReason) {
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.memberReportInsert(conn, reportId, adminId, reportReason);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public void UpdateReported(String reportId) {
		
		Connection conn = JDBCTemplate.getConnection();
		int result = rDAO.updateReported(conn, reportId);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
	}



	
	
}
