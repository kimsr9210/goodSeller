package hotsix.goodseller.member.controller;

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
 * Servlet implementation class MemberChangeServlet
 */
@WebServlet("/memberChange.do")
public class MemberChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("member")).getUserId();

		String userPw = request.getParameter("userPw"); //1
		String userName = request.getParameter("userName"); //2
		String userNick = request.getParameter("userNick"); //3
		String Birth = request.getParameter("birth"); //4
		char gender = request.getParameter("gender").charAt(0); //5
		String email = request.getParameter("email"); //6
		String phone = request.getParameter("phone"); //7
		String address = request.getParameter("address"); //8
		String account = request.getParameter("account"); //9
		


		Member m = new Member();
		
		m.setUserId(userId);  //1
		m.setUserPw(userPw);  //2
		m.setUserName(userName); //3
		m.setUserNick(userNick); //4
		m.setBirth(Birth); //5
		m.setGender(gender); //6
		m.setEmail(email); //7
		m.setPhone(phone); //8
		m.setAddress(address); //9
		m.setAccount(account); //10
		
		int result = new MemberService().changeMember(m);
		
		if(result>0)
		{
			//response.sendRedirect("");
		}else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			//out.println("<script>alert('회원수정 실패했습니다. 재시도 바랍니다.');</script>");
			//out.println("<script>location.replace('');</script>");
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
