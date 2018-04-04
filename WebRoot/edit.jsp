<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>显示music详情</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
  </head>
  
  <body>
    <header>
       <div >
       		<h1 class="maige-title">
       			<a href="main.jsp"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  			</h1></div>
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
		    
       </div>
       
		    
    </header>

     <main class="container-fluid">
	    <div class="row">
		   <div class="col-md-10">
		      <s:form action="song/song_editSong" cssClass="form-horizontal" enctype="multipart/form-data">
		      <s:hidden name="song.songid"/>
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title"> <i class="fa fa-cutlery"></i> 编 辑 美 食 信 息</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">美食名称</label>
			                <div class="col-md-4">
                              <input type="text" name="song.songname" value="<s:property value='song.songname'/>" class="form-control input-sm" required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">美食单价</label>
			                <div class="col-md-2">
                              <input type="text" name="song.price" value="<s:property value='song.price'/>" class="form-control input-sm" placeholder="&yen;" required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">美食图片</label>
			                <div class="col-md-4">
			                  <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                    <img src="<%=basePath%><s:property value='song.filepath'/>" alt="" />
                                  </div>
                                  <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height:150px; line-height: 20px;">
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
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
	<script src="<%=basePath%>js/bootstrap-fileupload.js"></script>
  </body>
</html>
