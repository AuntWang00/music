<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
    <link rel="stylesheet" href="<%=basePath %>css/reg.css">
	

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
    <div class="modal show" id="loginModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close">&times;</button>
                    <h1 class="text-center text-primary">注册</h1>
                </div>
                <div class="modal-body">
                    <form class="form col-md-12 center-block" id="defaultForm" action="customer/customer_reg" method="post" cssClass="form-horizontal"  enctype="multipart/form-data">                    
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">账号</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.name" id="customername" onblur="checkName()"  placeholder="账号" class="form-control input-sm" required="required">
                               <span id="span1"></span>                            
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="pwdDiv">
                            <label class="sr-only" for="inputPassword">密码</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>                              
                                <input type="password" name="customer.password" class="form-control input-sm" placeholder="密码"  required>                               
                                <s:fielderror fieldName="customer.password" cssClass="fielderror"/>
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg" id="pwdDiv">
                            <label class="sr-only" for="inputPassword">确认密码</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-exclamation-sign"></span></div>                              
                                <input type="password" name="customer.repassword" class="form-control input-sm" placeholder="确认密码" >
                                <s:fielderror fieldName="customer.repassword" cssClass="fielderror"/>                             
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">真实姓名</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-check" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.realname" id="customerrealname" onblur="checkName()"  placeholder="真实姓名" class="form-control input-sm" required="required"> 
                                <s:fielderror fieldName="customer.realname" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">性别</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.sex" id="customersex" onblur="checkName()"  placeholder="性别" class="form-control input-sm" required="required"> 
                                <s:fielderror fieldName="customer.sex" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">国籍</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-link" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.country" id="customercountry" onblur="checkName()"  placeholder="国籍" class="form-control input-sm" required="required"> 
                                <s:fielderror fieldName="customer.country" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        <br>
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">出生日期</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.birthday" id="customerbirthday" onblur="checkName()"  placeholder="出生日期" class="form-control input-sm" required="required"> 
                                <s:fielderror fieldName="customer.birthday" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        <br>
                   <!--       <div class="form-group">
				                <label class="control-label col-md-3">上传头像</label>
				                
				                <div class="col-md-4">
	                              <div class="fileupload fileupload-new" data-provides="fileupload">
	                                <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
	                                   <img src="<%=basePath%>upload/demoUpload.jpg" alt="" />
	                                  
	                                </div>
	                                <div class="fileupload-preview fileupload-exists thumbnail" 
	                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
	                                </div>
	                                <div>
	                                   
	                                   <span class="fileupload-exists">浏览</span><input type="file" name="custPhoto"/></span>
	                                   <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>
	                                   <p>（图片大小请勿超过2M！）</p>  
	                                </div>
	                              </div>
	                            </div>
				           </div>
                        
                        -->
                        <div class="form-group-lg"  id="accountDiv">
                            <label class="sr-only" for="inputAccount">头像</label>
                            <div class="input-group">
                                <div class="customerfilepath">                              
                                   
                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                <div class="fileupload-preview fileupload-exists thumbnail" 
	                                   style="max-width: 200px; max-height:150px; line-height: 20px;">
	                                </div>
                                <span class="fileupload-exists"></span><input type="file" name="custPhoto" /></span>
	                                   <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">取消</a>                  
	                                   </div>     
                            </div>
                            </div>
                        </div> 
                        
                        <div class="checkbox">
              <label> </label>
            </div>
                        
                        <div class="form-group">
                        <button class="btn btn-success col-md-6" type="submit"><a>注册</a></button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->
 <script src="<%=basePath %>js/jquery-1.8.3.min.js"></script>
    <script src="<%=basePath %>js/bootstrap.js"></script>
    <script src="<%=basePath %>js/login.js"></script>
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