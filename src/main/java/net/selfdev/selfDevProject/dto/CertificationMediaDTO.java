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
public class CertificationMediaDTO {
	private int cmid;
	private int certid;
	private String mediaUrl;
	private String mediaType;
	private Date uploadAt;
}
