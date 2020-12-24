package hotsix.goodseller.user.post.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.auction.model.service.AuctionService;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Auction;
import hotsix.goodseller.user.post.model.vo.Post;

/**
 * Servlet implementation class MyPageBidListServlet
 */
@WebServlet("/bidList.do")
public class MyPageBidListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageBidListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		int prevPostNo = -1;
		ArrayList<Auction> list = new AuctionService().selectMyBidInfo(m.getUserId());
		ArrayList<Post> pList = null;
		if(!list.isEmpty()) {
			pList =  new ArrayList<Post>();
			for(Auction a : list) {
				if(prevPostNo != a.getPostNo()) {
					pList.add(new PostService().auctionDetail(a.getPostNo()));
					prevPostNo = a.getPostNo();
				} else {
					continue;
				}
			}
		}
		
		System.out.println(list);
		System.out.println(pList);
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/bidList.jsp");
		request.setAttribute("auctionList", list);
		request.setAttribute("postList", pList);

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
