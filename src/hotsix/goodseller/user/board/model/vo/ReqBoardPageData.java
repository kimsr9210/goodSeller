package hotsix.goodseller.user.board.model.vo;

import java.util.ArrayList;

public class ReqBoardPageData {
	
	private ArrayList<Report> list;
	private String pageNavi;
	public ReqBoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReqBoardPageData(ArrayList<Report> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Report> getList() {
		return list;
	}
	public void setList(ArrayList<Report> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	

}
