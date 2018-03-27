<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传歌曲主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	
	
	
	
	     <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
  </head>
  
  <body>
  	<s:form action ="song/song_addSong" method="post">
  	<s:textfield name="song.songname" label="歌曲名称"></s:textfield>
  	<s:textfield name="song.singer" label="歌手名称"></s:textfield>
  	<s:textfield name="song.album" label="专辑"></s:textfield>
  	<s:textfield name="song.price" label="价格"></s:textfield>
  	<s:textfield name="song.language" label="语种"></s:textfield>
  	<s:textfield name="song.lyrics" label="歌词"></s:textfield>
  	<s:submit value="上传"></s:submit> 	
  	</s:form>
  </body>
</html>
