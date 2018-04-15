<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>下单成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Refresh" content="1;url=order/order_showOrder?customer.name=${customer.name}">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	

  </head>
  
  <body>
  <header>
  		<div class="logo"></div>
  		<div class="account">
		    <c:choose>
		       <c:when test="${customer.name ==null}">
		         <a href="login.jsp">登录</a>
		         <a href="reg.jsp">注册</a>
		       </c:when>
		       <c:otherwise>
		         <c:out value="${customer.name}"></c:out>欢迎您!
		       </c:otherwise>
		    </c:choose>
		    </div>
		    
    </header>
    <main>
    <div>
    下单成功! <br>
    </div>
    </main>
  </body>
</html>
