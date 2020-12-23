package hotsix.goodseller.admin.post.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.admin.post.model.service.AdminPostService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class AdminDeleteStateChangeServlet
 */
@WebServlet("/adminDellStateChange.do")
public class AdminDeleteStateChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteStateChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		char del_yn = request.getParameter("del_yn").charAt(0);
		
		HttpSession session = request.getSession();
		Member admin = (Member)session.getAttribute("admin");
		
		
		if (admin != null && 0 == admin.getUserNo() || (1 <= admin.getUserNo() && admin.getUserNo() <= 100)) {
			int result = new AdminPostService().updateDelStatePost(postNo, del_yn);
			PrintWriter out = response.getWriter();
			
			if(result>0) {
				RequestDispatcher view = request.getRequestDispatcher("/adminPostAllList.do");
				view.forward(request, response);
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/adminPostAllList.do");
				view.forward(request, response);
			}
			
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/adminLogin.jsp");
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
