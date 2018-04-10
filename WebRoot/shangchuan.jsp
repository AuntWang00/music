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
		<meta http-equiv="Refresh" content="0;url=song/song_showSong">
		
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
     <table class="table table-hover">
        <tr>  
          <th>序号</th>  
          <th>歌曲名称</th>
          <th>歌手名称</th>
          <th>价格</th> 
          <th>专辑</th>
          <th>语种</th>  
           <th></th>  
          <th></th>
          <th></th> 
        </tr> 
        
<c:forEach var="song" items="${songslist}" varStatus="status">
	       <c:when test="${customer.realname == song.singer&& customer.name!= null}">

          <tr>
            <td><c:out value="${status.index+1}"></c:out></td>
            <td><a href="song/song_showDetail?song.songid=${song.songid}">
            <c:out value="${song.songname}"></c:out></a></td>
            <td><c:out value="${song.singer}"></c:out></td>
            <td><c:out value="${song.price}"></c:out></td>
            <td><c:out value="${song.album}"></c:out></td>
            <td><c:out value="${song.language}"></c:out></td>
           
	         <td><a href="song/song_showEdit?song.songid=${song.songid}">编辑</a></td>
            <td><a href="song/song_deleteSong?song.songid=${song.songid}">删除</a></td>
	       
	         
          </tr>
          </c:when>
        </c:forEach>
      </table>
     
  </body>
</html>
