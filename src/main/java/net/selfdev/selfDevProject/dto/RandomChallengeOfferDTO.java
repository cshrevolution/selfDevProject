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
public class RandomChallengeOfferDTO {
	private int rcid;
	private int uid;
	private String cname;
	private String description;
	private Date offerAt;
	private Date expireAt;
	private String status;
	private Date AcceptedAt;
}
