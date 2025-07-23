package net.selfdev.selfDevProject.dto;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
@Data
public class UserDTO {
	private int uid;
	private String uname;
	private String email;
	private String password;
	private String nickname;
	private Date joinAt;
	private Date updateAt;
	private int ticket;
	private String isUsable;
}
