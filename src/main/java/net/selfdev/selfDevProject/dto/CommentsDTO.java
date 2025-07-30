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
public class CommentsDTO {
	private int comid;
	private int certid;
	private int uid;
	private String content;
	private Date createAt;
	private Date modifyAt;
	private String isDeleted;
}
