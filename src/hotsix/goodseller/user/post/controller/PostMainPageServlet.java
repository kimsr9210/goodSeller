package hotsix.goodseller.user.post.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;

/**
 * Servlet implementation class PostMainPageServlet
 */
@WebServlet("/auctionMain.do")
public class PostMainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostMainPageServlet() {
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
		String mainClothing = "의류 브랜드 패션";
		//String mainLiving = "living";
		//String mainHomeAppliances = "homeAppliances";
		//String mainDigital = "digital";
		//String mainBooks = "books";
		//String mainBeauty = "beauty";
		//String mainSports = "sports";

		System.out.println("메인카테고리 : "+ mainClothing);
		//페이지를 가져올 수 있는 비지니스 로직 처리
		
		ArrayList<Post> clothingList = new PostService().mainCategoryPost(mainClothing);
		
		System.out.println(clothingList);
		System.out.println(clothingList.get(0).getSubject());
		
		//System.out.println(cate);
		//System.out.println(subCategory);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionMain.jsp");
		request.setAttribute("clothingList", clothingList);
		//request.setAttribute("PostPageData", ppd);
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
