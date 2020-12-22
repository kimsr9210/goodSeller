package hotsix.goodseller.admin.board.vo;

import java.sql.Date;

public class RegisterComment {
	
	private int commntNo;
	private int boardNo;
	private String content;
	private String userId;
	private Date regDate; //임폴트 sql 
	private char delYm;
	public int getCommntNo() {
		return commntNo;
	}
	public void setCommntNo(int commntNo) {
		this.commntNo = commntNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public char getDelYm() {
		return delYm;
	}
	public void setDelYm(char delYm) {
		this.delYm = delYm;
	}
	public RegisterComment(int commntNo, int boardNo, String content, String userId, Date regDate, char delYm) {
		super();
		this.commntNo = commntNo;
		this.boardNo = boardNo;
		this.content = content;
		this.userId = userId;
		this.regDate = regDate;
		this.delYm = delYm;
	}
	public RegisterComment() {
		super();
		// TODO Auto-generated constructor stub
	}

}
