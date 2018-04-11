﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	
  </head>
  
  <body>
  <header>
  		<div class="logo"></div>
  		
		    
    </header>
    <main>
    <s:form action="customer/customer_reg" method="post">
    <s:textfield name = "customer.name" label="用户名"></s:textfield>
    <s:password name = "customer.password" label="密码"></s:password>
    <s:textfield name = "customer.realname" label="真实姓名">真实姓名</s:textfield>
    <s:textfield name = "customer.sex" label="性别">性别</s:textfield>
  <s:textfield name = "customer.birthday" label="生日">生日</s:textfield>
    <s:textfield name = "customer.country" label="国家">国家</s:textfield>
    <s:submit value="提交"></s:submit>   
    </s:form>
 
    </main>
 
  </body>
</html>
