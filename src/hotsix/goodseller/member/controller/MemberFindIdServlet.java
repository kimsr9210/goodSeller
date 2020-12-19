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
		
		Member m = new MemberService().memberFindId(method,userName,userInfo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/member/memberFindIdResult.jsp");
		
		if(m!=null) {
			request.setAttribute("result", true);
			request.setAttribute("method", method);
			request.setAttribute("name", m.getUserName());
			request.setAttribute("userInfo", userInfo);
			
			String maskedPhone = m.getPhone();
			String maskedEmail = m.getEmail();
			
			if(maskedPhone.length() == 11){
	            String num1 = maskedPhone.substring(0, 3);
	            String num3 = maskedPhone.substring(7);
	            
	            maskedPhone = num1 + "****" + num3;
			}
			
			String[] splitEmail = maskedEmail.split("@");
			String maskedEid = splitEmail[0].substring(0,(splitEmail[0].length()/2));
			for(int i=splitEmail[0].length()/2; i<splitEmail[0].length(); i++){
				maskedEid += "*";
			}
			maskedEmail = maskedEid + "@" +splitEmail[1];
			
			String maskedUserId = m.getUserId().substring(0,(m.getUserId().length()/2));
			for(int i=m.getUserId().length()/2; i<m.getUserId().length(); i++){
				maskedUserId += "*";
			}
			
			request.setAttribute("maskedUserId", maskedUserId);
			request.setAttribute("maskedPhone", maskedPhone);
			request.setAttribute("maskedEmail", maskedEmail);
			
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
