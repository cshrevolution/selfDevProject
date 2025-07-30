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
public class ReportDTO {
	private int rid;
	private int reporterId;
	private Date reportAt;
	private String reason;
	private int targetId;
	private String targetType;
	private String status;
}
