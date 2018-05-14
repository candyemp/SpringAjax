<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#responseBtn').click(function(){
				
				 $.ajax(
						 {  //jso
							type : "post",
							url  : "response.ajax",
							success : function(data){  //서버 {"menu",list}   //data > {}
								console.log(data);
								var jsonData = JSON.parse(data);
				
								console.log(jsonData);
								$('#menuView').empty();
								var opr="<table border='1px'><tr>Response객체</tr><tr>"+
								    "<th>EMPNO</th>"+
					            	"<th>ENAME</th>"+
					            	"<th>JOB</th>"+
					            	"<th>MGR</th>"+
					            	"<th>HIREDATE</th>"+
					            	"<th>SAL</th>"+
					            	"<th>COMM</th>"+
					            	"<th>DEPTNO</th>"+
					            	"<th>EDIT</th><th>DELETE</th></tr>";
								$.each(jsonData,function(index,emp){
									opr += "<tr><th>"+emp.empno+
									"</th><th>"+emp.ename+
									"</th><th>"+emp.job+
									"</th><th>"+emp.mgr+
									"</th><th>"+emp.hiredate+
									"</th><th>"+emp.sal+
									"</th><th>"+emp.comm+
									"</th><th>"+emp.deptno+
									"</th><th><input type='button' value='수정' class ='update'  value2="+emp.empno+
									"></th><th><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></th></tr>";
								});
								$('#menuView').append(opr);
								
							} 
						 } 
				       )    
			});
			
			$('#objMapperBtn').click(function(){
				
				 $.ajax(
						 {  //jso
							type : "post",
							url  : "objMapper.ajax",
							success : function(data){  //서버 {"menu",list}   //data > {}
								console.log(data);
								var jsonData = JSON.parse(data);
								console.log(jsonData);
								$('#menuView').empty();
								var opr="<table border='1px'><tr>ObjectMapper</tr><tr>"+
								    "<th>EMPNO</th>"+
					            	"<th>ENAME</th>"+
					            	"<th>JOB</th>"+
					            	"<th>MGR</th>"+
					            	"<th>HIREDATE</th>"+
					            	"<th>SAL</th>"+
					            	"<th>COMM</th>"+
					            	"<th>DEPTNO</th>"+
					            	"<th>EDIT</th><th>DELETE</th></tr>";
								$.each(jsonData,function(index,emp){
									opr += "<tr><th>"+emp.empno+
									"</th><th>"+emp.ename+
									"</th><th>"+emp.job+
									"</th><th>"+emp.mgr+
									"</th><th>"+emp.hiredate+
									"</th><th>"+emp.sal+
									"</th><th>"+emp.comm+
									"</th><th>"+emp.deptno+
									"</th><th><input type='button' value='수정' class ='update'  value2="+emp.empno+
									"></th><th><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></th></tr>";
								});
								$('#menuView').append(opr);
								
							} 
						 } 
				       )    
			});
			
			$('#responseBodyBtn').click(function(){
				
				 $.ajax(
						 {  //jso
							type : "post",
							url  : "responseBody.ajax",
							success : function(data){  //서버 {"menu",list}   //data > {}
								console.log(data);
								$('#menuView').empty();
								var opr="<table border='1px'><tr>@ResponseBody</tr><tr>"+
								    "<th>EMPNO</th>"+
					            	"<th>ENAME</th>"+
					            	"<th>JOB</th>"+
					            	"<th>MGR</th>"+
					            	"<th>HIREDATE</th>"+
					            	"<th>SAL</th>"+
					            	"<th>COMM</th>"+
					            	"<th>DEPTNO</th>"+
					            	"<th>EDIT</th><th>DELETE</th></tr>";
								$.each(data,function(index,emp){
									opr += "<tr><th>"+emp.empno+
									"</th><th>"+emp.ename+
									"</th><th>"+emp.job+
									"</th><th>"+emp.mgr+
									"</th><th>"+emp.hiredate+
									"</th><th>"+emp.sal+
									"</th><th>"+emp.comm+
									"</th><th>"+emp.deptno+
									"</th><th><input type='button' value='수정' class ='update'  value2="+emp.empno+
									"></th><th><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></th></tr>";
								});
								$('#menuView').append(opr);
								
							} 
						 } 
				       )    
			});
			
			$('#ajaxBtn').click(function(){
				
				 $.ajax(
						 {  //jso
							type : "post",
							url  : "json.ajax",
							success : function(data){  //서버 {"menu",list}   //data > {}
								console.log(data);
								$('#menuView').empty();
								var opr="<table border='1px'><tr>JSONVIEW</tr><tr>"+
								    "<th>EMPNO</th>"+
					            	"<th>ENAME</th>"+
					            	"<th>JOB</th>"+
					            	"<th>MGR</th>"+
					            	"<th>HIREDATE</th>"+
					            	"<th>SAL</th>"+
					            	"<th>COMM</th>"+
					            	"<th>DEPTNO</th>"+
					            	"<th>EDIT</th><th>DELETE</th></tr>";
								$.each(data.emp,function(index,emp){
									opr += "<tr><th>"+emp.empno+
									"</th><th>"+emp.ename+
									"</th><th>"+emp.job+
									"</th><th>"+emp.mgr+
									"</th><th>"+emp.hiredate+
									"</th><th>"+emp.sal+
									"</th><th>"+emp.comm+
									"</th><th>"+emp.deptno+
									"</th><th><input type='button' value='수정' class ='update'  value2="+emp.empno+
									"></th><th><input type='button' value='삭제' class ='delete' value2="+emp.empno+"></th></tr>";
								});
								$('#menuView').append(opr);
								
							} 
						 } 
				       )    
			});
			
		});
	
	</script>
</head>
<body>
	<input type="button" value="Response" id="responseBtn">
	<input type="button" value="ObjectMapper" id="objMapperBtn">
	<input type="button" value="ResponseBody" id="responseBodyBtn">
	<input type="button" value="Spring-json" id="ajaxBtn">
	<hr>
	<span id="menuView"></span>
</body>
</html>