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
    
    <title>我的音乐</title>
    
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
  		</div>	
  	
    <div class="edit-contain">
  		<div class="mymusic-list">
			<div class="menu1">  
				   		<ul>  					
				  			<li class="active"><a class="fff1" href="song/song_showSong1">返回</a></li>
				  		</ul>
		  	</div>	
	    </div>
  		
  	<main class="container-fluid">
	    <div class="row">
		   <div class="col-md-12">
		      <s:form action="song/song_editSong?song.songid=songid&song.singer=singer" cssClass="form-horizontal" enctype="multipart/form-data">
		      <s:hidden name="song.songid" />
		      <s:hidden name="song.singer" />
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">编 辑 歌 曲 信 息</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">歌曲名</label>
			                <div class="col-md-8">
                              <input type="text" name="song.songname" class="form-control input-sm" 
                               value="<s:property value='song.songname'></s:property>" required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">价格</label>
			                <div class="col-md-8">
                              <input type="text" name="song.price" class="form-control input-sm"
                               value="<s:property value='song.price'></s:property>"  required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">专辑</label>
			                <div class="col-md-8">
                              <input type="text" name="song.album" class="form-control input-sm" 
                               value="<s:property value='song.album'></s:property>"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">语言</label>
			                <div class="col-md-8">
                              <input type="text" name="song.language" class="form-control input-sm" 
                               value="<s:property value='song.language'></s:property>"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">歌词</label>
			                <div class="col-md-8">
                              <textarea  name="song.lyrics" rows="10" class="form-control input-sm"><s:property value='song.lyrics'></s:property></textarea>
                            </div>
			           </div>
			           
			           <div class="form-group">
			                <label class="control-label col-md-3">封面图片</label>
			                <div class="col-md-4">
			                  <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">               
                                    <img src = "<%=basePath %><s:property value='song.filepath'/>" style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div class="fileupload-preview fileupload-exists thumbnail" 
                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div>
                                      <span class="btn btn-file btn-primary">
                                        <span class="fileupload-new">换张图片</span>  
                                         <span class="fileupload-exists">换张图片</span>
                                         <input type="file" name="songPhoto"/>
                                      </span>
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