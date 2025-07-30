package net.selfdev.selfDevProject.repository;

import org.apache.ibatis.annotations.Mapper;

import net.selfdev.selfDevProject.dto.UserDTO;

@Mapper
public interface UserMapper {
	public int getUser(UserDTO user);
	public int setUser(UserDTO user);
	public int delUser(UserDTO user);
	public UserDTO infoUser(int uid);
	public int updateUser(UserDTO user);
	public int updateUserWithoutPW(UserDTO user);
}
