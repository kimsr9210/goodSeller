package hotsix.goodseller.user.post.model.vo;

public class InterestProduct {
	private int postNo;
	
	
	
	public InterestProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InterestProduct(int postNo, String userId) {
		super();
		this.postNo = postNo;
		this.userId = userId;
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
	private String userId;

	
	
	
}
