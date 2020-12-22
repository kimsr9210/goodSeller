package hotsix.goodseller.admin.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.service.RegisterService;
import hotsix.goodseller.user.board.model.vo.Register;

/**
 * Servlet implementation class BoardRegisterOneClickServlet
 */
@WebServlet("/boardRegisterOneClick.do")
public class BoardRegisterOneClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardRegisterOneClickServlet() {
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
				Register register = new RegisterService().RegisterOneClick(boardNo);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/board/boardRegisterOneClick.jsp");
				request.setAttribute("register", register);
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
