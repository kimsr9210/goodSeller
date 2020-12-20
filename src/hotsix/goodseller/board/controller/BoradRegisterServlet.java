package hotsix.goodseller.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.board.model.service.BoardService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class BoradRegisterServlet
 */
@WebServlet("/boradRegister.do")
public class BoradRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoradRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    
    //신고 게시판 서블릿
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //script 출력
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		

		if(m == null) {
			out.println("<script>alert('로그인한 회원정보가 없습니다. \n 다시 로그인해주세요.');</script>");
			return;
		}
		
		try {

			//2.이전 페이지에서 작성한 내용 가져오기 
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String reguserId = request.getParameter("reguserId");
			
			//3.session에서 작성자 값 불러오기 
			String userId = m.getUserId();
			
			int result = new BoardService().InsertRegister(userId, subject, content,reguserId);
			//제목 내용 신고할사람
			
			if(result>0)
			{
			   	RequestDispatcher view = request.getRequestDispatcher("/views/board/boardRegisterSuccess.jsp");
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
