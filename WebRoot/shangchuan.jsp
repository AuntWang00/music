<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shangchuan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
