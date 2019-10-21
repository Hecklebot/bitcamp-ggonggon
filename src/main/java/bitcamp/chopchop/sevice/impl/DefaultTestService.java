package bitcamp.chopchop.sevice.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bitcamp.chopchop.dao.TestDao;
import bitcamp.chopchop.domain.Member;
import bitcamp.chopchop.sevice.TestService;

@Service
public class DefaultTestService implements TestService {
	
	@Resource
	private TestDao testDao;

	@Override
	public int dupCheck(HashMap<String, Object> map) throws Exception {
		return testDao.dupCheck(map);
	}

	@Override
	public void insert(Member member) throws Exception {
		testDao.insert(member);
	}

    @Override
    public int dupEmailCheck(String email) throws Exception {
      return testDao.dupEmailCheck(email);
    }
	

//	@Override
//	public int dupCheck(String email) throws Exception {
//		return testDao.dupCheck(email);
//	}
//
//	@Override
//	public int dupCheck2(String nickname) throws Exception {
//		return testDao.dupCheck2(nickname);
//	}


}
