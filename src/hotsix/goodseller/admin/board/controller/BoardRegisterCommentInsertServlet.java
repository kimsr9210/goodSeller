package hotsix.goodseller.admin.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.admin.board.service.RegisterService;
import hotsix.goodseller.user.board.model.vo.Register;

/**
 * Servlet implementation class BoardRegisterCommentWriteServlet
 */
@WebServlet("/registerCommentWrite.do")
public class BoardRegisterCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardRegisterCommentInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	//신고게시판 댓글쓰는 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 인코딩
		request.setCharacterEncoding("utf-8");

		// 2. 이전페이지에서 보내준 데이터를 가져와야 ㅇ한다
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String comment = request.getParameter("comment");
		
		
		// 3. 작성자값 (userId)을 가져오기 위해서 session에서 꺼내옴
		HttpSession session = request.getSession();
		Register r = (Register) session.getAttribute("register");
		
		String userId = r.getUserId();
		
		//데이터가 잘 넘어오는지 확인
		System.out.println("게시글번호 : " + boardNo);
		System.out.println("댓글:" + comment);
		
		//비지니스 로직
		int result = new RegisterService().insertBoardComment(boardNo,comment,userId);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/boardRegisterOneClick.jsp");
		if (result > 0) {

			// 데이터 입력에 성공했다면?
			// 성공값(true) + boardNo를 보내주도록 하겠습니다.
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("result", true);

		} else {
			// 데이터 입력에 실패했다면?
			// 실패값 (false)+boardNo를 보내주도록 함
			request.setAttribute("boardNo", boardNo);
			request.setAttribute("result", false);

		}
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
