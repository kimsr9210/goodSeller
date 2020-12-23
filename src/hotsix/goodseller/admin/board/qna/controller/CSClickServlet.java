package hotsix.goodseller.admin.board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.qna.model.service.BoardService;
import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.admin.board.report.service.ReportService;
import hotsix.goodseller.admin.board.report.vo.ReportAnswer;
import hotsix.goodseller.user.board.model.vo.Board;
import hotsix.goodseller.user.board.model.vo.Report;

/**
 * Servlet implementation class CSClickServlet
 */
@WebServlet("/answerCsBoardClick.do")
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
		//답변이 완료된 게시글을 클릭했을때 

		try {

			//이전 페이지에서 넘어온 값 저장
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			//System.out.println("게시글번호"+reportNo);
			
			//비즈니스 로직 처리 
			Board board = new BoardService().CSOneClick(boardNo);
			
			//답변이 완료 된 경우 그 객체도 가져와주기 
			BoardAnswer bAnswer = new BoardService().BoardAnswerInfo(boardNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/csBoard/csBoardClick.jsp");
			request.setAttribute("board", board);
			
			request.setAttribute("boardAnswer", bAnswer);
			
			view.forward(request, response);

			
		} catch (Exception e) {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/adminSessionFail.jsp");
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
