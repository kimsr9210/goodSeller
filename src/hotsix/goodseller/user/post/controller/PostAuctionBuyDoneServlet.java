package hotsix.goodseller.user.post.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.trade.service.TradeService;

/**
 * Servlet implementation class PostAuctionBuyDoneServlet
 */
@WebServlet("/auctionInfoChange.do")
public class PostAuctionBuyDoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostAuctionBuyDoneServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int postNo = Integer.parseInt(request.getParameter("postNo"));

		String buyerId = request.getParameter("buyerId");
		String sellerId = request.getParameter("sellerId");
		
		Post p = new PostService().InterestSelectPostInfo(postNo);

		new TradeService().insertTrade(postNo, sellerId, buyerId);
		
		int buyPrice = p.getBuyPrice(); // 즉시 구매가
		// 거래가 성사되었으니 portTbl sellYn='Y'로 변경 / auctionPrice = buyPrice로 변경
		// 또한, auctionTbl에 데이터 삽입
		
		int result = new PostService().directBuyUpdate(postNo , buyerId, buyPrice);
		
		if(result>=2) {
			response.sendRedirect("/trade.do?postNo="+p.getPostNo()+"&sellerId="+p.getWriter()+"&buyerId="+buyerId);
		}else {
			response.sendRedirect("/views/auction/auctionBuyFail.jsp");
		}
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
