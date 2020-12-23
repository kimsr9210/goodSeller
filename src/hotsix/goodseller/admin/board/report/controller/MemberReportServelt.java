package hotsix.goodseller.admin.board.report.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.admin.board.report.service.ReportService;
import hotsix.goodseller.admin.board.report.vo.ReportPageData;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberReportServelt
 */
@WebServlet("/memberReportAdmin.do")
public class MemberReportServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberReportServelt() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1.인코딩
		request.setCharacterEncoding("UTF-8");

		// 2.이전 페이지에서 작성한 내용 가져오기
		String reportId = request.getParameter("reportId");
		String reportReason = request.getParameter("reportReason");

		// 3.session에서 작성자 값 불러오기
		HttpSession session = request.getSession();
		Member admin = (Member) session.getAttribute("admin");
		String adminId = admin.getUserId();

		// 비즈니스 로직 처리
		int result = new ReportService().memberReportInsert(reportId,adminId,reportReason);
		new ReportService().UpdateReported(reportId);
		
		if (result > 0) {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportBoard/memberReportSuccess.jsp");
			view.forward(request, response);

		} else {

			RequestDispatcher view = request.getRequestDispatcher("/views/admin/reportBoard/memberReportFail.jsp");
			view.forward(request, response);
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
