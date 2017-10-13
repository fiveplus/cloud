package com.cloud.util;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;


public class MailUtil {
	private static String charset = "utf-8";
	private String host = "";
	private String username = "";
	private String password = "";
	private String nick = "";
	public MailUtil(){
		this.host = PropertiesUtil.getValue("mail.host");
		this.username = PropertiesUtil.getValue("mail.username");
		this.password = PropertiesUtil.getValue("mail.password");
		this.nick = PropertiesUtil.getValue("mail.nick");
	}
	
	public boolean sendMail(List<String> to,String subject,String body,List<String> filepath) throws EmailException{
		return sendMail(username,password,nick,to,subject,body,filepath);
	}
	
	public boolean sendMail(String username,String password,String nickName,List<String> to,String subject,String body,List<String> filepath) throws EmailException{
		if(body == null){
			body = "";
		}
		if(subject == null){
			subject = "无主题";
		}
		HtmlEmail email = new HtmlEmail();
		email.setSSLOnConnect(true); //SSL加密
		email.setStartTLSEnabled(true); //TLS加密
		
		email.setHostName(host);
		email.setAuthentication(username, password);
		email.setFrom(username,nickName);
		if(to != null && to.size() > 0){
			for(String address:to){
				email.addTo(address);
			}
		}else{
			return false;
		}
		
		email.setCharset(charset);
		email.setSubject(subject);
		email.setHtmlMsg(body);
		if(filepath != null && filepath.size() > 0){
			for(String path:filepath){
				//创建附件
				String name = path.substring(path.lastIndexOf("/")+1);
				EmailAttachment attachment = new EmailAttachment();
				attachment.setPath(path);
				attachment.setDescription(EmailAttachment.ATTACHMENT);
				attachment.setDescription("");
				attachment.setName(name);
				email.attach(attachment);
			}
		}else{
			System.out.println("no file.");
		}
		email.send();
		return true;
	}
	
	public static void main(String[] args) throws EmailException {
		List<String> to = new ArrayList<String>();
		to.add("274925658@qq.com");
		MailUtil util = new MailUtil();
		boolean flag = util.sendMail(to, "Test Email", "<div>Test Message ：中文信息</div>", null);
		System.out.println(flag);
	}
	
}
