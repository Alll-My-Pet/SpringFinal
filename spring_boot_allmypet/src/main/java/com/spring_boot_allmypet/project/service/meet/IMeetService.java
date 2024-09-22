package com.spring_boot_allmypet.project.service.meet;

import java.util.List;
import java.util.Map;

import com.spring_boot_allmypet.project.model.meet.MeetVO;

public interface IMeetService {

    public int getMeetCount(Map<String, Object> filters);

    public List<MeetVO> getMeetList(Map<String, Object> filters);

}
