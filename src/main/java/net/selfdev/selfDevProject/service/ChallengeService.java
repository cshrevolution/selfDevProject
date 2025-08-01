package net.selfdev.selfDevProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.selfdev.selfDevProject.dto.ChallengeDTO;
import net.selfdev.selfDevProject.repository.ChallengeMapper;

@Service
public class ChallengeService {
	
	@Autowired
	private ChallengeMapper cMapper;
	
	public List<ChallengeDTO> getChallenge(int uid) {
		return cMapper.getChallenge(uid);
	}

	public int setChallenge(ChallengeDTO challenge) {
		return cMapper.setChallenge(challenge);
	}
	
	public int updateChallenge(ChallengeDTO challenge) {
		return cMapper.updateChallenge(challenge);
	}
	public int deleteChallenge(ChallengeDTO challenge) {
		return cMapper.deleteChallenge(challenge);
	}
}
