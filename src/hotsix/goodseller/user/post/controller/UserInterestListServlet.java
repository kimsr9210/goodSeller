package hotsix.goodseller.user.post.controller;

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
import hotsix.goodseller.user.post.model.vo.InterestProduct;
import hotsix.goodseller.user.post.model.vo.Post;

/**
 * Servlet implementation class UserInterestList
 */
@WebServlet("/userInterestList.do")
public class UserInterestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInterestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		response.setCharacterEncoding("UTF-8");	// 데이터를 보낼 때 
		response.setContentType("text/html; charset=UTF-8");	//페이지를 보낼때
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		ArrayList<Post> plist = new ArrayList<Post>();
		PrintWriter out = response.getWriter();
		Post p = null;
		
		System.out.println(m);
		if(m!=null) {
			String userId = m.getUserId();
			ArrayList<InterestProduct> ipList = new PostService().InterestSelect(userId);
			for(InterestProduct ip : ipList) {
				p = new PostService().InterestSelectPostInfo(ip.getPostNo());
				plist.add(p);
			}
			RequestDispatcher view = request.getRequestDispatcher("/views/myPage/interestList.jsp");
			request.setAttribute("list", plist);
			view.forward(request, response);
		} else {
			out.print("<script>alert('세션 만료. 다시 로그인하여 주십시오'); </script>");
			out.print("<script>location.href ='/index.do';</script>");
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
