package net.selfdev.selfDevProject.repository;

import org.apache.ibatis.annotations.Mapper;

import net.selfdev.selfDevProject.dto.ChallengeDTO;

@Mapper
public interface ChallengeMapper {
	public ChallengeDTO setChallenge(ChallengeDTO challenge);
}
