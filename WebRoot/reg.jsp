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
    <link rel="stylesheet" href="<%=basePath %>css/reg.css">
    <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	

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
                                <input type="password" name="customer.number" class="form-control input-sm" placeholder="确认密码" >
                                <s:fielderror fieldName="customer.number" cssClass="fielderror"/>                             
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
                            <label class="sr-only" for="inputAccount">出生日期</label>
                            <div class="input-group">
                                <div class="input-group-addon"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span></div>                              
                                <input type="text" name="customer.birthday" id="customerbirthday" onblur="checkName()"  placeholder="出生日期" class="form-control input-sm" required="required"> 
                                <s:fielderror fieldName="customer.birthday" cssClass="fielderror"/>                       
                            </div>
                        </div>
                           <div class="form-group">
                             <label class="control-label col-md-3">首字母:<s:property value='customer.shouzimu'></s:property></label>
                            <div class="input-group">
                        
                            <input type="radio" name="customer.shouzimu" value="A" <c:if test="${param.customer.shouzimu== 'A'}">checked="checked"</c:if>/>A
    						<input type="radio" name="customer.shouzimu" value="B" <c:if test="${param.customer.shouzimu== 'B'}">checked="checked"</c:if>/>B
    						<input type="radio" name="customer.shouzimu" value="C" <c:if test="${param.customer.shouzimu== 'C'}">checked="checked"</c:if>/>C	 
    						<input type="radio" name="customer.shouzimu" value="D" <c:if test="${param.customer.shouzimu== 'D'}">checked="checked"</c:if>/>D
    						<input type="radio" name="customer.shouzimu" value="E" <c:if test="${param.customer.shouzimu== 'E'}">checked="checked"</c:if>/>E
    						<input type="radio" name="customer.shouzimu" value="F" <c:if test="${param.customer.shouzimu== 'F'}">checked="checked"</c:if>/>F
    						<input type="radio" name="customer.shouzimu" value="G" <c:if test="${param.customer.shouzimu== 'G'}">checked="checked"</c:if>/>G
    						<input type="radio" name="customer.shouzimu" value="H" <c:if test="${param.customer.shouzimu== 'H'}">checked="checked"</c:if>/>H	 
    						<input type="radio" name="customer.shouzimu" value="I" <c:if test="${param.customer.shouzimu== 'I'}">checked="checked"</c:if>/>I
    						<input type="radio" name="customer.shouzimu" value="J" <c:if test="${param.customer.shouzimu== 'J'}">checked="checked"</c:if>/>J	    
    						<input type="radio" name="customer.shouzimu" value="K" <c:if test="${param.customer.shouzimu== 'K'}">checked="checked"</c:if>/>K
    						<input type="radio" name="customer.shouzimu" value="L" <c:if test="${param.customer.shouzimu== 'L'}">checked="checked"</c:if>/>L
    						<input type="radio" name="customer.shouzimu" value="M" <c:if test="${param.customer.shouzimu== 'M'}">checked="checked"</c:if>/>M	 
    						<input type="radio" name="customer.shouzimu" value="N" <c:if test="${param.customer.shouzimu== 'N'}">checked="checked"</c:if>/>N
    						<input type="radio" name="customer.shouzimu" value="O" <c:if test="${param.customer.shouzimu== 'O'}">checked="checked"</c:if>/>O
    						<input type="radio" name="customer.shouzimu" value="P" <c:if test="${param.customer.shouzimu== 'P'}">checked="checked"</c:if>/>P
    						<input type="radio" name="customer.shouzimu" value="Q" <c:if test="${param.customer.shouzimu== 'Q'}">checked="checked"</c:if>/>Q
    						<input type="radio" name="customer.shouzimu" value="R" <c:if test="${param.customer.shouzimu== 'R'}">checked="checked"</c:if>/>R	 
    						<input type="radio" name="customer.shouzimu" value="S" <c:if test="${param.customer.shouzimu== 'S'}">checked="checked"</c:if>/>S
    						<input type="radio" name="customer.shouzimu" value="T" <c:if test="${param.customer.shouzimu== 'T'}">checked="checked"</c:if>/>T	
    						<input type="radio" name="customer.shouzimu" value="U" <c:if test="${param.customer.shouzimu== 'U'}">checked="checked"</c:if>/>U
    						<input type="radio" name="customer.shouzimu" value="V" <c:if test="${param.customer.shouzimu== 'V'}">checked="checked"</c:if>/>V
    						<input type="radio" name="customer.shouzimu" value="W" <c:if test="${param.customer.shouzimu== 'W'}">checked="checked"</c:if>/>W	 
    						<input type="radio" name="customer.shouzimu" value="X" <c:if test="${param.customer.shouzimu== 'X'}">checked="checked"</c:if>/>X
    						<input type="radio" name="customer.shouzimu" value="Y" <c:if test="${param.customer.shouzimu== 'Y'}">checked="checked"</c:if>/>Y
    						<input type="radio" name="customer.shouzimu" value="Z" <c:if test="${param.customer.shouzimu== 'Z'}">checked="checked"</c:if>/>Z
    						<input type="radio" name="customer.shouzimu" value="ZZ" <c:if test="${param.customer.shouzimu== 'ZZ'}">checked="checked"</c:if>/>其他	        	    
    					                           
                             <s:fielderror fieldName="customer.shouzimu" cssClass="fielderror"/>                       
                            </div>
                        </div>
                        
                         <div class="form-group">
                             <label class="control-label col-md-3">性别:<s:property value='customer.sex'></s:property></label>
                            <div class="input-group">
                           <s:hidden name="customer.sex" />
                            <input type="radio" name="customer.sex" value="1" <c:if test="${param.customer.sex== '1'}">checked="checked"</c:if>/>男
    						<input type="radio" name="customer.sex" value="2" <c:if test="${param.customer.sex== '2'}">checked="checked"</c:if>/>女
    						<input type="radio" name="customer.sex" value="3" <c:if test="${param.customer.sex== '3'}">checked="checked"</c:if>/>组合	 
    						
                             <s:fielderror fieldName="customer.sex" cssClass="fielderror"/>                       
                            </div>
                        </div> 
                          
                         <div class="form-group">
                             <label class="control-label col-md-3">地区:<s:property value='customer.country'></s:property></label>
                            <div class="input-group">
                           <s:hidden name="customer.country" />
                            <input type="radio" name="customer.country" value="1" <c:if test="${param.customer.sex== '1'}">checked="checked"</c:if>/>中国内地
    						<input type="radio" name="customer.country" value="2" <c:if test="${param.customer.sex== '2'}">checked="checked"</c:if>/>中国港澳台
    						<input type="radio" name="customer.country" value="3" <c:if test="${param.customer.sex== '3'}">checked="checked"</c:if>/>日韩
    						 <input type="radio" name="customer.country" value="4" <c:if test="${param.customer.sex== '4'}">checked="checked"</c:if>/>欧美
    						<input type="radio" name="customer.country" value="5" <c:if test="${param.customer.sex== '5'}">checked="checked"</c:if>/>其他
    					
    						
                             <s:fielderror fieldName="customer.sex" cssClass="fielderror"/>                       
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