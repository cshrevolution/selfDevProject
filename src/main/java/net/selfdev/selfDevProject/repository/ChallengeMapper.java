package net.selfdev.selfDevProject.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.selfdev.selfDevProject.dto.ChallengeDTO;

@Mapper
public interface ChallengeMapper {
	public List<ChallengeDTO> getChallenge(int uid);
	public int setChallenge(ChallengeDTO challenge);
	public int updateChallenge(ChallengeDTO challenge);
	public int deleteChallenge(ChallengeDTO challenge);
}
