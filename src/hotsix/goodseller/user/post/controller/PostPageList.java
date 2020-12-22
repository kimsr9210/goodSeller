package hotsix.goodseller.user.post.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

/**
 * Servlet implementation class PostClothing
 */
@WebServlet("/auctionList.do")
public class PostPageList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostPageList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DecimalFormat formatter = new DecimalFormat("###,###");
		//카테고리가 무엇인지
		String mainCategory = request.getParameter("mainCategory");
		String subCategory = request.getParameter("subCategory");
		int currentPage;	//현재 페이지 값을 가지고있는 변수
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		//페이지를 가져올 수 있는 비지니스 로직 처리
		PostPageData ppd = new PostService().selectPostClothingPage(currentPage, mainCategory, subCategory);
		
		//꺼내온 데이터중 끝나는 날이 오늘(+1)이랑 맞다면
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String mYear = String.valueOf(cal.get(Calendar.YEAR));
		String mMonth = String.valueOf(cal.get(Calendar.MONTH)+1);
		String mDay = String.valueOf(cal.get(Calendar.DATE)+1);
		String eDate = mYear+"-"+mMonth+"-"+mDay;
		
		System.out.println("eDate : " + eDate);
		ArrayList<Post> list = ppd.getList();
		for(Post p : list) {
			
			if(format.format(p.getEndDate()).equals(eDate)) {
				int result = new PostService().updatePostSellyn(p.getPostNo());
				if(result>0) {
					System.out.println("상품번호 ["+p.getPostNo()+"]는 종료날짜가 되어 거래 완료되었습니다.");
				} 
			}
		}
		// 카테고리별 페이지 옮기기
		String cate = "";
		switch(mainCategory) {
		case "의류 브랜드 패션": cate="auctionClothing";break;
		case "생활 건강": cate="auctionLiving";break;
		case "가구 가전": cate="auctionHomeAppliances";break;
		case "디지털 컴퓨터": cate="auctionDigital";break;
		case "도서 문구": cate="auctionBooks";break;
		case "뷰티 잡화": cate="auctionBeauty";break;
		case "스포츠 레저": cate="auctionSports";break;
		}
		
		//System.out.println(cate);
		//System.out.println(subCategory);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/auction/"+cate+".jsp");
		request.setAttribute("PostPageData", ppd);
		request.setAttribute("subCategory", subCategory);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
