package hotsix.goodseller.member.findIdpw;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class JavaMailSend {
	public boolean send(String userName, String email, String userIdPw, String IdPw) {
		String user = "hot6.goodseller@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	     String password = "goodseller66";   // 패스워드
	     boolean result=false;

	     // SMTP 서버 정보를 설정한다.
	     Properties prop = new Properties();
	     prop.put("mail.smtp.host", "smtp.gmail.com"); 
	     prop.put("mail.smtp.port", 465); 
	     prop.put("mail.smtp.auth", "true"); 
	     prop.put("mail.smtp.ssl.enable", "true"); 
	     prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	     
	     Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	             return new PasswordAuthentication(user, password);
	         }
	     });

	     try {
	         MimeMessage message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(user));

	         //수신자메일주소
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress("apfjs23@naver.com")); 
	        
	         MimeMultipart multipart = new MimeMultipart("related");
	         BodyPart messageBodyPart = new MimeBodyPart();
	         if(IdPw.equals("id")) {
	        	 // Subject
		         message.setSubject("goodseller 회원님의 아이디를 알려드립니다."); //메일 제목을 입력

		         // Text
		         //message.setText("goodseller 메일 전송 테스트입니다.");    //메일 내용을 입력
		         
		         // first part  (the html)
		         
		         String htmlText = "<html><head><title></title></head><body><center>";
		         
		         htmlText += "<img src=\"cid:my-image\">";
		         htmlText += "<h1>요청하신 아이디를 알려드립니다.</h1>";
		         htmlText += "<p>안녕하세요.<b>"+userName+"</b>님</p>";
		         htmlText += "<p>요청하신 회원님의 아이디는 다음과 같습니다.</p>";
		         htmlText += "<table cellspacing='0px' cellpadding='0px' style=\"border-bottom: 1px solid gray; border-top: 1px solid gray; width: 400px; height: 50px;\">";
		         htmlText += "<br><tr><td style=\"background-color: snow; text-align: center;\">아이디</td><td><b> "+userIdPw+"</b></td></tr></table><br>";
		         htmlText += "</center></body></html>";
		         messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");

		        
	         }
	         
	         else if(IdPw.equals("pw")) {
	        	 // Subject
		         message.setSubject("goodseller 회원님의 임시 발급된 비밀번호를 알려드립니다."); //메일 제목을 입력

		         // Text
		         //message.setText("goodseller 메일 전송 테스트입니다.");    //메일 내용을 입력
		         
		         // first part  (the html)
		         
		         String htmlText = "<html><head><title></title></head><body><center>";
		         
		         htmlText += "<img src=\"cid:my-image\">";
		         htmlText += "<h1>임시 발급 비밀번호를 알려드립니다.</h1>";
		         htmlText += "<p>안녕하세요.<b>"+userName+"</b>님</p>";
		         htmlText += "<p>회원님의 임시 발급 비밀번호는 다음과 같습니다.</p>";
		         htmlText += "<table cellspacing='0px' cellpadding='0px' style=\"border-bottom: 1px solid gray; border-top: 1px solid gray; width: 400px; height: 50px;\">";
		         htmlText += "<br><tr><td style=\"background-color: snow; text-align: center;\">비밀번호</td><td><b> "+userIdPw+"</b></td></tr></table><br>";
		         htmlText += "로그인 후 비밀번호 변경 바랍니다.";
		         htmlText += "</center></body></html>";
		         messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");

	         }
	         // add it
	         multipart.addBodyPart(messageBodyPart);
	         // second part (the image)
	         messageBodyPart = new MimeBodyPart();
	         DataSource fds = new FileDataSource("D:\\Project_Action\\Action\\WebContent\\resources\\images\\logo.png");
	         messageBodyPart.setDataHandler(new DataHandler(fds));
	         messageBodyPart.setHeader("Content-ID","<my-image>");

	         // add it
	         multipart.addBodyPart(messageBodyPart );
	         
	         message.setContent(multipart);
	         // send the message
	         Transport.send(message); ////전송
	         result = true;
	     } catch (AddressException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	     } catch (MessagingException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	     }
	     
	     return result;
	}

}
