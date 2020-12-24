package hotsix.goodseller.user.trade.model.vo;

public class Trade {
	private int postNo;
	private String sellerId;
	private String buyerId;
	private char tradeEnd;
	private char sellerState;
	private char buyerState;
	public Trade() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public char getTradeEnd() {
		return tradeEnd;
	}
	public void setTradeEnd(char tradeEnd) {
		this.tradeEnd = tradeEnd;
	}
	public char getSellerState() {
		return sellerState;
	}
	public void setSellerState(char sellerState) {
		this.sellerState = sellerState;
	}
	public char getBuyerState() {
		return buyerState;
	}
	public void setBuyerState(char buyerState) {
		this.buyerState = buyerState;
	}
	public Trade(int postNo, String sellerId, String buyerId, char tradeEnd, char sellerState, char buyerState) {
		super();
		this.postNo = postNo;
		this.sellerId = sellerId;
		this.buyerId = buyerId;
		this.tradeEnd = tradeEnd;
		this.sellerState = sellerState;
		this.buyerState = buyerState;
	}
	
	
}
