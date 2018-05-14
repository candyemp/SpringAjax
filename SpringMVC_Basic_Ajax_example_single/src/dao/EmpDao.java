package dao;

import java.util.List;

import dto.EmpDto;
import dto.EmpList;

public interface EmpDao {
	 List<EmpDto> getEmpList();
	 int deleteEmp(String empno);
}
