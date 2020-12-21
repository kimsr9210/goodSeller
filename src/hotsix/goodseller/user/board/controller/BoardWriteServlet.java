package hotsix.goodseller.user.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.member.model.vo.Member;
import hotsix.goodseller.user.board.model.service.BoardService;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/boardWrite.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("UTF-8");
		
		try {

			//2.이전 페이지에서 작성한 내용 가져오기 
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			char postLockYN = request.getParameter("postLock").charAt(0);
			
			//3.session에서 작성자 값 불러오기 
			HttpSession session = request.getSession();
			Member m = (Member)session.getAttribute("member");
			String userId = m.getUserId();
			
			int result = new BoardService().writeBoard(userId, subject, content, postLockYN);
			
			if(result>0)
			{
			   	RequestDispatcher view = request.getRequestDispatcher("/views/board/boardWriteSuccess.jsp");
			   	view.forward(request, response);
			}else {
			   	RequestDispatcher view = request.getRequestDispatcher("/views/board/boardWriteFail.jsp");
			   	view.forward(request, response);
			}
			
		} catch (Exception e) {
			response.sendRedirect("/views/board/boardWriteFail.jsp");
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
