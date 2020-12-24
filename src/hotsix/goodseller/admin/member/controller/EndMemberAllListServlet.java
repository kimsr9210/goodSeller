package hotsix.goodseller.admin.member.controller;

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
import hotsix.goodseller.admin.member.model.vo.MemberPageData;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class EndMemberAllListServlet
 */
@WebServlet("/endMemberAllList.do")
public class EndMemberAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EndMemberAllListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			HttpSession session = request.getSession();
			Member admin = (Member) session.getAttribute("admin");

			// 비로그인자 처리
			// 1. Exception 처리
			// 2. m!=null 아닌 경우만 처리하도록
			if (admin != null && 0 == admin.getUserNo() || (1 <= admin.getUserNo() && admin.getUserNo() <= 100)) {
				int currentPage;
				if (request.getParameter("currentPage") == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}

				// 페이지를 가져올 수 있는 비지니스 로직 처리
				MemberPageData mpd = new AdminMemberService().selectEndMemberListPage(currentPage);
				if (mpd != null) {
					RequestDispatcher view = request.getRequestDispatcher("/views/admin/member/endMemberList.jsp");
					request.setAttribute("MemberPageData", mpd);
					view.forward(request, response);
				} else {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();
					out.println("<h3>회원 정보 읽어오기 실패</h3>");
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
			out.println("<script>alert('잘못된 경로입니다.')</script>");
			response.sendRedirect("/views/admin/adminLogin.jsp");
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
