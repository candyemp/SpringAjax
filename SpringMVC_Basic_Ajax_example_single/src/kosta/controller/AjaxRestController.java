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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dto.EmpDto;
import service.EmpService;

@RestController
public class AjaxRestController {

	@Autowired
	private EmpService empservice;
	
	@RequestMapping(value="restcon.ajax")
	public List<EmpDto> ajaxResponseBody(){
	
		List<EmpDto> list = empservice.getEmpList();
		return list;  
	}
	
			
}
