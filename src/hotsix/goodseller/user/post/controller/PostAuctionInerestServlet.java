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
 * Servlet implementation class MyPageInerestServlet
 */
@WebServlet("/interest.do")
public class PostAuctionInerestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostAuctionInerestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("UTF-8");
		
		try {
			// 이전 페이지에서 보내준 값 가져오기
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String userId = request.getParameter("userId");
		
		int result = new PostService().InterestUpdate(postNo, userId);
		
		if(result>0)
		{
		   	RequestDispatcher view = request.getRequestDispatcher("/views/auction/interestSuccess.jsp");
		   	view.forward(request, response);
		}else {
		   	RequestDispatcher view = request.getRequestDispatcher("/views/auction/interestFail.jsp");
		   	view.forward(request, response);
		}
		
	} catch (Exception e) {
		response.sendRedirect("/views/auction/interestFail.jsp");
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
