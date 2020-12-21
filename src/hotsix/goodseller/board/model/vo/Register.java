package hotsix.goodseller.board.model.vo;

import java.sql.Date;

public class Register {
	
	private int boardNo;
	private String userId;
	private String subject;
	private String content;
	private String reguserId;
	private Date createdate;
	private String boardcomment;
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
	public String getReguserId() {
		return reguserId;
	}
	public void setReguserId(String reguserId) {
		this.reguserId = reguserId;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getBoardcomment() {
		return boardcomment;
	}
	public void setBoardcomment(String boardcomment) {
		this.boardcomment = boardcomment;
	}
	public Register(int boardNo, String userId, String subject, String content, String reguserId, Date createdate,
			String boardcomment) {
		super();
		this.boardNo = boardNo;
		this.userId = userId;
		this.subject = subject;
		this.content = content;
		this.reguserId = reguserId;
		this.createdate = createdate;
		this.boardcomment = boardcomment;
	}
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

	
	

}
