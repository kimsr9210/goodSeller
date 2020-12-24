package hotsix.goodseller.user.post.model.vo;

public class InterestProduct {
	private int postNo;
	private String userId;
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
	@Override
	public String toString() {
		return "InterestProduct [postNo=" + postNo + ", userId=" + userId + "]";
	}
	
	
	
	

	
	
	
}
