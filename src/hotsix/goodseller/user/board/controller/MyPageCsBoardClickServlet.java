package hotsix.goodseller.user.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.qna.model.vo.BoardAnswer;
import hotsix.goodseller.user.board.model.service.BoardService;
import hotsix.goodseller.user.board.model.vo.Board;

/**
 * Servlet implementation class MyPageCsBoardClickServlet
 */
@WebServlet("/myPageCsBoardClick.do")
public class MyPageCsBoardClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageCsBoardClickServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이전 페이지에서 넘어온 값 저장
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		//비즈니스 로직 처리 
		Board board = new BoardService().postOneClick(boardNo);
		
		//조회수 증가 
		new BoardService().updateHit(boardNo);
				
		//답변 불러오기 
		BoardAnswer bAnswer = new BoardService().BoardAnswerInfo(boardNo);
			
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/boardPostOneClickAns.jsp");
		request.setAttribute("board", board);
		request.setAttribute("boardAnswer", bAnswer);
		view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
