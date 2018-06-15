<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>歌手详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">

 	 <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
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
  					<a href="song/song_showNewSong"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  				</h1>				
  			</div>
  			
  	<!--导航开始 -->
  	<div class="container2"> 
	  			<div class="menu">  
			   		<div class="nav">

  <ul>
 	<li><a class="f1" href="song/song_showNewSong">原创音乐馆</a>
    </li>
	<li  class="active"><a class="fff" href="customer/customer_showCustomer">歌手</a>
    </li>
    <li><a class="f1" class="add-order">我的音乐</a>
      <ul>
        <li><a href="song/song_showSong1">我上传的歌曲</a></li>
        <li><a href="order/order_showOrder?customer.name=<s:property value='#session.customer.name'/>">我购买的歌曲</a></li>
        <li><a href="song/song_showAdd?song.singer=<s:property value='#session.customer.name'/>">添加歌曲</a></li>
       </ul>
    </li>
    <li><a class="f1" href="#">关于买歌</a></li>

  </ul>

</div>
	  			</div>

	  <!-- 登录和注册按钮 -->
		  		<div class="header-login">
		  		<c:choose>
		       <c:when test="${customer.name ==null}"> 
		       <table class="top-table">  		   		
				   		<tr>
		  		   			<td>
		  		   				<a class="top-table-font1" href="reg.jsp">注册</a>
			  		   			<a class="top-table-font2" href="login.jsp">登录</a>
			  		   		</td>
			  		   	</tr>
	  		  		</table> 
				</c:when>
		       <c:otherwise>
		       <div class="top-login"> 		       	
		       	<img src = "<%=basePath %>${customer.filepath}" style="width:30px; height:30px;">	   
		  	    <c:out value="${customer.name}"></c:out>, 欢迎您!
			    <a href="logout.jsp">退出</a>	
			    </div>		   
		       </c:otherwise>
		       </c:choose>
	  		   		
	  		    </div> 
  		    </div> 			              
  		</div>	
  	</div>
  	<!-- 页面顶部结束 -->
  	<!-- 搜索框语句开始 -->
  	<s:form action="customer/customer_queryCustomers" method="post">
  	<div class="container1-1">
	  	<div class="input-group col-md-3" style="margin-top:0px positon:relative">  
	       <input type="text" class="form-control search clearable" placeholder="请输入歌曲名或歌手名" title="关键词" name="keyWords" />  
	       <span class="input-group-btn">  
	           <button class="btn btn-info btn-search" type="submit"><i class="fa fa-search"></i></button>             
	        </span>  
	 	</div>  
	 	
  	</div>
  	</s:form>
	<!-- 搜索框语句结束 -->
	
	<!-- 歌曲详情语句开始 -->
	<div class="singer-detail">
	<!-- 图片 -->
	<div class="above">
	<div class="part1">
	<span class = "show-photo">
 	
 	 <img src = "<%=basePath %>${customer.filepath}" style="width:300px; height:300px;">
    </span>
    <!-- 歌手信息 -->
    <div class="data-cont">
   
    <div class="data-singer"><i class="icon_singer sprite"></i>
   
	<ul class="data-info">
			
			    <!-- <li class="data_info__item data_info__item--even">专辑：<a>渺小</a></li>  -->
			    <li class="data_info__item js_lan" style="">姓名:<c:out value="${customer.realname}"></c:out></li>
			    <li class="data_info__item js_lan" style="">性别:<c:out value="${customer.sex}"></c:out> </li>
			    <li class="data_info__item js_lan" style="">国籍:<c:out value="${customer.country}"></c:out></li>
			    <li class="data_info__item js_lan" style="">生日:<c:out value="${customer.birthday}"></c:out></li>
			  <li class="data_info__item js_lan" style="">歌曲数目:<c:out value="${customer.songsnum}"></c:out></li>
			     
			 
	</ul>
			</div>		
		</div>
		</div>
	<!-- 歌词 -->
	<div class="detail-layout">
	<div class="detail-layout-main">
	<div class="mod_lyric">
			    <input id="copy_content" style="display:none;"></input>
			    <div class="lyric__hd">
				<h2 class="lyric__tit">简介</h2>
			    </div>
			    <div class="lyric__cont limit">
				<div class="lyric__cont_box" id="lrc_content"></div>
			    </div>
			</div>
			<c:out value="${customer.intro}"></c:out></div>
			
	<!-- 这段是简介· -->
	</div>	
    </div>
	<!-- 歌手详情语句结束 -->
	</div>
	
		<!--  友情链接和footer -->
     <footer class="footer" role="footer">
   		<div class="footer-inner">
   			<div class="footer-info">
   			<p>不知道放什么就先空着吧</p>
   			</div>
   			<div class="footer-copyright">
   			<p>2018买歌原创音乐版权所有</p>
   			</div>
   		</div>
   	</footer>
   	 
	<!-- 最低 -->
	
  </body>
</html>
