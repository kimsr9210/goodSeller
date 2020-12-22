package hotsix.goodseller.admin.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotsix.goodseller.admin.member.model.service.AdminMemberService;
import hotsix.goodseller.member.model.vo.Member;

/**
 * Servlet implementation class MemberAllListServlet
 */
@WebServlet("/memberAllList.do")
public class MemberAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberAllListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session=request.getSession();
			Member admin=(Member)session.getAttribute("admin");
			
			//비로그인자 처리
			//1. Exception 처리
			//2. m!=null 아닌 경우만 처리하도록
			if(admin!=null && 0==admin.getUserNo()||(1<=admin.getUserNo()&&admin.getUserNo()<=100)) {
				//모든 회원을 가져오는 비즈니스 로직 처리
				ArrayList<Member> list=new AdminMemberService().selectMemberAll();
				if(!(list.isEmpty())) {
					RequestDispatcher view=request.getRequestDispatcher("/views/admin/member/adminMemberList.jsp");
					request.setAttribute("list", list);
					request.setAttribute("userNo", admin.getUserNo());
					view.forward(request, response);
				}
				else {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					
					PrintWriter out=response.getWriter();
					out.println("<script>alert('회원정보 읽어오기 실패');</script>");
					out.println("<script>location.replace('/index.jsp');</script>");
				}
				
			} else {
				//관리자가 아닌 유저가 요청했을 경우
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out=response.getWriter();
				out.println("관리자가 아닌 유저가 요청");
				//response.sendRedirect("/views/common/error/error.jsp");
			}
		} catch(Exception e) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out=response.getWriter();
			out.println("Exception e");
			//response.sendRedirect("/views/common/error/error.jsp");
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
