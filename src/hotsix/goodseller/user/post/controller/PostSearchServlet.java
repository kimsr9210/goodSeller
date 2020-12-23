package hotsix.goodseller.user.post.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.user.post.model.service.PostService;
import hotsix.goodseller.user.post.model.vo.Post;
import hotsix.goodseller.user.post.model.vo.PostPageData;

/**
 * Servlet implementation class PostSearchServlet
 */
@WebServlet("/postingSearch.do")
public class PostSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 인코딩 (보낸 키워드에 한글이 포함되어 있을 수 있기 때문에)
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		
		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		// 페이지를 가져올 수 있는 비지니스 로직 처리
		PostPageData ppd = new PostService().selectSearchPost(currentPage, keyword);

		// 날짜 D-DAY 계산
		ArrayList<Post> list = ppd.getList();
		for (Post p : list) {

			System.out.println(p.getEndDate());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			Calendar d_day = Calendar.getInstance();

			int year = day.get(Calendar.YEAR);
			int month = day.get(Calendar.MONTH) + 1;
			int date = day.get(Calendar.DATE) - 1;

			day.set(year, month, date);

			// 오늘날짜 시간으로계산
			// System.out.println(day.getTimeInMillis());

			// endDate 가져오기
			String[] arr = sdf.format(p.getEndDate()).split("-");
			int d_year = Integer.parseInt(arr[0]);
			int d_month = Integer.parseInt(arr[1]);
			int d_date = Integer.parseInt(arr[2]);

			d_day.set(d_year, d_month, d_date);

			// d_day날짜 시간으로 계산
			// System.out.println(d_day.getTimeInMillis());

			long diff = d_day.getTimeInMillis() - day.getTimeInMillis();
			long d_diff = diff / (24 * 60 * 60 * 1000);
			if (diff <= 0 && p.getSell_yn() == 'N') {
				new PostService().updatePostSellyn(p.getPostNo());
				System.out.println("상품번호 [" + p.getPostNo() + "]는 종료날짜가 되어 거래 완료처리되었습니다.");
			}
			;

		}

		RequestDispatcher view = request.getRequestDispatcher("/views/auction/PostSearchPage.jsp");
		request.setAttribute("PostPageData", ppd);
		request.setAttribute("keyword", keyword);
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
