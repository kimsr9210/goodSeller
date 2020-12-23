package hotsix.goodseller.admin.board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class CsNotAnswerClickServlet
 */
@WebServlet("/notAnswerCsBoardClick.do")
public class CsNotAnswerClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsNotAnswerClickServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			//이전 페이지에서 넘어온 값 저장
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));

			//System.out.println("게시글번호"+reportNo);
			
			//비즈니스 로직 처리 
			Board board = new BoardService().CSOneClick(boardNo);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/csBoard/csBoardClickNotAnswer.jsp");
			request.setAttribute("board", board);
			
			view.forward(request, response);

			
		} catch (Exception e) {
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/adminSessionFail.jsp");
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
