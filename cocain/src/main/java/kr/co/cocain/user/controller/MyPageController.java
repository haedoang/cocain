package kr.co.cocain.user.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.repository.domain.UserFile;
import kr.co.cocain.user.service.UserService;


@Controller("kr.co.cocain.user.controller.MyPageController")
@RequestMapping("/user")
public class MyPageController {
	
	@Autowired
	private UserService service;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@RequestMapping("myPage.do")
	public void myPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		UserFile userFile = new UserFile();
		userFile.setId(user.getId());
		model.addAttribute("userFile", service.selectFile(userFile));
	} // myPage
	
	@RequestMapping("passCheck.do")
	@ResponseBody
	public User oriPassCk(User user, String id, String oriPassword) {
		try {
			user = service.checkPass(id);
			String encoded = user.getPassword();
			
			if(passwordEncoder.matches(oriPassword, encoded)) {
				return user;
			} else {
				user = null;
			} // if-else
		} catch(Exception e) {
			
			return user;
		} // try-catch	
		
		return user;
	} // oriPassCk
	
	@RequestMapping("modifyPass.do")
	public String updatePass(User user, HttpSession session) {
		service.updatePass(user);
		session.invalidate(); 
		
		return "redirect:/main/main.do";
	} // updatePass
	
	@RequestMapping(value="profileImg.do", method=RequestMethod.POST)
	@ResponseBody
	public String profileImg(MultipartFile uploadFile, HttpServletRequest request) throws Exception {	
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(uploadFile.isEmpty() == true) return "redirect:myPage.do";
		
		String uploadPath = "C:/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		String ext = "";
		int index = uploadFile.getOriginalFilename().lastIndexOf(".");
		
		if(index != -1) {
			ext = uploadFile.getOriginalFilename().substring(index);
		} // if
		
		File file = new File(uploadPath + datePath); 
		if(file.exists() == false) {
			file.mkdirs();
		} // if
		String uName = UUID.randomUUID().toString();
		uploadFile.transferTo(new File(uploadPath + datePath, uName + ext));		
		
		UserFile userfile = new UserFile();
		userfile.setId(user.getId());
		userfile.setFileName(uploadFile.getOriginalFilename());
		userfile.setUploadPath("/local_img" + datePath + "/" + uName + ext);
		
		service.deleteFile(userfile);
		service.insertFile(userfile);
		
		return "성공";
	} // profileImg
	
} // end class
