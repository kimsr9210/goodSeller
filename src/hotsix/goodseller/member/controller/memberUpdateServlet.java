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
 * Servlet implementation class memberUpdateServlet
 */
@WebServlet("/memberUpdate.do")
public class memberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");

		String currentPw = request.getParameter("currentPw"); //1
		String userPw = request.getParameter("chPw"); //1
		String userNick = request.getParameter("chNick"); //3
		String email = request.getParameter("chEmail"); //6
		String phone = request.getParameter("chPhone"); //7

		String addr1 = request.getParameter("addr");
		String addr2 = request.getParameter("detailAddr");
		String address = addr1 + " " + addr2;
		
		String account = request.getParameter("chAccount");
		
		if(userPw != null) {
			if(currentPw.equals(m.getUserPw())) {
				m.setUserPw(userPw);
			} else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>alert('현재 비밀번호가 옳바르지 않습니다. 확인 후 다시 시도해주세요.');</script>");
				out.println("<script>location.replace('/views/member/memberInfo.jsp');</script>");
				
			}
		}
		if (userNick != null) {
			String userNickCheck = new MemberService().nickCheck(userNick);
			if(userNickCheck != null) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>alert('중복된 닉네임입니다.');</script>");
				out.println("<script>location.replace('/views/member/memberInfo.jsp');</script>");
				
			}
			m.setUserNick(userNick);
		}
		if (phone != null) {
			m.setPhone(phone);
		}
		if (addr1 != null && addr2 != null) {
			m.setAddress(address);
		} 
		if (account != null) {
			m.setAccount(account);
		}
		if (email != null) {
			m.setEmail(email);
		} 
		int result = new MemberService().memberUpdate(m);
		
		if(result>0)
		{
			response.sendRedirect("/views/member/memberInfo.jsp");
		} else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('회원수정 실패했습니다. 재시도 바랍니다.');</script>");
			out.println("<script>location.replace('/views/member/memberInfo.jsp');</script>");
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
