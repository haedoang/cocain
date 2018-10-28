package kr.co.cocain.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.User;
import kr.co.cocain.repository.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper mapper;

	@Override
	public void register(User user) {
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

} // end class
