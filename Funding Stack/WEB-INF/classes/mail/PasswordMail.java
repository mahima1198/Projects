package mail;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
	public class PasswordMail {
		public PasswordMail() {
		}
public boolean sendMail(String to,String otp) throws MessagingException
{
			String host="smtp.gmail.com";
String username="fundingstack@gmail.com";//emailid
			String password="fundingstack@123";//emailid password
String from="fundingstack@gmail.com";// email from which u have to send
			String subject="One Time Password";
String body="Your One Time passsword is"+otp;
	boolean sessionDebug=false;
	Properties props=System.getProperties();
	props.put("mail.host",host);
	props.put("mail.transport.protocol","smtp");
	props.put("mail.smtp.starttls.enable","true");
	props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "25"); 
Session mailSession=Session.getDefaultInstance(props,null);
mailSession.setDebug(sessionDebug);
Message msg=new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress [] address={new InternetAddress(to)};
msg.setRecipients(Message.RecipientType.TO,address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(body);
Transport tr=mailSession.getTransport("smtp");
tr.connect(host,username,password);
msg.saveChanges();
tr.sendMessage(msg,msg.getAllRecipients());
tr.close();
			//Transport.send(msg);
			return true;
		}
	}
				