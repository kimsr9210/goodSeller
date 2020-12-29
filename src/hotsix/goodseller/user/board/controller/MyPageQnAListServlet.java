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
import hotsix.goodseller.user.board.model.vo.BoardPageData;

/**
 * Servlet implementation class MyPageQnAListServlet
 */
@WebServlet("/qnaList.do")
public class MyPageQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQnAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		int currentPage;
		BoardPageData bpd=null;
		
		if(m == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('세션만료 다시 로그인하여 주십시오.')");
			out.println("location.href ='/index.do';");
			out.println("</script>");
		}
		String userId = m.getUserId();
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		bpd = new BoardService().MyPageQnAList(currentPage, userId);
		
		//ArrayList<Board> list = new BoardService().MyPageQnAList(userId);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/myPage/qnaList.jsp");
		request.setAttribute("pageData", bpd);
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
