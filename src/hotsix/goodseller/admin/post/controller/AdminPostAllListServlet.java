package hotsix.goodseller.admin.post.controller;

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

import hotsix.goodseller.admin.member.model.service.AdminMemberService;
import hotsix.goodseller.admin.post.model.service.AdminPostService;
import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

/**
 * Servlet implementation class AdminPostAllList
 */
@WebServlet("/adminPostAllList.do")
public class AdminPostAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPostAllListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			HttpSession session = request.getSession();
			Member admin = (Member)session.getAttribute("admin");

			// 비로그인자 처리
			// 1. Exception 처리
			// 2. m!=null 아닌 경우만 처리하도록
			if (admin != null && 0 == admin.getUserNo() || (1 <= admin.getUserNo() && admin.getUserNo() <= 100)) {
				int currentPage;
				if(request.getParameter("currentPage")==null) {
					currentPage = 1;
				}else {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				
				//페이지를 가져올 수 있는 비지니스 로직 처리
				PostPageData ppd = new AdminPostService().selectPostAllPage(currentPage);
				if (ppd!=null) {
					RequestDispatcher view = request.getRequestDispatcher("/views/admin/post/adminPostAllList.jsp");
					request.setAttribute("PostPageData", ppd);
					view.forward(request, response);
				} else {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<h3>게시물 정보 읽어오기 실패</h3>");
				}

			} else {
				// 관리자가 아닌 유저가 요청했을 경우
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();
				out.println("관리자가 아닌 유저가 요청");
				// response.sendRedirect("/views/common/error/error.jsp");
			}
		} catch (Exception e) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			out.println("Exception e");
			// response.sendRedirect("/views/common/error/error.jsp");
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
