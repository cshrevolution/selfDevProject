package net.selfdev.selfDevProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.selfdev.selfDevProject.dto.ChallengeDTO;
import net.selfdev.selfDevProject.repository.ChallengeMapper;

@Service
public class ChallengeService {
	
	@Autowired
	private ChallengeMapper cMapper;
	
	public ChallengeDTO getChallenge(int uid) {
		return cMapper.getChallenge(uid);
	}

	public int setChallenge(ChallengeDTO challenge) {
		return cMapper.setChallenge(challenge);
	}
}
