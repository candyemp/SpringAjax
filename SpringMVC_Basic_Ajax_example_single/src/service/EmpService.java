package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.EmpDao;
import dto.EmpDto;


@Service
public class EmpService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<EmpDto> getEmpList(){
		System.out.println("getEmpList");
		List<EmpDto> result = new ArrayList<>();
		EmpDao dao = sqlsession.getMapper(EmpDao.class);
		result = dao.getEmpList();
		return result;
	}
	
}
