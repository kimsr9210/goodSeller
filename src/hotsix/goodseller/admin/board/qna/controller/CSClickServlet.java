package hotsix.goodseller.admin.board.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.qna.model.service.BoardService;
import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.user.board.model.vo.Board;

/**
 * Servlet implementation class CSClickServlet
 */
@WebServlet("/adminCSBoardClick.do")
public class CSClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CSClickServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("boardNo"));

		Board board = new BoardService().CSOneClick(boardNo);
		ArrayList<BoardAnswer> answer = new BoardService().csBoardAnwser(boardNo);

		if (board != null) {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/csBoard/csBoardClick.jsp");
			request.setAttribute("board", board);
			request.setAttribute("answer", answer);
			view.forward(request, response);
		} else {
			response.sendRedirect("/views/admin/reportBoard/reportPostReadFail.jsp");

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
