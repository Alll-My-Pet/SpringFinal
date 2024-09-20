package com.spring_boot_allmypet.project.service.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.member.IMemberDAO;
import com.spring_boot_allmypet.project.model.member.MemberVO;

@Service
public class MemberService implements IMemberService {
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO dao;
	
	@Autowired
	PasswordEncoder pwdEncoder;
	
	// 회원가입
	@Override
	public void insertMember(MemberVO vo) {
		String encodedPwd = pwdEncoder.encode(vo.getMemPwd());
		vo.setMemPwd(encodedPwd);
		dao.insertMember(vo);
	}
	// 아이디 확인
	@Override
	public String memIdCheck(String id) {
		return dao.memIdCheck(id);
	}
	// 닉네임 확인
	@Override
	public String memNNCheck(String nn) {
		return dao.memNNCheck(nn);
	}

	// 포지션 체크
	@Override
	public int memPosition(String id) {
		return dao.memPosition(id);
	}
	
	// 포지션 체크
	@Override
	public int memFiltering(String id) {
		return dao.memFiltering(id);
	}
	
	// 로그인 체크
	@Override
	public String loginCheck(HashMap<String, Object> map) {
		String encodedPwd = dao.loginCheck(map);
		String result = "fail";
		if(encodedPwd != null && pwdEncoder.matches((String)map.get("memPwd"), encodedPwd)){
			result ="success";
		}
		return result;
	}
	
	// 아이디 찾기
	@Override
	public String findId(HashMap<String, Object> map) {
        return dao.findId(map);
    }
	
	// 비밀번호 찾기
	@Override
	public String findPwd(HashMap<String, Object> map) {
		return dao.findPwd(map);
    }
	
	// 비밀번호 변경
	@Override
	public void changePwd(MemberVO vo) {
		dao.changePwd(vo);
    }

}
