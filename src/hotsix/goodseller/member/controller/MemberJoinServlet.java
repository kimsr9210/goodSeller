package hotsix.goodseller.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberJoin.do")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		Member m = new Member();
		m.setUserId(request.getParameter("userId"));
		m.setUserPw(request.getParameter("userPw"));
		m.setUserNick(request.getParameter("userNick"));
		m.setUserName(request.getParameter("userName"));
		m.setGender(request.getParameter("gender").charAt(0));
		
		String birth = request.getParameter("birthYear")+"/"+request.getParameter("birthMonth")+"/"+request.getParameter("birthDay");
		m.setBirth(birth);
		
		m.setPhone(request.getParameter("phone"));
		
		String addr1 = request.getParameter("addr");
		String addr2 = request.getParameter("detailAddr");
		String addr = addr1 + " " + addr2;
		m.setAddress(addr);
		m.setEmail(request.getParameter("email"));
		m.setAccount(request.getParameter("account"));
		
		int result = new MemberService().memberJoin(m);
		
		if(result > 0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('회원가입 성공');</script>");
			out.println("<script>location.replace('/views/member/memberLogin.jsp');</script>");
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('회원가입 실패 관리자에게 문의하세요');</script>");
			out.println("<script>location.replace('/index.jsp');</script>");
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
