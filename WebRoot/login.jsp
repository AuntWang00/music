<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>歌曲展示页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	
	
	
 	 <link rel="stylesheet" href="css/buttons.css">
 	 <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="less/reset.css">
		<link type="text/css" rel="stylesheet" href="less/slide.css">
		<link type="text/css" rel="stylesheet" href="less/index.css">
		
		
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>	
			
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
	

  </head>
  
  <body>
  	<!-- 页面顶部开始 （包括logo、导航、登录按钮、注册按钮）-->
  	<div class="top">
  		<div class="top-container">
  			<div class="header-logo">
  				<h1 class="maige-title">
  					<a href="song/song_showSong"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  				</h1>				
  			</div>
  		</div>
    </div>	
  	
	 <div class="login-contain">
		  <main class="bg">
				 <s:form action="customer/customer_login" method="post" cssclass="login">
					 <h3>登陆页面</h3>
					<div class="form-group">
		              <div class="input-group">
		                <span class="input-group-addon"><i class="fa fa-user"></i></span>
		                <input type="text" name="customer.name" class="form-control" placeholder="请输入用户名">
		              </div>
		              <s:fielderror fieldName="customer.name" cssClass="fielderror"/>
		               <div class="input-group">
		                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
		                <input type="password" name="customer.password" class="form-control" placeholder="请输入密码">
		              </div>
		              <s:fielderror fieldName="customer.password" cssClass="fielderror"/>
		          </div>
			      <button type="submit" class="btn btn-success btn-login">登 录 </button> <div class="bg-a"><a href="reg.jsp">还没有账户，去创建一个</a></div>
				 </s:form>
				    
		  </main>
	 </div>
  </body>
</html>