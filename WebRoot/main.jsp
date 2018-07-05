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
    
    <title>歌曲展示页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	<link rel="stylesheet" href="css/jquery.skidder.css">
	
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
					 	<li class="active"><a class="fff" href="song/song_showNewSong">原创音乐馆</a>
					    </li>
						<li><a class="f1" href="customer/customer_showCustomer">歌手</a>
					    </li>
					    <li><a class="f1" class="add-order">我的音乐</a>
					      <ul>
					        <li><a href="song/song_showSong1">我上传的歌曲</a></li>
					        <li><a href="order/order_showOrder?customer.name=<s:property value='#session.customer.name'/>">我购买的歌曲</a></li>
					        <li><a href="song/song_showAdd?song.singer=<s:property value='#session.customer.name'/>">添加歌曲</a></li>
					       </ul>
					    </li>
					    <li ><a class="f1" href="about.jsp">关于买歌</a></li>							
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
  	
  	<!-- 搜索框语句开始 -->
  	<s:form action="customer/customer_queryCustomers" method="post">
  	<div class="container1-1">
	  	<div class="input-group col-md-3" style="margin-top:0px positon:relative">  
	       <input type="text" class="form-control search clearable" placeholder="请输入歌曲名或歌手名" title="关键词" name="keyWords" />  
	       <span class="input-group-btn">  
	           <button class="btn btn-info btn-search" type="submit"><i class="fa fa-search"></i></button>             
	        </span>  
	 	</div>  
  	</div>
  	</s:form>
	<!-- 搜索框语句结束 -->
	
	<!-- 最新单曲开始 -->
   <div class="con5">
   		<div class="container5">
	   		<div class="show-title">
	   				<h3>最新单曲</h3>			
	   		</div>
	   		
	   		<div class="show-songs">
		   		<div class="allsong">
		   			<a href="song/song_showSong2">查看所有歌曲</a>
		   		</div> 
	   		</div>  	
	   		<!-- 单曲列表 -->
	   		<s:form action="song/song_showNewSong" method="post">
	   		
	   		<s:iterator value = "songslist" status="status" begin="0" end="4"> 
		   		<ul class = "show-list">
		   			<li class="show-item">
		   				<div class="show-pic">		   					
		   					<img src = "<%=basePath %><s:property value='filepath'/>" style="width:236.5px; height:237px;">
		   				</div>
		   				<div class="show-info">
		   					<s:a href="song/song_showDetail?song.songid=%{songid}"><s:property value ="songname"/></s:a>
		   					<br><s:property value ="singer"/>
		   				</div>
		   			</li>
		   		</ul>
	   		</s:iterator>
	   		
	   		</s:form>
	   		
   		</div>
   	</div>
   	<!-- 最新单曲结束 -->
   	
   	<!-- 最热单曲开始 -->
   	<div class="container3">
   		<div class="con3">
	   		<div class="show-title">
	   				<h3>最热单曲</h3>   				
	   		</div>
	   		
	   	<!-- jQuery轮播开始 -->
   			<div class="demo-wrapper">
   			
   				<s:form action="song/song_showNewSong" method="post" begin="5" end="17">
   				<ul class="portfolio-items">
   					<s:iterator value = "songslist" status="status">		
   							<li class="item">
   								<figure>
   									<div class="view">
   										<img src = "<%=basePath %><s:property value='filepath'/>">
   									</div>
   									 <figcaption>
   										<p><span><s:a href="song/song_showDetail?song.songid=%{songid}"><s:property value ="songname"/></s:a></span></p>
   									    <p><span>播放量：<s:property value ="bofangliang"/></span></p>
   									 </figcaption> 
   								</figure>
   							</li>  						
   					</s:iterator>
   					</ul>
   				</s:form>  
   								
		  </div>

			<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
			<script src="js/modernizr-1.5.min.js"></script> 
			<script src="js/jquery.mousewheel.js"></script> 
			<script src="js/scripts.js"></script>
			   			
   		</div>
   </div>
   
   <!--专辑首发开始  -->
   <div class="container4">
   		<div class="con4">
   			<div class="show-title">
	   				<h3>专辑首发</h3>   				
	   		</div>
   			<!-- 辣鸡轮播 -->
	   		<div class="slideshow" style="height:500px; margin-top:15px;overflow: hidden">
	<div class="slide"><img src="images/album5.jpg"></div>
	  <div class="slide"><img src="images/album3.jpg"></div>
	  <div class="slide"><img src="images/album1.jpg"></div>
	  <div class="slide"><img src="images/album2.jpg"></div>
	  <div class="slide"><img src="images/album4.jpg"></div>
</div>


<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/imagesloaded.js"></script>
<script src="js/smartresize.js"></script>
<script src="js/jquery.skidder.js"></script>
<script type="text/javascript">
	$('.slideshow').each( function() {
		  var $slideshow = $(this);
		  $slideshow.imagesLoaded( function() {
			$slideshow.skidder({
			  slideClass    : '.slide',
			  animationType : 'css',
			  scaleSlides   : true,
			  maxWidth : 1300,
			  maxHeight: 500,
			  paging        : true,
			  autoPaging    : true,
			  pagingWrapper : ".skidder-pager",
			  pagingElement : ".skidder-pager-dot",
			  swiping       : true,
			  leftaligned   : false,
			  cycle         : true,
			  jumpback      : false,
			  speed         : 400,
			  autoplay      : false,
			  autoplayResume: false,
			  interval      : 4000,
			  transition    : "slide",
			  afterSliding  : function() {},
			  afterInit     : function() {}
			});
		  });
	});
	// $('.slideshow-nocycle').each( function() {
	//   var $slideshow = $(this);
	//   $slideshow.imagesLoaded( function() {
	//     $slideshow.skidder({
	//       slideClass    : '.slide',
	//       scaleSlides   : true,
	//       maxWidth : 1300,
	//       maxHeight: 500,
	//       leftaligned   : true,
	//       cycle         : false,
	//       paging        : true,
	//       swiping       : true,
	//       jumpback      : false,
	//       speed         : 400,
	//       autoplay      : false,
	//       interval      : 4000,
	//       afterSliding  : function() {}
	//     });
	//   });
	// });
	$(window).smartresize(function(){
		  $('.slideshow').skidder('resize');
	});
</script>
	   		</div>
	</div>
   
   	
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