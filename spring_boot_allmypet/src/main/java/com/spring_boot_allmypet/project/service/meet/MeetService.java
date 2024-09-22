package com.spring_boot_allmypet.project.service.meet;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.meet.IMeetDAO;
import com.spring_boot_allmypet.project.model.meet.MeetVO;

@Service
public class MeetService implements IMeetService {
	@Autowired
	@Qualifier("IMeetDAO")
	IMeetDAO dao;

	public int getMeetCount(Map<String, Object> filters) {
        return dao.getMeetCount(filters);
    }

	public List<MeetVO> getMeetList(Map<String, Object> filters) {
	    return dao.getMeetList(filters);
	}
}