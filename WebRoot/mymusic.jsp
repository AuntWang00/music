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
    <li class="active"><a class="fff" href="song/song_showSong1" class="add-order">我的音乐</a>
      <ul>
        <li><a href="song/song_showSong1">我上传的歌曲</a></li>
        <li><a href="order/order_showOrder?customer.name=<s:property value='#session.customer.name'/>">我购买的歌曲</a></li>
        <li><a href="song/song_showAdd?song.singer=<s:property value='#session.customer.name'/>">添加歌曲</a></li>
       </ul>
    </li>
    <li><a class="f1" href="#">关于买歌</a></li>

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
		       	<img src = "<%=basePath %>${customer.filepath}" style="width:30px; height:30px;">	   
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
	
	<div class="mymusic-contain">
	       
	  <main class="container-fluid">
      <div class="row">
         <div class="col-md-12">
		   
		      <div class="panel panel-info">
		      		<div class="panel-heading">
	                    <h3 class="panel-title">我上传的歌曲</h3>
	                 </div>
	                 <s:form action="song/song_showSong1" method="post">
	                 <div class="panel-body panel-body-table" >
	                      <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                         <thead>
	                       
	                           <tr>
	                              	  <th>序号</th> 
	                              	  <th></th>
							          <th>歌曲名称</th>
							          <th>单价</th>
							          <th>专辑</th>	
							           <th>歌手</th> 
							           <th>相关操作 </th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                              <s:iterator value="songslist" var="song" status="status">
	                              		
	                              		<s:if test="#session.customer.name==#song.singer">
	                                  <tr>
	                                      <td><s:property value="#status.index+1"></s:property></td>
	                                      <td><img src = "<%=basePath %><s:property value='filepath'/>" style="width:100px;height:100px"></td>
	                                      <td><s:a href="song/song_showDetail?song.songid=%{songid}"><s:property value="#song.songname"></s:property></s:a></td>
	                                      <td><s:property value="#song.price"></s:property></td>
	                                      <td><s:property value="#song.album"></s:property></td>
	                                      <td><s:property value="#song.singer"></s:property></td>  
	                                       <td><a href="song/song_showEdit?song.songid=<s:property value='songid'/>&song.singer=<s:property value='singer'/>&song.bofangliang=<s:property value='bofangliang' />" class="edit">编辑   </a>
	                                      	  <a href="song/song_deleteSong?song.songid=<s:property value='songid'/>" class="delete">  删除</a>
	                                      </td>  
	                                  </tr>
	                                  </s:if>
	                              </s:iterator>
	                          </tbody>
	                        </table>
	                   </div>
	                   </s:form>
	            </div>
	               
		       
	       </div>
	   </div>
	</main>
	</div>
	<script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/dataTables.bootstrap.js"></script>
    <script >
       $(document).ready(function () {
           $('#dataTables-example').dataTable({
			   "language": {
                 "lengthMenu": "每页 _MENU_ 条记录",
                 "zeroRecords": "没有找到记录",
                 "info": "第 _PAGE_ 页 ( 共 _PAGES_ 页 )",
                 "infoEmpty": "无记录",
                 "infoFiltered": "(从 _MAX_ 条记录过滤)",
				 "sInfoPostFix": "",
				 "sSearch": "搜 索 : ",
				 "sUrl": "",
				 "sEmptyTable": "表中数据为空",
				 "sLoadingRecords": "载入中...",
				 "sInfoThousands": ",",
				 "oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上页",
					"sNext": "下页",
					"sLast": "末页"
				 },
				 "oAria": {
				 "sSortAscending": ": 以升序排列此列",
				 "sSortDescending": ": 以降序排列此列"
			     },
				 
             }
		   });
       });
    </script>
   	<!--  友情链接和footer -->
     <footer class="footer" role="footer">
   		<div class="footer-inner">
   			<div class="footer-info">
   			<p>不知道放什么就先空着吧</p>
   			</div>
   			<div class="footer-copyright">
   			<p>2018买歌原创音乐版权所有</p>
   			</div>
   		</div>
   	</footer>
  </body>
</html>