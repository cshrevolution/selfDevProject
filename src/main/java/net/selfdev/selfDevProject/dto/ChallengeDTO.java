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
public class ChallengeDTO {
	private int cid;
	private String cname;
	private String description;
	private int creatorId;
	private Date startAt;
	private Date endAt;
	private Date createAt;
	private Date modifyAt;
}
