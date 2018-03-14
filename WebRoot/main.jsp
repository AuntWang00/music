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
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
  </head>
  
 <body>
  <header>
  		<div class="logo"></div>
  		<div class="account">
		    <c:choose>
		       <c:when test="${customer.name ==null}">
		         <a href="login.jsp">登录</a>
		         <a href="reg.jsp">注册</a>
		       </c:when>
		       <c:otherwise>
		         <c:out value="${customer.name}"></c:out>欢迎您!
		       </c:otherwise>
		    </c:choose>
		    </div>
		    
    </header>
    
    <main>
    <s:form action="song/song_querySongs" method="post">
      <label>歌曲名称：</label>
     
      <input class="search" type="text" name="keywords" placeholder="请输入歌曲名称">
      <s:submit value="查 询" cssClass="search-go"></s:submit>
      
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="..." alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="..." alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
      <table>
        <tr>  
          <th>序号</th>  
          <th>歌名</th>
          <th>单价</th> 
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
    </s:form>
    </main>
  </body>
</html>
