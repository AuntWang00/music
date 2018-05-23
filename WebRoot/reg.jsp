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
    
    <title>注册页面</title>
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
  	</div>
  	<!-- 页面顶部结束 -->
  	
 <div class="reg-contain">
  		<main class="container-fluid">
	    <div class="row">
		   <div class="col-md-12">
		       <s:form action="customer/customer_reg" id="defaultForm" method="post" cssClass="form-horizontal"  enctype="multipart/form-data">
		       <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">注 册 账 户</h4>
		        
		         <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">用户名</label>
			                <div class="col-md-4">
                              <input type="text" name="customer.name"id="customername" onblur="checkName()" class="form-control input-sm" required="required">
                                 <span id="span1"></span>  
                           </div>
                           <s:fielderror fieldName="customer.name" cssClass="fielderror"/>
			           </div>  
			           <div class="form-group">
			                <label class="control-label col-md-3">输入密码</label>
			                <div class="col-md-4">
                              <input type="password" name="customer.password" class="form-control input-sm"  >
                            </div>
                             <s:fielderror fieldName="customer.password" cssClass="fielderror"/>
			           </div>
			          <!--    <div class="form-group">
			                <label class="control-label col-md-3">确认密码</label>
			                <div class="col-md-4">
                              <input type="password" name="customer.repassword" class="form-control input-sm" >
                            </div>
                            <s:fielderror fieldName="customer.repassword" cssClass="fielderror"/>
			           </div>
			           
				       <div class="form-group">
				                <label class="control-label col-md-3">用户头像</label>
				                
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
	                                   <span class="fileupload-exists">浏览</span><input type="file" name="custPhoto"/></span>
	                                   <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
	                                   <p>（图片大小请勿超过2M！）</p> 
	                                    
	                                </div>
	                              </div>
	                            </div>
				           </div>
-->
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
	
  		<script>
	function checkName(){  
    //alert("name");  
    var customername = document.getElementById("customername").value;  
    //传统的ajax校验  
    //1.创建异步交互对象，  
    var xhr = createXmlHttp();  
    //alert(xhr);  
    //2设置监听  
    xhr.onreadystatechange = function(){  
        if(xhr.readyState == 4){  
            if(xhr.status == 200){  
                document.getElementById("span1").innerHTML = xhr.responseText;  
            }  
        }  
    }  
    //alert("sb");
    //3打开连接//${pageContext.request.contextPath}
    xhr.open("GET","/music/customer/customer_findByName1.action?&customername="+customername,true);  
    //4发送 
    //alert("sb!"); 
    xhr.send(null);       
    }     
          
    //创建XmlHttp对象  
    function createXmlHttp(){  
        var xmlHttp;  
        try{  
            xmlHttp= new XMLHttpRequest();  
        }catch(e){  
            try{  
                xmlHttp=new ActiveXObject("Msxm12.XMLHTTP");  
            }catch(e){  
                try{  
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                }catch(e){}  
            }             
        }  
          
         return xmlHttp;      
    }  
</script>
  </body>
</html>