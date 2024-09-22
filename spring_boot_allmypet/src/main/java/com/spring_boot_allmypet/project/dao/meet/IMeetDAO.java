package com.spring_boot_allmypet.project.dao.meet;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring_boot_allmypet.project.model.meet.MeetVO;

public interface IMeetDAO {

	public int getMeetCount(Map<String, Object> filters);

	public List<MeetVO> getMeetList(Map<String, Object> filters);
	
}
