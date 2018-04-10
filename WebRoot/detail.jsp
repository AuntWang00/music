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
  					<a href="main.jsp"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  				</h1>				
  			</div>
  			
  	<!--导航开始 -->
  			<div class="container2">	
	  			<div class="menu">  
			   		<ul>  					
			  			<li class="active"><a class="fff" href="main.jsp">原创音乐馆</a></li>
			  			<li><a class="f1" href="query.jsp">MV</a></li>
			  			<li><a class="f1" href="mymusic.jsp">我的音乐</a></li>
			  			<li><a class="f1" href="">关于买歌</a></li>			
			  		</ul>
	  			</div>	
	  <!-- 登录和注册按钮 -->
		  		<div class="header-login">
	  		   		<table class="top-table">  		   		
				   		<tr>
		  		   			<td>
		  		   				<a class="top-table-font1" href="login.jsp">注册</a>
			  		   			<a class="top-table-font2" href="reg.jsp">登录</a>
			  		   		</td>
			  		   	</tr>
	  		  		</table> 
	  		    </div> 
  		    </div> 			              
  		</div>	
  	</div>
  	<!-- 页面顶部结束 -->
  	
  	<!-- 搜索框与登录状态判断语句开始 -->
  	<div class="container1-1">
	  	<div class="input-group col-md-3" style="margin-top:0px positon:relative">  
	       <input type="text" class="form-control search clearable" placeholder="请输入歌曲名或歌手名" / >  
	       <span class="input-group-btn">  
	           <button class="btn btn-info btn-search"><i class="fa fa-search"></i></button>             
	        </span>  
	 	</div>  
	 	<div class="login-check">
		 	<c:choose>
		       <c:when test="${customer.name ==null}"> 您还未登录，登录可开启更多功能！</c:when>
		       <c:otherwise>
		        <img src="<%=basePath%><s:property value='filepath'/>">
		  	   <c:out value="${customer.name}"></c:out>, 欢迎您!
		       </c:otherwise>
		     </c:choose>
	 	</div>
  	</div>
    <div>
     <p>歌曲名称：<c:out value="${song.songname}"></c:out></p>
     <p>单价：<c:out value="${song.price}"></c:out></p>
     </div>
     </main>
  </body>
</html>
