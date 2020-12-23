package hotsix.goodseller.admin.board.qna.model.vo;

import java.sql.Timestamp;

public class BoardAnswer {
	private int boardNo;
	private String adminId;
	private String subject;
	private String content;
	private Timestamp writeDate;
	public BoardAnswer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardAnswer(int boardNo, String adminId, String subject, String content, Timestamp writeDate) {
		super();
		this.boardNo = boardNo;
		this.adminId = adminId;
		this.subject = subject;
		this.content = content;
		this.writeDate = writeDate;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
