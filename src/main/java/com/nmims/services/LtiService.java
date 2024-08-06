package com.nmims.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.nmims.dao.LtiDao;

@Service("LtiService")

@SuppressWarnings("unchecked")
public class LtiService {
	@Autowired
	LtiDao ltiDao;
	
//	@Transactional
//	public LTIConsumerRequestBean getLtiLink() {
//		return ltiDao.getLtiLink( );
//	}
}
