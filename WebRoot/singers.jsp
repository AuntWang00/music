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
	<link rel="stylesheet" type="text/css" href="css/singers.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">	
	<link rel="stylesheet" href="css/shutter.css">
	
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
    <li><a class="f1" href="song/song_showSong1" class="add-order">我的音乐</a>
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
  	<!-- 页面顶部结束 -->
  	
  	
	
	<!-- 歌手列表开始 -->
   <div class="singer-contain">
   	<div class="singer-contain1">
   	 <div class="shutter">
		<div class="shutter-img">
		  <a href="#" data-shutter-title="Iron Man"><img src="images/Taylor1.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Super Man"><img src="images/Taylor2.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Iron Man"><img src="images/wuyuetian.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Super Man"><img src="images/zhangxueyou.jpg" alt="#"></a>
		  
		</div>
		<ul class="shutter-btn">
		  <li class="prev"></li>
		  <li class="next"></li>
		</ul>
		<div class="shutter-desc">
		  <p>Iron Man</p>
		</div>
		
		<script src="js/jquery.min.js"></script>
		<script src="js/velocity.js"></script>
		<script src="js/shutter.js"></script>
		<script>
		$(function () {
		  $('.shutter').shutter({
			shutterW: 800, // 容器宽度
			shutterH: 350, // 容器高度
			isAutoPlay: true, // 是否自动播放
			playInterval: 3000, // 自动播放时间
			curDisplay: 3, // 当前显示页
			fullPage: false // 是否全屏展示
		  });
		});
		</script>
		</div>
		<!-- 条件筛选 -->
		<div class="singer-filter">
			<div class="filter1">				
				<div class="filter2">
					<div class="singer-tag-kind"><a href="#">热门</a></div>
					<div class="singer-tag"><a href="#">A</a></div>
					<div class="singer-tag"><a href="#">B</a></div>
					<div class="singer-tag"><a href="#">C</a></div>
					<div class="singer-tag"><a href="#">D</a></div>
					<div class="singer-tag"><a href="#">E</a></div>
					<div class="singer-tag"><a href="#">F</a></div>
					<div class="singer-tag"><a href="#">G</a></div>
				</div>
				<div class="filter2">
					<div class="singer-tag-blank"></div>
					<div class="singer-tag"><a href="#">H</a></div>
					<div class="singer-tag"><a href="#">I</a></div>
					<div class="singer-tag"><a href="#">J</a></div>
					<div class="singer-tag"><a href="#">K</a></div>
					<div class="singer-tag"><a href="#">L</a></div>
					<div class="singer-tag"><a href="#">M</a></div>
					<div class="singer-tag"><a href="#">N</a></div>
				</div>
				<div class="filter2">
					<div class="singer-tag-blank"></div>
					<div class="singer-tag"><a href="#">O</a></div>
					<div class="singer-tag"><a href="#">P</a></div>
					<div class="singer-tag"><a href="#">Q</a></div>
					<div class="singer-tag"><a href="#">R</a></div>
					<div class="singer-tag"><a href="#">S</a></div>
					<div class="singer-tag"><a href="#">T</a></div>
					<div class="singer-tag"><a href="#">U</a></div>
				</div>
				<div class="filter2">
					<div class="singer-tag-blank"></div>
					<div class="singer-tag"><a href="#">V</a></div>
					<div class="singer-tag"><a href="#">W</a></div>
					<div class="singer-tag"><a href="#">X</a></div>
					<div class="singer-tag"><a href="#">Y</a></div>
					<div class="singer-tag"><a href="#">Z</a></div>
				</div>
				<br><div class="filter2">
					<div class="singer-tag-kind"><a href="#">全部</a></div>
					<div class="singer-tag"><a href="#">男</a></div>
					<div class="singer-tag"><a href="#">女</a></div>
					<div class="singer-tag1"><a href="#">组合</a></div>
				</div>
				<br><div class="filter2">
					<div class="singer-tag-kind"><a href="#">全部</a></div>
					<div class="singer-tag1"><a href="#">内地</a></div>
					<div class="singer-tag1"><a href="#">港台</a></div>
					<div class="singer-tag1"><a href="#">欧美</a></div>
					<div class="singer-tag1"><a href="#">日韩</a></div>
					<div class="singer-tag1"><a href="#">其他</a></div>
				</div>
				
			</div>
		</div>
		
		
		</div>
		
		
	   		<!-- 歌手列表 -->
	   		<s:form action="customer/customer_queryCustomers" method="post" >
	   		
	   		<s:iterator value = "customerList" status="status" begin="0" end="9"> 
		   		<ul class = "singer-list">
		   			<li class="singer-item">
		   				<div class="singer-box">
   					
		   					<img  class="singer-pic" src = "<%=basePath %><s:property value='filepath'/>" >		   			
		   				<div class="singer-info">
		   				
		   				<s:a href="customer/customer_showDetail?customer.customerid=%{customerid}"><s:property value ="name"/></s:a>		   				
		   				</div>
		   				</div>
		   			</li>
		   		</ul>
		   		
	   		</s:iterator>
	   		
	   		</s:form>
	   		
	   		<!-- 歌手列表 -->
	   		<s:form action="customer/customer_queryCustomers" method="post" >
	   		
	   		<s:iterator value = "customerList" status="status" begin="10" > 
		   		<ul class = "singer-list2">
		   			<li class="singer-item2">
		   			
		   				<div class="singer-box2">  							   						   			
		   				<div class="singer-info2">		   				
		   				<s:a href="customer/customer_showDetail?customer.customerid=%{customerid}"><s:property value ="name"/></s:a>		   				
		   				</div>
		   				</div>
		   		
		   			</li>
		   		</ul>
	   		</s:iterator>
	   		
	   		</s:form>
	   		
   		
   	</div>
   	<!-- 最新单曲结束 -->
   	
   
   
   	
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
   	 
  </body>
</html>