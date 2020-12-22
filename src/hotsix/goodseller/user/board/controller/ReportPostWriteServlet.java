package hotsix.goodseller.user.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class BoradRegisterServlet
 */
@WebServlet("/reportWrite.do")
public class ReportPostWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportPostWriteServlet() {
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
		

			try {

				//2.이전 페이지에서 작성한 내용 가져오기 
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				String reportId = request.getParameter("reportId");
				
				//3.session에서 작성자 값 불러오기 
				String userId = m.getUserId();
				
				int result = new BoardService().ReportInsert(userId, subject, content, reportId);
				//제목 내용 신고할사람
				
				if(result>0)
				{
				   	RequestDispatcher view = request.getRequestDispatcher("/views/reportBoard/reportWriteSuccess.jsp");
				   	view.forward(request, response);
				}else {
				   	RequestDispatcher view = request.getRequestDispatcher("/views/csBoard/boardWriteFail.jsp");
				   	view.forward(request, response);
				}
				
			} catch (Exception e) {
				response.sendRedirect("/views/csBoard/boardWriteFail.jsp");
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
