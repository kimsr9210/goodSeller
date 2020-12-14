package hotsix.goodseller.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.board.model.service.BoardService;
import hotsix.goodseller.board.model.vo.BoardPageData;

/**
 * Servlet implementation class BoardAllListPageServlet
 */
@WebServlet("/boardAllListPage.do")
public class BoardAllListPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardAllListPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;//현재 페이지 값을 가지고 있는 변수
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		System.out.println("currentPage");
		BoardPageData bpd = new BoardService().selectAllListPage(currentPage);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/board/boardMain.jsp");
		request.setAttribute("pageData", bpd);
		view.forward(request, response);
		System.out.println(bpd.getPageNavi());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
