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
    
    <title>编辑页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">

 	 <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		
		
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
  					<a href="song/song_showNewSong"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  				</h1>				
  			</div>
  			
  	<!--导航开始 -->
  	<div class="container2"> 
	  			<div class="menu">  
			   		<div class="nav">

  <ul>
 	<li><a class="f1" href="song/song_showNewSong">原创音乐馆</a>
    </li>
	<li><a class="f1" href="customer/customer_showCustomer">歌手</a>
    </li>
    <li><a class="f1" href="song/song_showSong1" class="add-order">我的音乐</a>
      <ul>
        <li><a href="song/song_showSong1">我上传的歌曲</a></li>
        <li><a href="order/order_showOrder?customer.name=<s:property value='#session.customer.name'/>">我购买的歌曲</a></li>
        <li><a href="song/song_showAdd?song.singer=<s:property value='#session.customer.name'/>">添加歌曲</a></li>
       </ul>
    </li>
    <li><a class="f1" href="about.jsp">关于买歌</a></li>

  </ul>

</div>
	  			</div>

	  <!-- 登录和注册按钮 -->
		  		<div class="header-login">
		  		<c:choose>
		       <c:when test="${customer.name ==null}"> 
		       <table class="top-table">  		   		
				   		<tr>
		  		   			<td>
		  		   				<a class="top-table-font1" href="reg.jsp">注册</a>
			  		   			<a class="top-table-font2" href="login.jsp">登录</a>
			  		   		</td>
			  		   	</tr>
	  		  		</table> 
				</c:when>
		       <c:otherwise>
		       <div class="top-login"> 		       	
		       	<a href="customer/customer_showEdit?customer.customerid=${customer.customerid}&customer.sex=${customer.sex}&customer.country=${customer.country}">
		       	<img src = "<%=basePath %>${customer.filepath}" style="width:30px; height:30px;"></a>	   
		  	    <c:out value="${customer.name}"></c:out>, 欢迎您!
			    <a href="logout.jsp">退出</a>	
			    </div>		   
		       </c:otherwise>
		       </c:choose>
	  		   		
	  		    </div> 
  		    </div> 			              
  		</div>	
  	</div>
  	<!-- 页面顶部结束 -->
  	<div class="add-contain">
  	<main class="container-fluid" >
	    <div class="row">
		   <div class="col-md-12">
		      <s:form action="customer/customer_edit?customer.customerid=customerid&customer.sex=sex&customer.country=country" cssClass="form-horizontal" enctype="multipart/form-data">
		      <s:hidden name="customer.customerid" />
		      <s:hidden name="customer.sex" />
		      <s:hidden name="customer.country" />
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">编 辑 用 户 信 息</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">昵称</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.name" class="form-control input-sm" 
                               value="<s:property value='customer.name'></s:property>" required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">真实姓名</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.realname" class="form-control input-sm"
                               value="<s:property value='customer.realname'></s:property>"  required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">生日</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.birthday" class="form-control input-sm" 
                               value="<s:property value='customer.birthday'></s:property>"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">联系方式</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.number" class="form-control input-sm" 
                               value="<s:property value='customer.number'></s:property>"  required>
                            </div>
			           </div>
			           
			           <div class="form-group">
			                <label class="control-label col-md-3">Bab</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.bab" class="form-control input-sm" 
                               value="<s:property value='customer.bab'></s:property>"  required>
                            </div>
			           </div>
			     
			     		<div class="form-group">
			                <label class="control-label col-md-3">密码</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.password" class="form-control input-sm" 
                               value="<s:property value='customer.password'></s:property>"  required>
                            </div>
			           </div>
			     
			           
			           <div class="form-group">
			                <label class="control-label col-md-3">头像</label>
			                <div class="col-md-4">
			                  <div class="fileupload fileupload-new" data-provides="fileupload">
                                  <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">               
                                    <img src = "<%=basePath %><s:property value='customer.filepath'/>" style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div class="fileupload-preview fileupload-exists thumbnail" 
                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
                                  </div>
                                  <div>
                                      <span class="btn btn-file btn-primary">
                                        <span class="fileupload-new">换张图片</span>  
                                         <span class="fileupload-exists">换张图片</span>
                                         <input type="file" name="custPhoto"/>
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