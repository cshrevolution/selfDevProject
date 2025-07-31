package net.selfdev.selfDevProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.selfdev.selfDevProject.repository.ChallengeMapper;

@Service
public class ChallengeService {
	
	@Autowired
	private ChallengeMapper cMapper;

	
}
