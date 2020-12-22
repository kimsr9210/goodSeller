package hotsix.goodseller.admin.board.report.vo;

import java.util.ArrayList;

import hotsix.goodseller.user.board.model.vo.Report;

public class ReportPageData {

	private ArrayList<Report> list;
	private String pageNavi;
	
	public ReportPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReportPageData(ArrayList<Report> list, String pageNavi) {
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
