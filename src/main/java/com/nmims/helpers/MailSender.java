package com.nmims.helpers;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service("MailSender")
@Component
public class MailSender {

	private String host;
	private String port;
	private String username;
	private String password;
	private String from;
	
	@Autowired
	ApplicationContext act;
	
	@Autowired
	private EmailHelper emailHelper;
	
	@Value( "${SERVER_PATH}" )
	private String SERVER_PATH;
	
	@Value( "${ENVIRONMENT}" )
	private String ENVIRONMENT;

	private final String USER_AGENT = "Mozilla/5.0";

	public void setHost(String host) {
		this.host = host;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setFrom(String from) {
		this.from = from;
	}

	
	@Async
	public void sendEmail(String subject,String emailBody,ArrayList<String> recipient,String recipientName ) {
		
		if(!"PROD".equalsIgnoreCase(ENVIRONMENT)){
//			System.out.println("Not sending comment email since this is not Prod.");
			return;
		}
//		System.out.println("inside mail sender...");
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		
		javax.mail.Address address = null;
		String emailsNotSentId = "";
		int successCount = recipient.size();
		int errorCount = 0;
//		System.out.println("Number of emails to send = "+successCount);

			
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from, "NMIMS Global Access SCE"));
			for (int i = 0; i < successCount; i++) 
			{ 
				try {
					address = new javax.mail.internet.InternetAddress(recipient.get(i)); 
					message.addRecipient(Message.RecipientType.TO, address); 
				}catch (Exception e) {
					errorCount++;
//					System.out.println(" Mail NOT sent  Error = "+e.getMessage());
					emailsNotSentId = emailsNotSentId +"," + recipient.get(i);
				}
			}
			
			message.addRecipients(Message.RecipientType.BCC, 
                    InternetAddress.parse("jforce.solution@gmail.com"));
			
			String body = "";
			
			message.setSubject(subject); 

				body = "Dear "+recipientName+",  "
						+ emailBody
						+"<br><br>"
						+"Thanks & Regards"
						+"<br>"
						+"NMIMS GLOBAL ACCESS SCHOOL FOR CONTINUING EDUCATION";

				
			message.setContent(body, "text/html; charset=utf-8");

			Transport.send(message);

			// sending  EmailId to which email is not send
			if(!"".equals(emailsNotSentId)){
//				System.out.println("Sending Error emails");
				 
				Message messages = new javax.mail.internet.MimeMessage(session); 
				try {
					messages.setFrom(new InternetAddress(from, "NMIMS Global Access SCE"));
				} catch (UnsupportedEncodingException e) {
				}

				//messages.addRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse("erinprabhu@gmail.com"));
				messages.setSubject("Emails Errors for "+subject); 
				messages.setText(emailsNotSentId); 
				Transport.send(messages);
			}
			
//			System.out.println("Sent Error Email");

		} catch(Exception e) {
			e.printStackTrace();
		}

//		System.out.println("Mail sent successfully");

	}
	

	
}
