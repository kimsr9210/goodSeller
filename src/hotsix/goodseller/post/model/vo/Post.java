package hotsix.goodseller.post.model.vo;

import java.sql.Date;

public class Post {
	private int postNo;
	private String subject;
	private String content;
	private String writer;
	private Date endDate;
	private Date regDate;
	private String mainImgName;
	private String subImgName_1;
	private String subImgName_2;
	private String subImgName_3;
	private String subImgName_4;
	private int startPrice;
	private int buyPrice;
	private int auctionPrice;
	private String buyer;
	private String sellMethod;
	private String mainCategory;
	private String subCategory;
	private char sell_yn;
	private char del_yn;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(int postNo, String subject, String content, String writer, Date endDate, Date regDate,
			String mainImgName, String subImgName_1, String subImgName_2, String subImgName_3, String subImgName_4,
			int startPrice, int buyPrice, int auctionPrice, String buyer, String sellMethod, String mainCategory,
			String subCategory, char sell_yn, char del_yn) {
		super();
		this.postNo = postNo;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.endDate = endDate;
		this.regDate = regDate;
		this.mainImgName = mainImgName;
		this.subImgName_1 = subImgName_1;
		this.subImgName_2 = subImgName_2;
		this.subImgName_3 = subImgName_3;
		this.subImgName_4 = subImgName_4;
		this.startPrice = startPrice;
		this.buyPrice = buyPrice;
		this.auctionPrice = auctionPrice;
		this.buyer = buyer;
		this.sellMethod = sellMethod;
		this.mainCategory = mainCategory;
		this.subCategory = subCategory;
		this.sell_yn = sell_yn;
		this.del_yn = del_yn;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMainImgName() {
		return mainImgName;
	}
	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}
	public String getSubImgName_1() {
		return subImgName_1;
	}
	public void setSubImgName_1(String subImgName_1) {
		this.subImgName_1 = subImgName_1;
	}
	public String getSubImgName_2() {
		return subImgName_2;
	}
	public void setSubImgName_2(String subImgName_2) {
		this.subImgName_2 = subImgName_2;
	}
	public String getSubImgName_3() {
		return subImgName_3;
	}
	public void setSubImgName_3(String subImgName_3) {
		this.subImgName_3 = subImgName_3;
	}
	public String getSubImgName_4() {
		return subImgName_4;
	}
	public void setSubImgName_4(String subImgName_4) {
		this.subImgName_4 = subImgName_4;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(int buyPrice) {
		this.buyPrice = buyPrice;
	}
	public int getAuctionPrice() {
		return auctionPrice;
	}
	public void setAuctionPrice(int auctionPrice) {
		this.auctionPrice = auctionPrice;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getSellMethod() {
		return sellMethod;
	}
	public void setSellMethod(String sellMethod) {
		this.sellMethod = sellMethod;
	}
	public String getMainCategory() {
		return mainCategory;
	}
	public void setMainCategory(String mainCategory) {
		this.mainCategory = mainCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public char getSell_yn() {
		return sell_yn;
	}
	public void setSell_yn(char sell_yn) {
		this.sell_yn = sell_yn;
	}
	public char getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(char del_yn) {
		this.del_yn = del_yn;
	}
	@Override
	public String toString() {
		return "Post [postNo=" + postNo + ", subject=" + subject + ", content=" + content + ", writer=" + writer
				+ ", endDate=" + endDate + ", regDate=" + regDate + ", mainImgName=" + mainImgName + ", subImgName_1="
				+ subImgName_1 + ", subImgName_2=" + subImgName_2 + ", subImgName_3=" + subImgName_3 + ", subImgName_4="
				+ subImgName_4 + ", startPrice=" + startPrice + ", buyPrice=" + buyPrice + ", auctionPrice="
				+ auctionPrice + ", buyer=" + buyer + ", sellMethod=" + sellMethod + ", mainCategory=" + mainCategory
				+ ", subCategory=" + subCategory + ", sell_yn=" + sell_yn + ", del_yn=" + del_yn + "]";
	}
	
	
}
