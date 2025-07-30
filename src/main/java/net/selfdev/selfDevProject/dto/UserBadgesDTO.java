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
public class UserBadgesDTO {
	private int ubid;
	private int uid;
	private int bid;
	private Date awardedAt;
}
