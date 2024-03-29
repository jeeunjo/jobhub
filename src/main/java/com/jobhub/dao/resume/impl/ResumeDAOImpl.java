package com.jobhub.dao.resume.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jobhub.dao.resume.ResumeDAO;
import com.jobhub.dto.resume.Resume;
import com.jobhub.dto.resume.ResumeSearchCondition;

@Repository
public class ResumeDAOImpl implements ResumeDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int saveResume(Resume resume) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("resume_mapper.saveResume", resume);
		return result;
	}

	
	public List<Resume> findResumeList() {
		// TODO Auto-generated method stub
		List<Resume> resumeList = sqlSessionTemplate.selectList("resume_mapper.findResumeList");
		return resumeList;
	}

	
	@Override
	public List<Resume> findResumeListBySearchCondition(ResumeSearchCondition resumeSearchCondition) {
		// TODO Auto-generated method stub
		List<Resume> resumeList = sqlSessionTemplate.selectList("resume_mapper.findResumeListBySearchCondition", resumeSearchCondition);
		return resumeList;
	}

	@Override
	public Resume findResumeByCareerId(String careerId) {
		// TODO Auto-generated method stub
		Resume resume = sqlSessionTemplate.selectOne("resume_mapper.findResumeByCareerId", careerId);
		return resume;
	}

	@Override
	public int modifyResume(Resume resume) {
	    // TODO Auto-generated method stub
	    int result = sqlSessionTemplate.update("resume_mapper.modifyResume", resume);
	    return result;
	}

	@Override
	public int deleteResume(String resumeId) {
	    // TODO Auto-generated method stub
	    int result = sqlSessionTemplate.delete("resume_mapper.deleteResume", resumeId);
	    return result;
	}

	@Override
	public String selectNextResumeId() {
		// TODO Auto-generated method stub
		String result = sqlSessionTemplate.selectOne("resume_mapper.selectNextResumeId");
	    return result;
	}

	@Override
	public Resume findResumeByResumeId(String resumeId) {
		// TODO Auto-generated method stub
		
		Resume resume = sqlSessionTemplate.selectOne("resume_mapper.findResumeByResumeId", resumeId);
		return resume;
	}

	@Override
	public List<Resume> findResumesByUserId(String userId) {
		// TODO Auto-generated method stub
		List<Resume> resumeList = sqlSessionTemplate.selectList("resume_mapper.findResumesByUserId", userId);
		return resumeList;
	}


	@Override
	public int updateResume(Resume resume) {
		 int result = sqlSessionTemplate.update("resume_mapper.updateResume", resume);
		    return result;
	}
	
	
}
