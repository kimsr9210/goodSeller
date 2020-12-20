package hotsix.goodseller.member.authentication;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;

import hotsix.goodseller.member.model.service.MemberService;
/**
 * Servlet implementation class SendSMSServlet
 */
@WebServlet("/sendSms.do")
public class SendSMSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendSMSServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		String receiver = request.getParameter("receiver");
		
		int rand = (int) (Math.random() * 899999) + 100000;
		
		// 문자 보내기
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";

		CredentialsProvider credsProvider = new BasicCredentialsProvider();

		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				new UsernamePasswordCredentials(Config.appId, Config.apiKey));
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");

			// 문자 정보
			String json = "{\"sender\":\"" + Config.sender + "\",\"receivers\":[\"" + receiver + "\"],\"content\":\""
					+ Config.content + rand + "\"}";
			StringEntity se = new StringEntity(json, "UTF-8");
			httpPost.setEntity(se);

			HttpResponse httpResponse = client.execute(httpPost, context);
			System.out.println(httpResponse.getStatusLine().getStatusCode());

			InputStream inputStream = httpResponse.getEntity().getContent();
			if (inputStream != null) {
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				String line = "";
				while ((line = bufferedReader.readLine()) != null)
					System.out.println(line);
				inputStream.close();
			}
			
			new AuthService().insertAuthNum(rand);
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client.getConnectionManager().shutdown();
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