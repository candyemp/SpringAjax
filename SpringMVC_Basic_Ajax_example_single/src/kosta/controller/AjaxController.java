package kosta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.EmpDao;
import dto.EmpDto;
import service.EmpService;

@Controller
public class AjaxController {

	//org.springframework.web.servlet.view.json.MappingJackson2JsonView
	@Autowired
	private View jsonview;
	
	@Autowired
	private EmpService empservice;
	
	@RequestMapping(value="response.ajax")
	public void ajaxResponse(HttpServletResponse response){
		String empJson="[";
		
		List<EmpDto> list = empservice.getEmpList();
		for(int i=0;i<list.size();i++) {
			  empJson +=
			           "{\"empno\":\""+list.get(i).getEmpno()
			           +"\",\"ename\":\""+list.get(i).getEname()
			           +"\",\"job\":\""+list.get(i).getJob()
			           +"\",\"mgr\":\""+list.get(i).getMgr()
			           +"\",\"hiredate\":\""+list.get(i).getHiredate()
			           +"\",\"sal\":\""+list.get(i).getSal()
			           +"\",\"comm\":\""+list.get(i).getComm()
			           +"\",\"deptno\":\""+list.get(i).getDeptno()+"\"}";
			            if(i!=list.size()-1) {
			                empJson+=",";
			            }
		}
		empJson += "]";
		try {
			response.getWriter().print(empJson);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="objMapper.ajax")
	public void ajaxObjMapper(HttpServletResponse response){
		
		ObjectMapper mapper = new ObjectMapper();
		List<EmpDto> list = empservice.getEmpList();
		
		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="responseBody.ajax")
	public @ResponseBody List<EmpDto> ajaxResponseBody(){
	
		List<EmpDto> list = empservice.getEmpList();
		
		return list;  
	}
	
	
	@RequestMapping(value="json.ajax")
	public View jsonkosta(Model model){
		
		List<EmpDto> list = empservice.getEmpList();
		model.addAttribute("emp", list);
		
		return jsonview;  //private View jsonview 타입으로 리턴
	}
	
	@RequestMapping(value="delete.ajax")
	public int delete(String empno) {
		System.out.println(empno);
		return empservice.deleteEmp(empno);
	}
	
	
			
}
