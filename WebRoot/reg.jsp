<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>css/main.css">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	
 <link href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		
		
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>	
			
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	
  </head>
  
  <body>
  <!-- 页面顶部开始 （包括logo）-->
  	<div class="top">
  		<div class="top-container">
  			<div class="header-logo">
  				<h1 class="maige-title">
  					<a href="song/song_showNewSong"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  				</h1>				
  			</div>
  		</div>
    </div>	
    <!--使用模态框的方式模拟一个登陆框-->
   	<div class="add-contain">
  	<main class="container-fluid" >
	    <div class="row">
		   <div class="col-md-12">
		      <s:form action="customer/customer_reg" cssClass="form-horizontal" enctype="multipart/form-data">
		     
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">用 户 注 册</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">昵称</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.name" class="form-control input-sm" 
                               value="昵称" required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">密码</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.password" class="form-control input-sm" 
                               value="密码"  required>
                            </div>
			           </div>
			     
			           <div class="form-group">
                             <label class="control-label col-md-3">性别</label>
                            <div class="input-group">
                            <input type="radio" name="customer.sex" value="1" <c:if test="${param.customer.sex== '男'}">checked="checked"</c:if>/>男
    						<input type="radio" name="customer.sex" value="2" <c:if test="${param.customer.sex== '女'}">checked="checked"</c:if>/>女
    						<input type="radio" name="customer.sex" value="3" <c:if test="${param.customer.sex== '组合'}">checked="checked"</c:if>/>组合	                           
                             <s:fielderror fieldName="customer.sex" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        
                        <div class="form-group">
                             <label class="control-label col-md-3">地区</label>
                            <div class="input-group">
                            <input type="radio" name="customer.country" value="1" <c:if test="${param.customer.country== '内地'}">checked="checked"</c:if>/>内地
    						<input type="radio" name="customer.country" value="2" <c:if test="${param.customer.country== '港台'}">checked="checked"</c:if>/>港台
    						<input type="radio" name="customer.country" value="3" <c:if test="${param.customer.country== '欧美'}">checked="checked"</c:if>/>欧美	 
    						<input type="radio" name="customer.country" value="4" <c:if test="${param.customer.country== '日韩'}">checked="checked"</c:if>/>日韩
    						<input type="radio" name="customer.country" value="5" <c:if test="${param.customer.country== '其他'}">checked="checked"</c:if>/>其他	                           
                             <s:fielderror fieldName="customer.country" cssClass="fielderror"/>                       
                            </div>
                        </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">真实姓名</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.realname" class="form-control input-sm"
                               value="真实姓名"  required>
                           </div>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">生日</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.birthday" class="form-control input-sm" 
                               value="2000.1.1"  required>
                            </div>
			           </div>
			           <div class="form-group">
			                <label class="control-label col-md-3">联系方式</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.number" class="form-control input-sm" 
                               value="123456"  required>
                            </div>
			           </div>
			           
			           <div class="form-group">
			                <label class="control-label col-md-3">Bab</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.bab" class="form-control input-sm" 
                               value="bab"  required>
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