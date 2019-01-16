package beanMailer;
import java.io.*;
import java.net.*;
import java.text.*;
import java.util.*;
 
public class SMTPBean implements Serializable{
	private Socket smtp;
	private BufferedReader input;
	private PrintStream output;
	private String smtpServer = "your.smtp.server";
	private String serverReply;
	private int port = 25;
	
	public SMTPBean() {
	}
	
	
	public void sendMail(String mailfrom, String mailto, String subject, String message) throws SMTPException{
		connect();
		hail(mailfrom, mailto);
		sendMessage(mailfrom, mailto, subject, message);
		logout();
	}

	public void connect() throws SMTPException {
		try {
			smtp = new Socket(smtpServer, port);
			input = new BufferedReader(new InputStreamReader(smtp.getInputStream()));
			output = new PrintStream(smtp.getOutputStream());
			serverReply = input.readLine();
			if (serverReply.charAt(0) == '2' || serverReply.charAt(0) == '3') {
			}
			else {
				throw new SMTPException("Error connecting to SMTP server " + smtpServer + " on port " + port);
			}
		}
		catch(Exception e) {
			throw new SMTPException(e.getMessage());
		}
	}	
	
	public void hail(String mailfrom, String mailto) throws SMTPException {
		if (submitCommand("HELO " + smtpServer))
			throw new SMTPException("Error occured during HELO command.");
		if (submitCommand("MAIL FROM: " + mailfrom))
			throw new SMTPException("Error during MAIL command.");
		if (submitCommand("RCPT TO: " + mailto))
			throw new SMTPException("Error during RCPT command.");
	}	
	
	public void sendMessage(String mailfrom, String mailto, String subject, String message) throws SMTPException {

		Date ldate_today = new Date(System.currentTimeMillis());
		SimpleDateFormat lgmt_date = new SimpleDateFormat("d MMM yyyy HH:mm:ss 'GMT'");
		lgmt_date.setTimeZone(TimeZone.getTimeZone("GMT"));
		lgmt_date.format(ldate_today);

		if (submitCommand("DATA"))
			throw new SMTPException("Error during DATA command.");
		String header = "From: " + mailfrom + "\r\n";
		header += "To: " + mailto + "\r\n";
		header += "Subject: " + subject + "\r\n";
		header += "Date: " + lgmt_date + "\r\n\r\n";
		if (submitCommand(header + message + "\r\n."))
			throw new SMTPException("Error during mail transmission.");
	}
	
	
	private boolean submitCommand(String command) throws SMTPException {
		try {
			output.print(command + "\r\n");
			serverReply = input.readLine();
			if (serverReply.charAt(0) == '4' || serverReply.charAt(0) == '5')
				return true;
			else
				return false;
		}
		catch(Exception e) {
			throw new SMTPException(e.getMessage());
		}
	} 
	
	public String getServerReply() {
		return serverReply;
	}

	public int getPort(){
		return port;
	}

	public void setPort(int newPort){
		port = newPort;
	}

	public String getSmtpServer(){
		return smtpServer;
	}

	public void setSmtpServer(String newSmtpServer){
		smtpServer = newSmtpServer;
	}
	
	public void logout() throws SMTPException {
		try {
			if (submitCommand("Quit"))
				throw new SMTPException("Error during QUIT command");
			input.close();
			output.flush();
			output.close();
			smtp.close();
		}
		catch(Exception e) {
		}
	}
}