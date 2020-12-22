package hotsix.goodseller.user.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.user.board.model.service.BoardService;
import hotsix.goodseller.user.board.model.vo.BoardPageData;

/**
 * Servlet implementation class BoardSearchServlet
 */
@WebServlet("/postSearch.do")
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String selectBox = request.getParameter("selectBox");
		String searchText = request.getParameter("searchText");
		int currentPage;
		BoardPageData bpd=null;
		

		System.out.println(selectBox);
		
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		if(selectBox.equals("subject")) {
			bpd = new BoardService().BoardSearchSubject(currentPage, searchText);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/csBoard/boardSearchSuccess.jsp");

			request.setAttribute("pageData", bpd);
			request.setAttribute("selectBox", selectBox);
			request.setAttribute("searchText", searchText);
			view.forward(request, response);
			
		}else if (selectBox.equals("content")) {
			bpd = new BoardService().BoardSearchContent(currentPage, searchText);

			RequestDispatcher view = request.getRequestDispatcher("/views/csBoard/boardSearchSuccess.jsp");

			request.setAttribute("pageData", bpd);
			request.setAttribute("selectBox", selectBox);
			request.setAttribute("searchText", searchText);
			view.forward(request, response);
			
		}else if (selectBox.equals("writer")) {
			bpd = new BoardService().BoardSearchWriter(currentPage,searchText);	

			RequestDispatcher view = request.getRequestDispatcher("/views/csBoard/boardSearchSuccess.jsp");

			request.setAttribute("pageData", bpd);
			request.setAttribute("selectBox", selectBox);
			request.setAttribute("searchText", searchText);
			view.forward(request, response);
		}else {
			
			response.sendRedirect("/views/csBoard/boardSearchFail.jsp");
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
