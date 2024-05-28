package mvc;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;

	public int generateOTP(HttpSession session) {
		Random rand = new Random();
		int min = 100000; // Minimum six-digit number
		int max = 999999; // Maximum six-digit number
		int otp = rand.nextInt(max - min + 1) + min;
		session.setAttribute("otp", otp);
		return otp;
	}

	public void sendEmail(String to, int otp) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("your-email@gmail.com");
		message.setTo(to);
		message.setSubject("OTP Verification");
		message.setText("Your OTP is: " + otp);
		mailSender.send(message);
	}
}