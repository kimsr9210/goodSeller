package hotsix.goodseller.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.model.service.MemberService;

/**
 * Servlet implementation class MemberFindIdServlet
 */
@WebServlet("/memberFindId.do")
public class MemberFindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String method = request.getParameter("method");
		String userName = request.getParameter("userName");
		String userInfo = request.getParameter("userInfo");
		
		System.out.println("찾는방법 ="+method);
		System.out.println("이름="+userName);
		System.out.println("찾는정보="+userInfo);
		
		String userId = new MemberService().memberFindId(method,userName,userInfo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/memberFindIdResult.jsp");
		request.setAttribute("userId", userId);
		if(userId!=null)
		{
			request.setAttribute("result", true);
		}else {
			request.setAttribute("result", false);
		}
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
