<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <table>
    
    <s:form action="customer/customer_reg" method="post">
    <tr>
    <td> <s:textfield name = "customer.bab" label="昵称">用户昵称</s:textfield></td>
    <td><s:password name = "customer.password" label="密码">密码</s:password></td>
    
    </tr>
    <tr>
    <th><s:submit value="提交"></s:submit></th>
    <th><s:reset value = "重填"></s:reset></th>
    </tr>
    </s:form>
    </table>
    <li><span>还没有账户？</span><a href="login.jsp">注册一个</a><span>|</span></li>
    </main>
  <!--  
  <main class="bg">
 <s:form action="customer/customer_login" method="post" cssclass="login">
 <h3>注册页面</h3>
 <div class="form-group">
 <div class="input-group">
 <span class="input-group-addon"><i class="fa fa-ul fa-lock"></i></span>
 <input type="text" name="customer.name" class="form-control" placeholder="用户名" required>
 </div>
 <div class="input-group">
 <span class="input-group-addon"><i class="fa fa-ul fa-lock"></i></span>
 <input type="password" name="customer.password" class="form-control" placeholder="密码" required>
      </div>
      <div class="input-group">
 <span class="input-group-addon"><i class="fa fa-ul fa-lock"></i></span>
 <input type="password" name="customer.password" class="form-control" placeholder="验证密码" required>
      </div>
      </div>
      <button type="submit" class="btn btn-success">注册</button>
    </s:form>
    </main>
    -->
  </body>
</html>
