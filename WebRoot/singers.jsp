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
	<link rel="stylesheet" type="text/css" href="css/singers.css">
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">	
	<link rel="stylesheet" href="css/shutter.css">
	
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
	<li  class="active"><a class="fff" href="customer/customer_showCustomer">歌手</a>
    </li>
    <li><a class="f1" href="song/song_showSong1" class="add-order">我的音乐</a>
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
  	<!-- 页面顶部结束 -->
  	
  	
	
	<!-- 歌手列表开始 -->
   <div class="singer-contain">
   	<div class="singer-contain1">
   	 <div class="shutter">
		<div class="shutter-img">
		  <a href="#" data-shutter-title="Iron Man"><img src="images/Taylor1.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Super Man"><img src="images/Taylor2.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Iron Man"><img src="images/wuyuetian.jpg" alt="#"></a>
		  <a href="#" data-shutter-title="Super Man"><img src="images/zhangxueyou.jpg" alt="#"></a>
		  
		</div>
		<ul class="shutter-btn">
		  <li class="prev"></li>
		  <li class="next"></li>
		</ul>
		<div class="shutter-desc">
		  <p>Iron Man</p>
		</div>
		
		<script src="js/jquery.min.js"></script>
		<script src="js/velocity.js"></script>
		<script src="js/shutter.js"></script>
		<script>
		$(function () {
		  $('.shutter').shutter({
			shutterW: 800, // 容器宽度
			shutterH: 350, // 容器高度
			isAutoPlay: true, // 是否自动播放
			playInterval: 3000, // 自动播放时间
			curDisplay: 3, // 当前显示页
			fullPage: false // 是否全屏展示
		  });
		});
		</script>
		</div>
		<!-- 条件筛选 -->
		<div class="singer-filter">
			<section class="aui-screen-box" >
            <div class="aui-screen-content" >
                <div class="aui-choice-screen">
                  <form action="/message_sortMessage" method="post">
                   
                    <div id="aui-selectList" class="aui-screen-list-box">
                        <dl class="aui-screen-list-item" attr="terminal_brand_s">
                            <dt>首字母</dt>
                            <dd>
                                <a href="javascript:void(0)" values2="" values1="" attrval="A"><input type="checkbox" name="box2" value="0">A</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="B"><input type="checkbox" name="box2" value="1">B</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="C"><input type="checkbox" name="box2" value="2">C</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="D"><input type="checkbox" name="box2" value="3">D</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="E"><input type="checkbox" name="box2" value="4">E</a>
                             
                            </dd>
                        </dl>
                        <dl class="aui-screen-list-item" attr="">
                            <dt>性别</dt>
                            <dd>
                                <a href="javascript:void(0)" values2="" values1="" attrval="男">男</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="女">女</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="组合">组合</a>
                               
                                <label class="aui-sr-input">
                                    <input name="minsalary" type="text" placeholder="min">
                                    -
		                            <input name="maxsalary" type="text" placeholder="max">
                                    <button >确认</button>
                                </label>
                            </dd>
                        </dl>
                        <dl class="aui-screen-list-item aui-aui-screen-list-item" attr="aui-terminal">
                            <dt>国籍</dt>
                            <dd>
                          
                                <ul class="aui-list-pz-size">
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="内地"><input type="checkbox" name="box" value="内地">内地</a>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="港台"><input type="checkbox" name="box" value="港台">港台</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="欧美"><input type="checkbox" name="box" value="欧美">欧美</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="日韩"><input type="checkbox" name="box" value="日韩">日韩</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                           <a href="javascript:void(0)" values2="" values1="" attrval="其他"><input type="checkbox" name="box" value="其他">其他</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <input type="submit" value="筛选" class="btn">
                                        </label>
                                    </li>
                                </ul>
                 
                            </dd>
                        </dl>
                    </div>
                    </form>
                </div>
            </div>
        </section>
				
		
		</div>
		
		
		</div>
		
		
	   		<!-- 歌手列表 -->
	   		<s:form action="customer/customer_queryCustomers" method="post" >
	   		
	   		<s:iterator value = "customerList" status="status" begin="0" end="9"> 
		   		<ul class = "singer-list">
		   			<li class="singer-item">
		   				<div class="singer-box">
   					
		   					<img  class="singer-pic" src = "<%=basePath %><s:property value='filepath'/>" >		   			
		   				<div class="singer-info">
		   				
		   				<s:a href="customer/customer_showDetail?customer.customerid=%{customerid}"><s:property value ="name"/></s:a>		   				
		   				</div>
		   				</div>
		   			</li>
		   		</ul>
		   		
	   		</s:iterator>
	   		
	   		</s:form>
	   		
	   		<!-- 歌手列表 -->
	   		<s:form action="customer/customer_queryCustomers" method="post" >
	   		
	   		<s:iterator value = "customerList" status="status" begin="10" > 
		   		<ul class = "singer-list2">
		   			<li class="singer-item2">
		   			
		   				<div class="singer-box2">  							   						   			
		   				<div class="singer-info2">		   				
		   				<s:a href="customer/customer_showDetail?customer.customerid=%{customerid}"><s:property value ="name"/></s:a>		   				
		   				</div>
		   				</div>
		   		
		   			</li>
		   		</ul>
	   		</s:iterator>
	   		
	   		</s:form>
	   		
   		
   	</div>
   	<!-- 最新单曲结束 -->
   	
   
   
   	
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
   


	
	
	<script>
	function select(){
	  document.getElementById('light').style.display='none';
	  document.getElementById('fade').style.display='none';
	}
	</script>
	 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!--icheck的js文件-->


	<script type="text/javascript">
	        var dlNum = $("#aui-selectList").find("dl");
	        for (i = 0; i < dlNum.length; i++) {
	            $(".aui-screen-head-choice .aui-clear-list").append("<div class=\"aui-selected-info selectedShow\" style=\"display:none\"><span></span><label></label><em></em></div>");
	        }
	        var refresh = "true";
	        $(".aui-screen-list-item a ").live("click", function() {
	            var text = $(this).text();
	            var selectedShow = $(".selectedShow");
	            var textTypeIndex = $(this).parents("dl").index();
	            var textType = $(this).parent("dd").siblings("dt").text();
	            index = textTypeIndex - (2);
	            $(".aui-clear-delete").show();
	            $(".selectedShow").eq(index).show();
	            $(this).addClass("selected").siblings().removeClass("selected");
	            selectedShow.eq(index).find("span").text(textType);
	            selectedShow.eq(index).find("label").text(text);
	            var show = $(".selectedShow").length - $(".selectedShow:hidden").length;
	            if (show > 1) {
	                $(".aui-eliminate").show();
	            }

	        });
	        $(".selectedShow em").live("click", function() {
	            $(this).parents(".selectedShow").hide();
	            var textTypeIndex = $(this).parents(".selectedShow").index();
	            index = textTypeIndex;
	            $(".aui-screen-list-item").eq(index).find("a").removeClass("selected");

	            if ($(".aui-screen-list-item .selected").length < 2) {
	                $(".aui-eliminate").hide();
	            }
	        });

	        $(".aui-eliminate").live("click", function() {
	            $(".selectedShow").hide();
	            $(this).hide();
	            $(".aui-screen-list-item a ").removeClass("selected");
	        });
        </script>
	
  </body>
</html>