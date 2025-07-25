package net.selfdev.selfDevProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.selfdev.selfDevProject.dto.UserDTO;
import net.selfdev.selfDevProject.repository.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public int getUser(UserDTO user) {
		return userMapper.getUser(user);
	}
	
	public int setUser(UserDTO user) {
		return userMapper.setUser(user);
	}
}
