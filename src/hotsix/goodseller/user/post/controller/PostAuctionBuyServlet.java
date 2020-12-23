package hotsix.goodseller.user.post.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.user.post.model.service.PostService;

/**
 * Servlet implementation class PostAuctionBuyServlet
 */
@WebServlet("/auctionBuy.do")
public class PostAuctionBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostAuctionBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String userId = request.getParameter("userId");
		
		int result =new PostService().AuctionSellUpdate(postNo, userId);
		
		if(result>0) {
			RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionBuySuccess.jsp");
			request.setAttribute("postNo", postNo);
			view.forward(request, response);

		}else {

			RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionBuyFail.jsp");
			request.setAttribute("postNo", postNo);
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
