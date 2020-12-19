package hotsix.goodseller.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.findIdpw.SmsAPI;
import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindFullIdPhoneServlet
 */
@WebServlet("/memberFindFullIdPhone.do")
public class MemberFindFullIdPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindFullIdPhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String method = request.getParameter("method");
		String userInfo = request.getParameter("userInfo");
		
		Member m = new MemberService().memberFindId(method, userName, userInfo);
		System.out.println("방법 : "+method);
		System.out.println("이름 : "+userName);
		System.out.println("찾는 정보 : "+userInfo);
		
		boolean result = new SmsAPI().sendSms(userName, m.getPhone(), m.getUserId(), "id");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(result==true) {
			out.println("<script>alert('휴대폰 번호로 아이디를 발송하였습니다.');</script>");
		}
		else {
			out.println("<script>alert('문자 발송이 실패했습니다.');</script>");
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
