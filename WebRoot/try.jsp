<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>歌曲展示页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/music.css">
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
    
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
 <body>
    <header>
       <div class="account">
         <c:choose>
	       <c:when test="${customer.name ==null}">
	         <a href="reg.jsp">注册</a>
	         <a href="login.jsp">登录</a>
	       </c:when>
	       <c:otherwise>
	         <c:out value="${customer.name}"></c:out>, 欢迎您!
	       </c:otherwise>
	     </c:choose>
	     <search>
      <s:form action="song/song_querySongs" method="post">  
      <form class="form-inline">
  <div class="form-group mx-sm-3 mb-2">
    <input type="text" class="search" name="keywords" placeholder="歌曲名称">
  <button type="submit" class="btn btn-primary mb-2">查询</button>
  </div>
</form>
</s:form>
    </search>
       </div>
       <div class="logo"></div>
      </header>
      <!-- 导航栏以及搜索框 -->
        <div id="top">
            
                <!-- 导航栏 -->
                <div id="nav" class="fl">
                    <ul class="nav">
                         <li>
                            <a href="homepage.jsp">首页</a>
                            <div>
                                <a href="#">首页</a><span>|</span>
                                <a href="#">排行榜</a><span>|</span>
                                <a href="#">歌单广场</a><span>|</span>
                                <a href="#">电台</a><span>|</span>
                                <a href="#">歌手</a><span>|</span>
                                <a href="#">专辑</a>
                            </div>
                        </li>
                        <li>
                            <a href="main1.jsp">原创音乐馆</a>
                            <div>
                                <a href="#">首页</a><span>|</span>
                                <a href="#">排行榜</a><span>|</span>
                                <a href="#">歌单广场</a><span>|</span>
                                <a href="#">电台</a><span>|</span>
                                <a href="#">歌手</a><span>|</span>
                                <a href="#">专辑</a>
                            </div>
                        </li>
                        <li>
                            <a href="mymusic.jsp">我的音乐</a>
                            <div>
                                <a href="#">主题</a><span>|</span>
                                <a href="#">歌单</a><span>|</span>
                                <a href="#">MV收藏</a><span>|</span>
                                <a href="#">听众</a><span>|</span>
                                <a href="#">收听</a>
                            </div>
                        </li>
                       
                    </ul>
                </div>
                <!-- 搜索 -->
                、
            </div>
    <main>  
  
      <table class="table">
        <tr>  
          <th>序号</th>  
          <th>歌名</th>
          <th>单价</th> 
          
        </tr> 
        <c:forEach var="song" items="${songslist}" varStatus="status">
          <tr>
           <td class="active"><c:out value="${status.index+1}"></c:out></td>
            <td class="success"><a href="song/song_showDetail?song.songid=${song.songid}">
            <c:out value="${song.songname}"></c:out></a></td>
           <td class="warning"><c:out value="${song.price}"></c:out></td>
            <td class="danger"><a href="song/song_showDetail?song.songid=${song.songid}">试听</a></td>
            
            <td class="info"><a href="order/order_addOrder?song.songid=${song.songid}&customer.name=${customer.name}">购买</a></td>
          </tr>
        </c:forEach>
      </table>
     
    </main>
  </body>
</html>