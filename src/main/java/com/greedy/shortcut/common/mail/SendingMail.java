package com.greedy.shortcut.common.mail;

import org.apache.commons.mail.HtmlEmail;

public class SendingMail {
	private String email;
	private String confirmkey;
	private String message; 
	
	public SendingMail(String email, String confirmkey, String message) {
		this.email = email;
		this.confirmkey = confirmkey;
		this.message = message;
		
		email("rab_boy", "a1s2d3!@#");
		
	}
	
	public void email(String hostemail, String hostPwd) {
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = hostemail;
		String hostSMTPpwd = hostPwd;
		
		String fromEmail = email;
		System.out.println("fromEmail " + fromEmail);
		String fromName = "short cut";
		String subject = "";
		message = "";
		subject = "Spring Homepage 회원가입 인증 메일입니다.";
		message += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		message += "<h3 style='color: blue;'>";
		message += email + "님 회원가입을 환영합니다.</h3>";
		message += "<div style='font-size: 130%'>";
		message += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		message += "<form method='post' action='http://localhost:8081/homepage/member/approval_member.do'>";
		message += "<input type='hidden' name='email' value='" + email + "'>";
		message += "<input type='hidden' name='approval_key' value='" + confirmkey+ "'>";
		message += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = email;
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(message);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
}
