package hotsix.goodseller.user.board.model.vo;

import java.sql.Timestamp;

public class Board {
	private int boardNo;
	private String userId;
	private String subject;
	private String content;
	private int hit;
	private Timestamp writeDate;
	private char postLockYN;
	private char answerYN;
	private char delYN;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int boardNo, String userId, String subject, String content, int hit, Timestamp writeDate,
			char postLockYN, char answerYN, char delYN) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.subject = subject;
		this.content = content;
		this.hit = hit;
		this.writeDate = writeDate;
		this.postLockYN = postLockYN;
		this.answerYN = answerYN;
		this.delYN = delYN;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public char getPostLockYN() {
		return postLockYN;
	}
	public void setPostLockYN(char postLockYN) {
		this.postLockYN = postLockYN;
	}
	public char getAnswerYN() {
		return answerYN;
	}
	public void setAnswerYN(char answerYN) {
		this.answerYN = answerYN;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	
	
}
