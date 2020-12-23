package hotsix.goodseller.admin.board.qna.model.vo;

import java.util.ArrayList;

import hotsix.goodseller.user.board.model.vo.Board;

public class BoardPageData {

	private ArrayList<Board>list;
	private String CSpageNavi;
	
	public ArrayList<Board> getList() {
		return list;
	}
	public void setList(ArrayList<Board> list) {
		this.list = list;
	}
	public String getCSpageNavi() {
		return CSpageNavi;
	}
	public void setCSpageNavi(String cSpageNavi) {
		CSpageNavi = cSpageNavi;
	}
	public BoardPageData(ArrayList<Board> list, String cSpageNavi) {
		super();
		this.list = list;
		CSpageNavi = cSpageNavi;
	}
	public BoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
