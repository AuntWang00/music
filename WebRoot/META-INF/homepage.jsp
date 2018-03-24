<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>歌曲展示页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
  </head>

  
  
  <body>
    <header>
    <div class="logo"></div>
        <div class="wrap">
            <ul class="fr">
         <c:choose>
	       <c:when test="${customer.name ==null}">
	        <li><span>您还未登录,</span><a href="login.jsp">马上登录</a><span>|</span></li>
                <li><a href="administrator。jsp"><span id="adm"></span>管理员通道</a><span>|</span></li>
                
	       </c:when>
	       <c:otherwise>
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
                <li><a href="administrator。jsp"><span id="adm"></span>管理员通道</a><span>|</span></li>
           
	       </c:otherwise>
	     </c:choose>
	     </ul>
		    
       </div>
       
      
		    
    </header>
    
     <main>
	   <s:form action="song/song_querySongs" method="post">
     <div>      <input class="search" type="text" name="keywords" placeholder="请输入歌曲名称">
      <s:submit value="查 询" cssClass="btn btn-default"></s:submit>
      </div>
      </s:form>
      <table class="table table-hover">
        <tr>  
          <th>序号</th>  
          <th>歌名</th>
          <th>单价</th> 
           <th></th>  
          <th></th>
          <th></th> 
        </tr> 
        <c:forEach var="song" items="${songslist}" varStatus="status">
          <tr>
            <td><c:out value="${status.index+1}"></c:out></td>
            <td><a href="song/song_showDetail?song.songid=${song.songid}">
            <c:out value="${song.songname}"></c:out></a></td>
            <td><c:out value="${song.price}"></c:out></td>
            <td><a href="song/song_showEdit?song.songid=${song.songid}">编辑</a></td>
            <td><a href="song/song_deleteSong?song.songid=${song.songid}">删除</a></td>
            <td><a href="order/order_addOrder?song.songid=${song.songid}&customer.name=${customer.name}">购买</a></td>
          </tr>
        </c:forEach>
      </table>
     
    </main>
  </body>
</html>
 
