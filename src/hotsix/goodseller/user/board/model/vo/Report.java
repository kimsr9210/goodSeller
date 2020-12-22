package hotsix.goodseller.user.board.model.vo;

import java.sql.Date;

public class Report {
	private int reportNo;
	private String userId;
	private String reportid;
	private String subject;
	private String content;
	private Date writeDate;
	private char answerYN;
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Report(int reportNo, String userId, String reportid, String subject, String content, Date writeDate,
			char answerYN) {
		super();
		this.reportNo = reportNo;
		this.userId = userId;
		this.reportid = reportid;
		this.subject = subject;
		this.content = content;
		this.writeDate = writeDate;
		this.answerYN = answerYN;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReportid() {
		return reportid;
	}
	public void setReportid(String reportid) {
		this.reportid = reportid;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public char getAnswerYN() {
		return answerYN;
	}
	public void setAnswerYN(char answerYN) {
		this.answerYN = answerYN;
	} 
	
	

}
