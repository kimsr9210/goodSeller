package hotsix.goodseller.user.trade.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.trade.model.vo.Trade;
import hotsix.goodseller.user.trade.service.TradeService;

/**
 * Servlet implementation class MyPageTradeSellListServlet
 */
@WebServlet("/tradeSellList.do")
public class MyPageTradeSellListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageTradeSellListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("member");

		if (m == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션만료 다시 로그인하여 주십시오.')");
			out.println("location.href ='/index.do';");
			out.println("</script>");
		}
		String userId = m.getUserId();
		
		
		ArrayList<Trade> sellList = new TradeService().myPageSellList(userId);
		ArrayList<Post> sellPostList = new ArrayList<Post>();


		if (sellList != null) {
			for (Trade t : sellList) {
				sellPostList.add(new PostService().auctionDetail(t.getPostNo()));
			}
			// ArrayList<Board> list = new BoardService().MyPageQnAList(userId);
		}
		
		System.out.println(sellList);
		System.out.println(sellPostList);
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/tradeSellList.jsp");
		request.setAttribute("sellList", sellList);
		request.setAttribute("sellPostList", sellPostList);
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
