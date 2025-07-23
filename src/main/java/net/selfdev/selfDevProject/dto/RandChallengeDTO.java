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
public class RandChallengeDTO {
	private int rcid;
	private int uid;
	private String cname;
	private String description;
	private Date offerAt;
	private Date expireAt;
	private String status;
	private Date acceptedAt;
}
