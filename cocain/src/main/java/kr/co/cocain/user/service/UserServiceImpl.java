package kr.co.cocain.user.service;

import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.repository.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper mapper;
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public void register(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		mapper.registerUser(user);
	} // register

	@Override
	public int checkId(User user) {
		return mapper.checkId(user);
	} // checkId

	@Override
	public int checkName(User user) {
		return mapper.checkName(user);
	} // checkName
/*
	@Override
	public String createKey() {
		String key = "";
		Random rd = new Random();

		for (int i=0; i<8; i++) {
			key += rd.nextInt(10);
		} // for
		
		return key;
	} // createKey
*/
	@Override
	public String sendMail(User user) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "cho20533";
		String hostSMTPpwd = "cho9303@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "cho20533@naver.com";
		String fromName = "cocainProject";
		String subject = "";
		String msg = "";

		// 인증키 생성
		Random rd = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<5; i++){
		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.
		    if(rd.nextBoolean()){
		    	sb.append((char)((int)(rd.nextInt(26))+97));
		    }else{
		    	sb.append((rd.nextInt(10)));
		    }
		}

		// 회원가입 메일 내용
		subject = "Cocain 회원가입 인증 메일입니다.";
		msg += "<h3>인증번호는 : " + sb.toString() + " 입니다.</h3>";

		// 받는 사람 E-Mail 주소
		String mail = user.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
		return sb.toString();
	} // sendMail

} // end class
