package com.nmims.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nmims.bean.HarvardBean;
import com.nmims.bean.StudentSubjectConfig;
import com.nmims.dao.PostDao;
import com.nmims.dao.ResourceDao;

@Service("ResourceService")
public class ResourceService {
	
	@Autowired
	PostDao postDao;
	
	@Autowired
	ResourceDao rDao;
	
	@Transactional
    public List<StudentSubjectConfig> getSubjectsByTimeboundId(List<Integer> timeboundIds){
    	List<StudentSubjectConfig> subjects = rDao.getSubjectsByTimeboundId(timeboundIds);
		return subjects;
    }
	
	@Transactional
	public List<HarvardBean> getHarvardModulesBySapid(String sapid){
		List<HarvardBean> moduleList = new ArrayList<HarvardBean>();
		try {
		   moduleList = rDao.getHarvardModulesBySapid(sapid);
		   return moduleList;
		}catch(Exception e) {
		 throw e;	
		}
		
	}
}
