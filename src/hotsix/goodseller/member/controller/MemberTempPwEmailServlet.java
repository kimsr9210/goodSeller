package hotsix.goodseller.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.findIdpw.JavaMailSend;
import hotsix.goodseller.member.findIdpw.TempPw;
import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberTemporaryPwPhoneServlet
 */
@WebServlet("/memberTempPwEmail.do")
public class MemberTempPwEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberTempPwEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userInfo = request.getParameter("userInfo");
		String method = request.getParameter("method");
		
		String userNewPw = new TempPw().getTempPw(10);
		
		int result = new MemberService().memberTempPw(method,userName,userId,userInfo,userNewPw);
		Member m = new MemberService().memberFindPw(method, userName, userId, userInfo);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
		
		if(result>0) {
			boolean resultEmail = new JavaMailSend().send(userName, m.getEmail(), m.getUserPw(), "pw");
			
			if(resultEmail==true) {
				out.println("<script>alert('이메일로 임시 비밀번호를 발송하였습니다.');</script>");
			}
			else {
				out.println("<script>alert('메일 발송이 실패했습니다.');</script>");
			}
		}
		else {
			out.println("<script>alert('임시 비밀번호 발급에 실패했습니다.\n다시 시도 해주세요.');</script>");
		}
		out.println("<script>location.replace('/index.do');</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
