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
		       	<a href="customer/customer_showEdit?customer.customerid=${session.customer.customerid}">
		       	<img src = "<%=basePath %>${session.customer.filepath}" style="width:30px; height:30px;"></a>	   
		  	    <c:out value="${session.customer.name}"></c:out>, 欢迎您!
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
		      
		      <div class="panel panel-success">
			       <div class="panel-heading">
		               <h4 class="panel-title">编 辑 用 户 信 息</h4>
		           </div>
		           <div class="panel-body">
				       <div class="form-group">
			                <label class="control-label col-md-3">歌手名</label>
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
                             <label class="control-label col-md-3">地区:<s:property value='customer.country'></s:property></label>
                            <div class="input-group">
                           
                            <input type="radio" name="customer.country" value="1" <c:if test="${param.customer.sex== '1'}">checked="checked"</c:if>/>中国内地
    						<input type="radio" name="customer.country" value="2" <c:if test="${param.customer.sex== '2'}">checked="checked"</c:if>/>中国港澳台
    						<input type="radio" name="customer.country" value="3" <c:if test="${param.customer.sex== '3'}">checked="checked"</c:if>/>日韩
    						 <input type="radio" name="customer.country" value="4" <c:if test="${param.customer.sex== '4'}">checked="checked"</c:if>/>欧美
    						<input type="radio" name="customer.country" value="5" <c:if test="${param.customer.sex== '5'}">checked="checked"</c:if>/>其他
    					
    						
                             <s:fielderror fieldName="customer.sex" cssClass="fielderror"/>                       
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
			                <label class="control-label col-md-3">个人简介</label>
			                <div class="col-md-8">
                              <input type="text" name="customer.intro" class="form-control input-sm" 
                               value="<s:property value='customer.intro'></s:property>"  required>
                            </div>
			           </div>
			     
			           
			           <div class="form-group">
			                <label class="control-label col-md-3">头像</label>
			                <s:hidden name="customer.filepath" />
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
                                         <input type="file" name="custPhoto" />
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