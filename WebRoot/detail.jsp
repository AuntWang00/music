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
    
    <title>歌曲详情</title>
    
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
	       <input type="text" class="form-control search clearable" placeholder="请输入歌曲名或歌手名" >  
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
	
	<!-- 歌曲详情语句开始 -->
	<div class="detail-contain">
	
	<!-- 图片 -->
	<div class="above">
	<div class="part1">
	<span class = "show-photo">
 		<!-- <img src = "<%=basePath %>${songs.filepath}" style="width:300px; height:300px;">  -->
 	 <img src = "<%=basePath %>${song.filepath}" style="width:300px; height:300px;">
    </span>
    <!-- 歌手信息 -->
    <div class="data-cont">
    <div class="data-name"> <p>歌曲名称：<c:out value="${song.songname}"></c:out></p></div>
   
    <div class="data-singer"><i class="icon_singer sprite"></i>
   
	<ul class="data-info">
			
			    <!-- <li class="data_info__item data_info__item--even">专辑：<a>渺小</a></li>  -->
			
			    <li class="data_info__item js_lan" style="">语种:</li><c:out value="${song.language}"></c:out>
			     
			    <li class="data_info__item js_genre data_info__item--even" style="">流派：情歌</li>
			   <!--  <li class="data_info__item js_public_time data_info__item--even" style="">发行时间：2018-04-13</li>  -->
	</ul>
	<div class="data__actions" role="toolbar">
			    <a href="" class="mod_btn_green js_all_play"><i class="mod_btn_green__icon_play"></i>试听</a>
			   
			    <a href="order/order_addOrder?song.songid=<s:property 
	                  value="song.songid"/>&customer.name=<s:property value='#session.customer.name'/>" class="mod_btn_green js_all_play">
	                  <i class="mod_btn_green__icon_play">购买</i></a>
			   
			    <a class="mod_btn js_into_comment" data-stat="y_new.song.gotocomment" href="#comment_box"><i class="mod_btn__icon_comment"></i>评论</a>
			    <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.song.header.more"  data-mid="001PfID21QGDh3"><i class="mod_btn__icon_menu"></i>更多</a>
		
			  </div>   
			</div>		
		</div>
		</div>
	<!-- 歌词 -->
	<div class="detail-layout">
	<div class="detail-layout-main">
	<div class="mod_lyric">
			    <input id="copy_content" style="display:none;"></input>
			    <div class="lyric__hd">
				<h2 class="lyric__tit">歌词</h2>
			    </div>
			    <div class="lyric__cont limit">
				<div class="lyric__cont_box" id="lrc_content"></div>
			    </div>
			</div>
			</div>
			
			<div id="lyrics" style="height:500px; overflow-y:auto">${ song.lyrics }</div>
		<script>
		$("#lyrics").html($("#lyrics").html().replace(/\n/g,"<br/>"));
		</script>
	<!-- 这段是歌词 -->
	</div>	
    </div>
	<!-- 歌曲详情语句结束 -->
	
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
