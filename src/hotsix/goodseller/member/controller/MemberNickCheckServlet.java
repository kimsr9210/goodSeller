package hotsix.goodseller.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hotsix.goodseller.member.model.service.MemberService;

/**
 * Servlet implementation class MemberNickCheckServlet
 */
@WebServlet("/nickCheck.do")
public class MemberNickCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberNickCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		String userNickCheck = request.getParameter("userNickCheck");
		String userNick = new MemberService().nickCheck(userNickCheck);
		
		JSONObject object = new JSONObject();
		if(userNick == null)
		{
			object.put("result", "true");
		}else {
			object.put("result", "false");
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(object);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
