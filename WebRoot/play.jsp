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
    
    <title>歌曲播放页面</title>
    
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
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
		
	    <link rel="stylesheet" type="text/css" href="css/tplayer.css" />
    <link rel="stylesheet" type="text/css" href="Plugins/FontAwesome4.1/css/font-awesome.min.css" />
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/tPlayer.js"></script>
		
		
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
			  			<li><a class="f1" href="song/song_showSong">原创音乐馆</a></li>
			  			<li><a class="f1" href="query.jsp">MV</a></li>
			  			<li class="active"><a class="fff" href="song/song_showSong1">我的音乐</a></li>
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
		  	   <c:out value="${customer.name}"></c:out>, 欢迎您!
		       </c:otherwise>
		     </c:choose>
	 	</div>
  	</div>
	<!-- 搜索框与登录状态判断语句结束 -->
	
	<audioautoplay="autoplay"controls="controls"loop="loop"preload="auto"
	
	src="<%=basePath %>${song.audiopath}">
            
            你的浏览器不支持audio标签
      
      </audio>
	
	
	    <div id="t_wrapper">
        <div id="t_cover">
        	<img src="images/logo1.png">
        </div>
    	<div id="t_top">
    		<div id="t_title_info">
    			<span class="artist"></span>
    			<span class="title"></span>
    		</div>
    	</div>
    	<div id="t_middle">
    		<div id="play"></div>
    		<div id="pause" class="hidden">
    		</div>
    		<div class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="t_progress">
                <div id="trackInfo">
                    <div id="error">
    				</div>
                    <div id="current">0:00</div>
                    <div id="duration">0:00</div>
    			</div>
    			<div style="width: 0%;" class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min"></div>
            	<span style="left: 0%;" class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
            </div>
    		<span id="prev"></span>
            <span id="next"></span>
    	</div>
    	<div id="t_bottom">
            <div id="range">
                <div id="val"></div>
                <div id="vol"></div>
                <div id="rangeVal"></div>
            </div>
            <div id="t_pls_show" class="noselectpls"></div>
    	</div>
    </div>
    <div id="playlist">
        <ul>
            <li t_cover="goldfrapp.jpg" t_artist="Transformers2" t_name="Transformers2">
            	<a href="#">Goldfrapp –Jo</a>
            	<audio preload="none">
                    <source src="<%=basePath %>${song.audiopath}" type="audio/mp3">
                    <source src="Media/Transformers2.htm" type="audio/ogg; codecs=vorbis">
            	</audio>
            </li>
            <li t_cover="Moby.jpg" t_artist="Moby" t_name="The Last Day (with Skylar Grey)">
            	<a href="#">Moby – The Last Day (with Skylar Grey)</a>
                <audio preload="none">
                    <source src="<%=basePath %>${song.audiopath}" type="audio/mp3">
                    <source src="Media/Transformers2.htm" type="audio/ogg; codecs=vorbis">
                </audio>
            </li>
            <li t_cover="lina.jpg" t_artist="LINA nananan" t_name="JIENIFO">
            	<a href="#">LINA nananan– JIENIFO</a>
                <audio preload="none">
                    <source src="Media/Transformers2.mp3" type="audio/mp3">
                    <source src="Media/Transformers2.htm" type="audio/ogg; codecs=vorbis">
                </audio>
            </li>
            <li t_cover="birdy.jpg" t_artist="Birdy" t_name="Shelter">
            	<a href="#">Birdy – Shelter</a>
                <audio preload="none">
                    <source src="Media/Transformers2.mp3" type="audio/mp3">
                    <source src="Media/Transformers2.htm" type="audio/ogg; codecs=vorbis">
                </audio>
            </li>
        </ul>
    </div>
	
	
  </body>
</html>
