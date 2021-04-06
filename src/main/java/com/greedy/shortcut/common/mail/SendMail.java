package com.greedy.shortcut.common.mail;
import java.util.Properties;

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

public class SendMail {
	
	static final String user = "ohppajio@gmail.com"; //발신자의 이메일 아이디를 입력
	static final String password = "oh571364";         //발신자 이메일의 패스워드를 입력
	
	
	public static void sendingMailPwd(String emailAdress, String id, String imgpath) {
			
		JWTtoken jwt = new JWTtoken();
		String token = jwt.createToken(id);
		String massageText = "";
		// Property에 SMTP 서버 정보를 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성한다.
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(user, password);
            }
        });
		
		
		//3.4) Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다. 3.5) Transport 클래스를 사용하여 작성한 메세지를 전달한다.
		try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            
            MimeMultipart multipart = new MimeMultipart("related");
            /* 첫번 째 파트 */
            BodyPart messageBodyPart = new MimeBodyPart();

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAdress)); 

            // Subject
            message.setSubject("비밀번호 변경 "); //메일 제목을 입력

            // Text
            massageText = "<div align=\"center\">"
                             + "<div style=\"\"><h1>즐거운 여행 매칭 서비스 요기가요!</h1>"
                             + "<br>"
                             + "<div style=\"font-size: 15px\" \"font-weight: bold \">비밀번호 변경 재설정을 위해 아래 링크를 통해 접근해주세요<br>"
                             + "<br><a href='http://127.0.0.1:8001/we/newPassword?token="+ token +"'><h3>비밀번호 재설정하기 </h3> </a>"
                             + "<br><p>우리가요 운영팀 드림</p>"
                             + "<hr>"
                             + "</div> <br>"
                             + "본 메일은 발신전용 메일이므로 회신이 되지 않습니다.</div>" 
                             +"</div>";		
            		
            messageBodyPart.setContent(massageText, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            
			/*
			 * messageBodyPart = new MimeBodyPart(); DataSource fds = new FileDataSource( );
			 * messageBodyPart.setDataHandler(new DataHandler(fds));
			 * messageBodyPart.setHeader("Content-ID", "<1qjs.png>");
			 * multipart.addBodyPart(messageBodyPart);
			 */
            
            message.setContent(multipart, "text/html; charset=UTF-8");

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
	}
	
	public static void sendingMailId(String emailAdress , String id ,String imgpath) {
		
	
		// Property에 SMTP 서버 정보를 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		//SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성한다.
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	return new PasswordAuthentication(user, password);
            }
        });
		
		
		//3.4) Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다. 3.5) Transport 클래스를 사용하여 작성한 메세지를 전달한다.
		try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAdress)); 

            MimeMultipart multipart = new MimeMultipart("related");
            /* 첫번 째 파트 */
            BodyPart messageBodyPart = new MimeBodyPart();
            
           
           
            
            // Subject
            message.setSubject("비밀번호 변경 "); //메일 제목을 입력

            // Text
          
            
            String massageText = "<div align=\"center\">"
                    + "<div style=\"\"><h1>즐거운 여행 매칭 서비스 요기가요!</h1>"
                    + "<br>"
                    + "<div style=\"font-size: 15px\" \"font-weight: bold \">회원님의 아이디를 다음과 같습니다.<br>"
                    + "<h2 style=\"color: orangered;\">'"+ id + "'</h2><br>"
                    + "<br><a href='http://127.0.0.1:8001/we'> <h3>로그인 하러 가기</h3> </a>"
                    + "<br><p>우리가요 운영팀 드림</p>"
                    + "<hr>"
                    + "</div> <br>"
                    + "본 메일은 발신전용 메일이므로 회신이 되지 않습니다.</div>" 
                    +"</div>";
            
//            String massageText = "고객님의 아이디는 " + id + "입니다."
//            			+ "로그인하기" 
//                		+ "<a href='http://127.0.0.1:8001/we'>";
//         
         
            messageBodyPart.setContent(massageText, "text/html; charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);
            
			/*
			 * messageBodyPart = new MimeBodyPart(); DataSource fds = new FileDataSource( );
			 * messageBodyPart.setDataHandler(new DataHandler(fds));
			 * messageBodyPart.setHeader("Content-ID", "<1qjs.png>");
			 * multipart.addBodyPart(messageBodyPart);
			 */
            
            message.setContent(multipart, "text/html; charset=UTF-8");

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		
	}

	
	
}


