package hotsix.goodseller.user.board.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Report {
	private int reportNo;
	private String userId;
	private String reportId;
	private String subject;
	private String content;
	private Timestamp writeDate;
	private char answerYN;
	
	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Report(int reportNo, String userId, String reportId, String subject, String content, Timestamp writeDate,
			char answerYN) {
		super();
		this.reportNo = reportNo;
		this.userId = userId;
		this.reportId = reportId;
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

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
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

	public char getAnswerYN() {
		return answerYN;
	}

	public void setAnswerYN(char answerYN) {
		this.answerYN = answerYN;
	}
	
	
	

}
