package hotsix.goodseller.admin.board.report.vo;

import java.sql.Timestamp;

public class ReportAnswer {

	private int reportNo;
	private String adminId;
	private String subject;
	private String content;
	private Timestamp writeDate;
	public ReportAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportAnswer(int reportNo, String adminId, String subject, String content, Timestamp writeDate) {
		super();
		this.reportNo = reportNo;
		this.adminId = adminId;
		this.subject = subject;
		this.content = content;
		this.writeDate = writeDate;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
