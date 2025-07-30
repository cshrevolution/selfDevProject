package net.selfdev.selfDevProject.dto;

import lombok.Data;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
@Data
public class BadgeDTO {
	private int bid;
	private String bname;
	private String description;
	private String icon;
}
