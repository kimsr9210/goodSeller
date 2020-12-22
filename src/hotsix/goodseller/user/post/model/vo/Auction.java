package hotsix.goodseller.user.post.model.vo;

import java.sql.Timestamp;

public class Auction {
	
	private int postNo;
	private String userId;
	private Timestamp biddingDate;
	private int offerPrice;
	private char cancelYN;
	 
	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Auction(int postNo, String userId, Timestamp biddingDate, int offerPrice, char cancelYN) {
		super();
		this.postNo = postNo;
		this.userId = userId;
		this.biddingDate = biddingDate;
		this.offerPrice = offerPrice;
		this.cancelYN = cancelYN;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Timestamp getBiddingDate() {
		return biddingDate;
	}

	public void setBiddingDate(Timestamp biddingDate) {
		this.biddingDate = biddingDate;
	}

	public int getOfferPrice() {
		return offerPrice;
	}

	public void setOfferPrice(int offerPrice) {
		this.offerPrice = offerPrice;
	}

	public char getCancelYN() {
		return cancelYN;
	}

	public void setCancelYN(char cancelYN) {
		this.cancelYN = cancelYN;
	}
	 
	
	
	
}
