package hotsix.goodseller.member.findIdpw;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.client.AuthCache;
import org.apache.http.HttpHost;
import org.apache.http.client.protocol.HttpClientContext;

public class SmsAPI {
	public static String appid = "goodSeller";
	public static String apikey = "a9946018411b11ebb6810cc47a1fcfae";
	public static String content = "";
	public static String sender = "01071658397";
	public static String receiver = "";
	
	public boolean sendSms(String userName, String phone, String userIdPw, String IdPw) {
		String hostname = "api.bluehouselab.com";
		String url = "https://" + hostname + "/smscenter/v1.0/sendsms";
		boolean result = false;
		String contentId = "[goodseller]"+userName+"님 요청하신 아이디는 ["+userIdPw+"]입니다.";
		String contentPw = "[goodseller]"+userName+"님 임시 발급된 비밀번호는 ["+userIdPw+"]입니다.";
		receiver = phone;
		
		if(IdPw.equals("id")) {
			content=contentId;
		}
		else if(IdPw.equals("pw")){
			content=contentPw;
		}

		CredentialsProvider credsProvider = new BasicCredentialsProvider();
		credsProvider.setCredentials(new AuthScope(hostname, 443, AuthScope.ANY_REALM),
				new UsernamePasswordCredentials(appid, apikey));

		// Create AuthCache instance
		AuthCache authCache = new BasicAuthCache();
		authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

		// Add AuthCache to the execution context
		HttpClientContext context = HttpClientContext.create();
		context.setCredentialsProvider(credsProvider);
		context.setAuthCache(authCache);

		DefaultHttpClient client = new DefaultHttpClient();

		try {
			HttpPost httpPost = new HttpPost(url);
			httpPost.setHeader("Content-type", "application/json; charset=utf-8");
			String json = "{\"sender\":\"" + sender + "\",\"receivers\":[\"" + receiver + "\"],\"content\":\"" + content
					+ "\"}";

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

			result = true;
		} catch (Exception e) {
			System.err.println("Error: " + e.getLocalizedMessage());
		} finally {
			client.getConnectionManager().shutdown();
		}

		return result;
	}

}
