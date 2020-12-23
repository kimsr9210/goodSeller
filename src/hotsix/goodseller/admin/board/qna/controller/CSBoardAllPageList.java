package hotsix.goodseller.admin.board.qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.board.qna.model.service.BoardService;
import hotsix.goodseller.admin.board.qna.model.vo.BoardPageData;

/**
 * Servlet implementation class CSBoardAllPageList
 */
@WebServlet("/admincsBoardAllPageList.do")
public class CSBoardAllPageList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CSBoardAllPageList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //Q&A 관리자 게시판 리스트
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;// 현재 페이지 값을 가지고 있는 변수

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// 비즈니스 로직 처리
		BoardPageData cs = new BoardService().csBoardAllListPage(currentPage);
		//System.out.println("객체"+cs);
		//System.out.println("csboard"+cs.getList().get(0).getSubject());
		//이거 나오는거보면 cs는 잘 불러와지고있는거같아요 
		//jsp쪽을 다시봅시다 
		
		// 결과 처리
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/csBoard/CSBoardMain.jsp");
		request.setAttribute("BoardPageData", cs);
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
