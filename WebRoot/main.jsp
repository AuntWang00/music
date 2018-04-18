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
  			
  	<!--导航开始 -->
  			<div class="container2">	
	  			<div class="menu">  
			   		<ul>  					
			  			<li class="active"><a class="fff" href="song/song_showSong">原创音乐馆</a></li>
			  			<li><a class="f1" href="query.jsp">MV</a></li>
			  			<li><a class="f1" href="song/song_showSong1" class="add-order">我的音乐</a></li>
			  			<li><a class="f1" href="#">关于买歌</a></li>			
			  		</ul>
	  			</div>	
	  <!-- 登录和注册按钮 -->
		  		<div class="header-login">
	  		   		<table class="top-table">  		   		
				   		<tr>
		  		   			<td>
		  		   				<a class="top-table-font1" href="reg.jsp">注册</a>
			  		   			<a class="top-table-font2" href="login.jsp">登录</a>
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
		       <img src = "<%=basePath %>${customer.filepath}" style="width:30px; height:30px;">
		  	   <c:out value="${customer.name}"></c:out>, 欢迎您!
		       </c:otherwise>
		     </c:choose>
	 	</div>
  	</div>
	<!-- 搜索框与登录状态判断语句结束 -->
	
	<!-- 最新单曲开始 -->
   <div class="con5">
   		<div class="container5">
	   		<div class="show-title">
	   				<h3><a href="new.jsp">最新单曲</a></h3>   				
	   		</div>
	   		<!-- 单曲列表 -->
	   		<s:form action="song/song_showSong" method="post">
	   		
	   		<s:iterator value = "songslist" status="status"  begin="0" end ="4"> 
		   		<ul class = "show-list">
		   			<li class="show-item">
		   				<div class="show-pic">
		   					<span style="white-space:pre;"> </span>
		   					<img src = "<%=basePath %><s:property value='filepath'/>">
		   				</div>
		   				<div class="show-info">
		   					<s:property value ="songname"/>
		   				</div>
		   			</li>
		   		</ul>
	   		</s:iterator>
	   		
	   		</s:form>
	   		
   		</div>
   	</div>
   	<!-- 最新单曲结束 -->
   	
   	<!-- 最热单曲开始 -->
   	<div class="container3">
   		<div class="con3">
	   		<div class="show-title">
	   				<h3>最热单曲</h3>   				
	   		</div>
	   		
	   	<!-- jQuery轮播开始 -->
   			<div class="demo-wrapper">
   			
   				<s:form action="song/song_showSong" method="post">
   				<ul class="portfolio-items">
   					<s:iterator value = "songslist" status="status" begin="0" end="18">		
   							<li class="item">
   								<figure>
   									<div class="view">
   										<img src = "<%=basePath %><s:property value='filepath'/>">
   									</div>
   									 <figcaption>
   										<p><span><s:property value ="songname"/></span></p>
   									    <p><span>By Vlad Gerasimov</span></p>
   									 </figcaption> 
   								</figure>
   							</li>  						
   					</s:iterator>
   					</ul>
   				</s:form>  
   								
		  </div>

			<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
			<script src="js/modernizr-1.5.min.js"></script> 
			<script src="js/jquery.mousewheel.js"></script> 
			<script src="js/scripts.js"></script>
			   			
   		</div>
   </div>
   
   <!--专辑首发开始  -->
   <div class="container4">
   		<div class="con4">
   			<div class="show-title">
	   				<h3>专辑首发</h3>   				
	   		</div>
   			<!-- 辣鸡轮播 -->
	   		<div id="content">
	<div id="main" class="clearfix">
		<div id="index_b_hero">
			<div class="hero-wrap">
				<ul class="heros clearfix">
					<li class="hero">
					<a id="jdtpic1" href="#" target="_blank">
					<img src="images/yiyangqianxi1.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/wuyuetian.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/zhangxueyou.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/Taylor1.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/Taylor2.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/taiyan.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/yiyangqianxi2.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/xujun.jpg"></a></li>
					<li class="hero">
					<a href="#" target="_blank">
					<img src="images/yanglaosan.jpg"></a></li>
				</ul>
			</div>
			<div class="helper">
				<a href="javascript:;" class="prev">
					<div class="mask-left"></div>
				</a>
				<a href="javascript:;" class="next">
					<div class="mask-right"></div>
				</a>
			</div>
		</div>
	</div>
</div>

		<script type="text/javascript" src="js/if.Common.Banner.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
		<script type="text/javascript">
		jQuery(function(){
			var len = jQuery(".heros li").length;
			jQuery(".heros li").each(function(index, element) {
			    len--;
			    jQuery(this).css("z-index", len);
			});
			jQuery(".hero").mousemove(function(){
				jQuery(".mask-left, .mask-right").show();
			});
			jQuery("#main").mouseleave(function(){
				jQuery(".mask-left, .mask-right").hide();
			});
		})
		</script>
		</div>
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
   	 
  </body>
</html>