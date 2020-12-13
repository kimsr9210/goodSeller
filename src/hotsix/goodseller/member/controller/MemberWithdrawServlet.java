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
 * Servlet implementation class MemberWithdrawServlet
 */
@WebServlet("/memberWithdraw.do")
public class MemberWithdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberWithdrawServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String userPw = request.getParameter("userPw");
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("characterEncoding :::::::: "+response.getCharacterEncoding());
		System.out.println("contentType :::::::: "+response.getContentType());
		
		if(m == null) {
			out.println("<script>alert('로그인한 회원정보가 없습니다. \n 다시 로그인해주세요.');</script>");
			return;
		}
		
		if(userPw.equals(m.getUserPw())) 
		{
			//사용자가 입력한 값과 실제 session에 저장된 값이 일치한다면! (맞다면)
			//userId값을 추출해서 탈퇴하는 비즈니스 로직 처리
			String userId = m.getUserId();
			
			int result = new MemberService().deleteMember(userId);			
			if(result>0)
			{
				
				System.out.println("characterEncoding :::::::: "+response.getCharacterEncoding());
				System.out.println("contentType :::::::: "+response.getContentType());
				
				session.invalidate(); //탈퇴가 되었다면 세션을 파기해라
				out.println("<script>alert('회원 탈퇴가 완료 되었습니다.');</script>");
				out.println("<script>location.replace('/index.jsp');</script>");
				//response.sendRedirect("/index.jsp");
				
			}else {
				out.println("<script>alert('회원 탈퇴가 이루어 지지 않았습니다. 재시도 바랍니다.');</script>");
				out.println("<script>location.replace('/index.jsp');</script>");
			}
		}else {
			//사용자가 입력한 값과 실제 session에 저장된 값이 다르다면! (비밀번호가 틀렸다면!)
			out.println("<script>alert('비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요');</script>");
			out.println("<script>location.replace('/index.jsp');</script>");
			
		}
		
	
		
		
		
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
