package hotsix.goodseller.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hotsix.goodseller.member.model.service.MemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwServlet
 */
@WebServlet("/memberFindPw.do")
public class MemberFindPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberFindPwServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String method = request.getParameter("method");
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userInfo = request.getParameter("userInfo");


		Member m = new MemberService().memberFindPw(method, userName, userId, userInfo);

		RequestDispatcher view = request.getRequestDispatcher("/views/member/memberFindPwResult.jsp");

		if (m != null) {
			request.setAttribute("result", true);
			request.setAttribute("name", m.getUserName());
			request.setAttribute("userId", m.getUserId());
			request.setAttribute("userInfo", userInfo);
			request.setAttribute("method", method);

			String maskedPhone = m.getPhone();
			String maskedEmail = m.getEmail();

			if (maskedPhone.length() == 11) {
				String num1 = maskedPhone.substring(0, 3);
				String num3 = maskedPhone.substring(7);

				maskedPhone = num1 + "****" + num3;
			}

			String[] splitEmail = maskedEmail.split("@");
			String maskedEid = splitEmail[0].substring(0, (splitEmail[0].length() / 2));
			for (int i = splitEmail[0].length() / 2; i < splitEmail[0].length(); i++) {
				maskedEid += "*";
			}
			maskedEmail = maskedEid + "@" + splitEmail[1];
			
			request.setAttribute("maskedPhone", maskedPhone);
			request.setAttribute("maskedEmail", maskedEmail);

		} else {
			request.setAttribute("result", false);
		}
		view.forward(request, response);
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
