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
public class CertificationsDTO {
	private int certid;
	private int cid;
	private int uid;
	private String title;
	private String content;
	private Date certDate;
	private Date createAt;
	private Date modifyAt;
	private String status;
	private String isDeleted;
	
}
