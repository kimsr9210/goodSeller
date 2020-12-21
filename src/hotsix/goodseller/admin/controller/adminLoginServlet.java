package hotsix.goodseller.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class adminLoginServlet
 */
@WebServlet("/adminLogin.do")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String userId=request.getParameter("userId");
		String userPw=request.getParameter("userPw");
		
		Member m=new MemberService().memberLogin(userId, userPw);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		if(m==null) {
			out.println("<script>alert('ID 또는 PW를 확인해주세요');</script>");
		}
		else {
			if(!m.getUserId().equals("user")) {
				out.println("<script>alert('관리자 아이디로 로그인해주세요');</script>");
			}
			else {
				HttpSession session=request.getSession();
				session.setAttribute("admin", m);
				response.sendRedirect("/views/admin/adminIndex.jsp");
			}
		}
		
		out.println("<script>location.replace('/views/admin/adminLogin.jsp');</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
