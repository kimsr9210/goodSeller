package hotsix.goodseller.admin.board.report.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.report.service.ReportService;
import hotsix.goodseller.admin.board.report.vo.ReportPost;
import hotsix.goodseller.user.board.model.vo.Register;

/**
 * Servlet implementation class BoardRegisterOneClickServlet
 */
@WebServlet("/boardRegisterAdminOneClick.do")
//여기 맵핑 이름하고 다른것도 ㄱ벼쳐서 그래요
public class ReportPostClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportPostClickServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 이전 페이지에서 넘어온 값 저장
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		// 비즈니스 로직 처리
		Register register = new ReportService().RegisterOneClick(boardNo);

		// 신고게시판 댓글
		ArrayList<ReportPost> list = new ReportService().selectCommentBoard(boardNo);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/register/boardRegisterOneClick.jsp");
		request.setAttribute("register", register);
		request.setAttribute("commentList", list);
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
