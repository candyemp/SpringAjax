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
			
			$(document).on("click",".delete",function(){
				$.ajax({
					type : "post",
					url  : "delete.ajax",
					data : {empno : $(this).attr("value2")},
					success : function(data){ 
						createTable(data.emp, "삭제완료");
					} 
				})
			});

			
			//Json 전용
			function createTable(data, way){
				$('#menuView').empty();
				var opr="<table border='1px'><tr>"+way+"</tr><tr>"+
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
			
			//Xml 전용
			function createxmlTable(data, way){
				$('#menuView').empty();
				var opr="<table border='1px'><tr>"+way+"</tr><tr>"+
				    "<th>EMPNO</th>"+
	            	"<th>ENAME</th>"+
	            	"<th>JOB</th>"+
	            	"<th>MGR</th>"+
	            	"<th>HIREDATE</th>"+
	            	"<th>SAL</th>"+
	            	"<th>COMM</th>"+
	            	"<th>DEPTNO</th>"+
	            	"<th>EDIT</th><th>DELETE</th></tr>";
				$.each(data,function(){
					opr += "<tr><th>"+$(this).find('empno').text()+
					"</th><th>"+$(this).find('ename').text()+
					"</th><th>"+$(this).find('job').text()+
					"</th><th>"+$(this).find('mgr').text()+
					"</th><th>"+$(this).find('hiredate').text()+
					"</th><th>"+$(this).find('sal').text()+
					"</th><th>"+$(this).find('comm').text()+
					"</th><th>"+$(this).find('deptno').text()+
					"</th><th><input type='button' value='수정' class ='update'  value2="+$(this).find('empno').text()+
					"></th><th><input type='button' value='삭제' class ='delete' value2="+$(this).find('empno').text()+"></th></tr>";
				});
				$('#menuView').append(opr);
			}
			
			$('#responseBtn').click(function(){
				 $.ajax(
						 {  
							type : "post",
							url  : "response.ajax",
							success : function(data){ 
								var jsonData = JSON.parse(data);
								createTable(jsonData, "response객체");
								
							} 
						 } 
				       )  
			});
			
			$('#objMapperBtn').click(function(){
				 $.ajax(
						 {  
							type : "post",
							url  : "objMapper.ajax",
							success : function(data){  
								var jsonData = JSON.parse(data);
								createTable(jsonData, "ObjectMapper");
							} 
						 }
						 	
				       )    
			});
			
			$('#responseBodyBtn').click(function(){
				 $.ajax(
						 {  
							type : "post",
							url  : "responseBody.ajax",
							success : function(data){  
								createTable(data, "@ResponseBody");
							} 
						 } 
				       )    
			});
			
			$('#ajaxBtn').click(function(){
				 $.ajax(
						 { 
							type : "post",
							url  : "json.ajax",
							success : function(data){  
								createTable(data.emp, "JsonView");
							} 
						 } 
				       )    
			});
			
			$('#restconBtn').click(function(){
				 $.ajax(
						 {  
							type : "post",
							url  : "restcon.ajax",
							success : function(data){  
								createTable(data, "@Restcontroller");
							} 
						 } 
				       )    
			});
			
			$('#xmlBtn').click(function(){
				 $.ajax(
						 {  
							type : "post",
							url  : "xmllist.ajax",
							datatype : "xml",
							success : function(data){  
								createxmlTable($(data).find('emplist').find('emp'),"XML");
							} 
						 }
				       )    
			});
			
		})
		
		
	
	</script>
</head>
<body>
<div class="row">
<div class="col-sm-6">
<fieldset>
	<legend>JSON</legend>
	<input type="button" value="Response" id="responseBtn">
	<input type="button" value="ObjectMapper" id="objMapperBtn">
	<input type="button" value="ResponseBody" id="responseBodyBtn">
	<input type="button" value="JsonView" id="ajaxBtn">
	<input type="button" value="RestController" id="restconBtn">
</fieldset>
</div>
<div class="col-sm-6">
<fieldset>
	<legend>XML</legend>
	<input type="button" value="Xml" id="xmlBtn">
</fieldset>
</div>
</div>
	<hr>
	<span id="menuView"></span>
</body>
</html>