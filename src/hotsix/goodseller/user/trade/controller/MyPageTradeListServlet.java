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
 * Servlet implementation class MyPageTradeListServlet
 */
@WebServlet("/tradeList.do")
public class MyPageTradeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyPageTradeListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		
		
		ArrayList<Trade> buyList = new TradeService().myPageBuyList(userId);
		ArrayList<Post> buyPostList = null;
		int prevPostNo = -1;
		
		if (buyList != null) {
			buyPostList = new ArrayList<Post>();
			for (Trade t : buyList) {
				if(prevPostNo != t.getPostNo()) {
					buyPostList.add(new PostService().auctionDetail(t.getPostNo()));
					prevPostNo = t.getPostNo();
				} else {
					continue;
				}
			}
		}
		
		System.out.println(buyList);
		System.out.println(buyPostList);
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/tradeList.jsp");
		request.setAttribute("buyList", buyList);
		request.setAttribute("buyPostList", buyPostList);

		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
