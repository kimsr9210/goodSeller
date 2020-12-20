package hotsix.goodseller.board.model.vo;

import java.util.ArrayList;

public class ReqBoardPageData {
	
	private ArrayList<Register> list;
	private String pageNavi;
	public ReqBoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReqBoardPageData(ArrayList<Register> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Register> getList() {
		return list;
	}
	public void setList(ArrayList<Register> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	

}
