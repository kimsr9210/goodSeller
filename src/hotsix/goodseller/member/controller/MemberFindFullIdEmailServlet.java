package hotsix.goodseller.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.findIdpw.JavaMailSend;
import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindFullIdEmailServlet
 */
@WebServlet("/memberFindFullIdEmail.do")
public class MemberFindFullIdEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindFullIdEmailServlet() {
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
		
		Member m = new MemberService().memberFindId(method, userName, userInfo);
		
		boolean result = new JavaMailSend().send(userName, m.getEmail(), m.getUserId(), "id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(result==true) {
			out.println("<script>alert('이메일로 아이디를 발송하였습니다.');</script>");
		}
		else {
			out.println("<script>alert('메일 발송이 실패했습니다.');</script>");
		}
		
		out.println("<script>location.replace('/index.jsp');</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
