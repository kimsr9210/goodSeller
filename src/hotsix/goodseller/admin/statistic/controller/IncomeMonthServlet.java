package hotsix.goodseller.admin.statistic.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.admin.statistic.model.service.StatisticService;

/**
 * Servlet implementation class IncomeMonthServlet
 */
@WebServlet("/incomeMonth.do")
public class IncomeMonthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeMonthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList list2020 = new StatisticService().incomeMonthSelect();
		
		//for(int i=0; i<list2020.size();i++) {
			//System.out.println(i+"번째 리스트"+list2020.get(i));
		//}
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/statistic/incomeStatistic.jsp");
		request.setAttribute("list", list2020);
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
