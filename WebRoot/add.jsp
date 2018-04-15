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
    
    <title>上传歌曲主页</title>
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
			  			<li><a class="fff" href="main.jsp">原创音乐馆</a></li>
			  			<li><a class="f1" href="query.jsp">MV</a></li>
			  			<li  class="active"><a class="f1" href="#">我的音乐</a></li>
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
	
	<div class="add-contain">
  		<main class="container-fluid">
	    <div class="row">
		   <div class="col-md-12">
		      <s:form action="song/song_addSong?song.singer=customerid" cssClass="form-horizontal" enctype="multipart/form-data">
		      <s:hidden name="song.singer" />
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">添 加 歌 曲</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">歌曲名</label>
			                <div class="col-md-8">
                              <input type="text" name="song.songname" class="form-control input-sm" 
                               value="尚未填写歌曲名称" required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">单价</label>
			                <div class="col-md-8">
                              <input type="text" name="song.price" class="form-control input-sm"
                               value="0"  required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">所属专辑</label>
			                <div class="col-md-8">
                              <input type="text" name="song.album" class="form-control input-sm" 
                               value="暂无所属专辑"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">语言</label>
			                <div class="col-md-8">
                              <input type="text" name="song.language" class="form-control input-sm" 
                               value="未知"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">歌词</label>
			                <div class="col-md-8">
                              <input type="text" name="song.lyrics" class="form-control input-sm"
                               value="暂无歌词"  required>
                            </div>
			           </div>
			           
				       <div class="form-group">
				                <label class="control-label col-md-3">封面图片</label>
				                <div class="col-md-4">
	                              <div class="fileupload fileupload-new" data-provides="fileupload">
	                                <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
	                                   <img src="<%=basePath%>upload/demoUpload.jpg" alt="" />
	                                </div>
	                                <div class="fileupload-preview fileupload-exists thumbnail" 
	                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
	                                </div>
	                                <div>
	                                   <span class="btn btn-file btn-primary"><span class="fileupload-new">浏览</span>
	                                   <span class="fileupload-exists">浏览</span><input type="file" name="songPhoto"/></span>
	                                   <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
	                                </div>
	                              </div>
	                            </div>
				           </div>

			           <div class="form-group col-md-3">
				          <button type="submit" class="btn btn-success pull-right">提  交 </button>
				       </div>
				   </div>
				</div>
		    </s:form>
		  </div>
	   </div>
	</main>
	</div>
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-fileupload.js"></script>
  	
  	
  </body>
</html>
