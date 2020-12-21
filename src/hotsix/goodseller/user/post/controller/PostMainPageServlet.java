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
		
		//메인 카테고리들 
		String cateClothing = "의류 브랜드 패션";
		String cateLiving = "생활 건강";
		String cateHomeAppliances = "가구 가전";
		String cateDigital = "디지털 컴퓨터";
		String cateBooks = "도서 문구";
		String cateBeauty = "뷰티 잡화";
		String cateSports = "스포츠 레저";

		//페이지를 가져올 수 있는 비지니스 로직 처리		
		ArrayList<Post> clothingList = new PostService().auctionMainPostClothing(cateClothing);
		ArrayList<Post> livingList = new PostService().auctionMainPostLiving(cateLiving);
		ArrayList<Post> homeAppliancesList = new PostService().auctionMainPostHomeAppliances(cateHomeAppliances);
		ArrayList<Post> digitalList = new PostService().auctionMainPostDigital(cateDigital);
		ArrayList<Post> booksList = new PostService().auctionMainPostBooks(cateBooks);
		ArrayList<Post> beautyList = new PostService().auctionMainPostBeauty(cateBeauty);
		ArrayList<Post> sportsList = new PostService().auctionMainPostSports(cateSports);
		
		
		//결과 전송
		RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionMain.jsp");
		request.setAttribute("clothingList", clothingList);
		request.setAttribute("livingList", livingList);
		request.setAttribute("homeAppliancesList", homeAppliancesList);
		request.setAttribute("digitalList", digitalList);
		request.setAttribute("booksList", booksList);
		request.setAttribute("beautyList", beautyList);
		request.setAttribute("sportsList", sportsList);
		
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
