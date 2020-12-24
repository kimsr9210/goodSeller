package hotsix.goodseller.user.trade.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.auction.model.service.AuctionService;
import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.trade.model.vo.Trade;
import hotsix.goodseller.user.trade.service.TradeService;

/**
 * Servlet implementation class PostBuyerTradeENDServlet
 */
@WebServlet("/tradeBuyerEnd.do")
public class PostBuyerTradeENDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostBuyerTradeENDServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int postNo;
		if(request.getParameter("postNo") == null) {
			postNo = 0;
		} else {
			postNo = Integer.parseInt(request.getParameter("postNo"));
		}
		String sellerId = request.getParameter("sellerId");
		String buyerId = request.getParameter("buyerId");
		int result = new TradeService().tradeBuyerEnd(postNo, sellerId);
		
		Trade t = new TradeService().tradeStateCheck(postNo);
		// Post p = new PostService().auctionDetail(postNo);
		Post p = new PostService().auctionDetail(postNo);
		// 판매자 닉네임, 신고당한횟수 가져오기

		Member m = new MemberService().selectWriterInfo(p.getWriter());
		Member seller = new MemberService().selectWriterInfo(sellerId);
		Member buyer = new MemberService().selectWriterInfo(buyerId);
		// 판매자 거래내역 가져오기
		String auctionCount = new AuctionService().selectTransactionInfo(p.getWriter());
		// 판매자 올린 게시물 갯수 가져오기
		String postCount = new PostService().selectPostNum(p.getWriter());

		if(t.getSellerState() == 'Y') {
			int tradeResult = new TradeService().tradeEnd(postNo);
			if(tradeResult > 0) {
				String tradeEnd = "Y";
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionTradeEnd.jsp");
			

				request.setAttribute("post", p);
				request.setAttribute("writer", m);
				request.setAttribute("seller", seller);
				request.setAttribute("buyer", buyer);
				request.setAttribute("postCount", postCount);
				request.setAttribute("auctionCount", auctionCount);
				request.setAttribute("tradeEnd", tradeEnd);
				view.forward(request, response);
			}
		} else {
			String tradeEnd = "N";
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			RequestDispatcher view = request.getRequestDispatcher("/views/auction/auctionTradeEnd.jsp");
		

			request.setAttribute("post", p);
			request.setAttribute("writer", m);
			request.setAttribute("seller", seller);
			request.setAttribute("buyer", buyer);
			request.setAttribute("postCount", postCount);
			request.setAttribute("auctionCount", auctionCount);
			request.setAttribute("tradeEnd", 'N');
			request.setAttribute("tradeEnd", tradeEnd);
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
