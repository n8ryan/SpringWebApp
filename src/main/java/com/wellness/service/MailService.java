package com.wellness.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	private JavaMailSender mailSender;
	
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public synchronized void sendEMail(String emailId, String subject, String msg){
        MimeMessage message =  this.mailSender.createMimeMessage();
        MimeMessageHelper mimeHelper;
        try {
               mimeHelper = new MimeMessageHelper(message,true);
               mimeHelper.setTo(emailId);    
               mimeHelper.setFrom("@gmail.com");
               mimeHelper.setSubject(subject);
               mimeHelper.setText(msg,true);
               mailSender.send(message);
        } catch (MessagingException e) {
               System.out.println("Error Sending email "+ e.getMessage());
        }
        notifyAll();  
	}

	public synchronized void sendpasswordemail(String emailId){
		MimeMessage message =  this.mailSender.createMimeMessage();
		MimeMessageHelper mimeHelper;
		try {
			mimeHelper = new MimeMessageHelper(message,true);
			mimeHelper.setTo(emailId);
			
			
			mimeHelper.setFrom("@gmail.com");
			mimeHelper.setSubject("Password Reset");
			mimeHelper.setText("<html><body>hi,<br/><a href='http://192.168.2.11:8080/spring-web-App/resetpassword'> Click here</a> to reset password</body></html>",true);
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("Error Sending email "+ e.getMessage());
		}
		notify();  
	}
}
