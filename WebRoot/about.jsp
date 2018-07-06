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
    
    <title>关于我们</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">		
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
					    <li><a class="f1" class="add-order">我的音乐</a>
					      <ul>
					        <li><a href="song/song_showSong1">我上传的歌曲</a></li>
					        <li><a href="order/order_showOrder?customer.name=<s:property value='#session.customer.name'/>">我购买的歌曲</a></li>
					        <li><a href="song/song_showAdd?song.singer=<s:property value='#session.customer.name'/>">添加歌曲</a></li>
					       </ul>
					    </li>
					    <li class="active"><a class="fff" href="about.jsp">关于买歌</a></li>					
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
  	
	
	<div class="about-contain">
			致力于用技术与创新力为原创音乐人带来全新视角，我们以“轻松买，随心听”为主旨理念，立志在原创音乐人与音乐喜爱者之间成为领先的系统，以创新意识重新定义了“原创音乐”的创新内涵。<br>
			<br/>
			<br/>
			一年间，通过不断革新技术和系统，我们正在努力尝试开启一种“原创音乐交易一体”听歌新时代。<br>
			<br/><br/>
			从开始至今，一直坚守“尽力、求真”的精神。始终践行全新的文化和价值观，努力将卓尔不群的理念贯穿到每一个细节，展现原创音乐市场的无限可能。<br>
			<br/><br/>
			
			
			“我常常在想，皇帝穿着所谓最美的新衣游街，却只有孩子敢指出真相。而现在的社会有那么多的问题，却连敢大声指责的孩子都没有了。几十年间，我国的经济发展取得了显著成就，然而我们却鲜有能够打动世界的文学及艺术作品，缺少文化价值观的输出，只能对舶来文化趋之若鹜。
			<br/>
			<br/>
			而面对音乐市场的抄袭、侵犯版权等频频出现的现象，导致许多优秀的音乐人对于市场望而却步，令我们这群音乐爱好者痛心疾首。我们团队就是个敢于说真话的孩子。这里由一群从不妥协、极富洞见、坚持梦想的人聚合而成。我们坚信实干而非投机，坚信梦想而非功利。我们坚决践行全新的文化价值观和思维方法论，从组建之初至今从未改变。
			<br/>
			<br/>
			事实上，没有不需要埋头苦干就能获得的成功，没有只靠夸夸其谈就能创造的财富。追求进步，需要无数苦思冥想的深夜，需要面对失败不气馁的执着，更需要敢于大声说出真相的勇气。
			<br/>
			<br/>
			一年里，我们创造了这个买歌平台。我们的经历证明，一群初出茅庐的年轻人不去曲意逢迎、不去投机取巧，只要踏实做事，同样能够取得成功。我们相信，那些回归常识、尊重奋斗的人，终将洞见时代机遇，并最终改变世界。
			<br/>
			<br/>
			原创音乐平台是一个音乐爱好者的乌托邦，我们搭建了一个尊重梦想的舞台，构建了纯粹的音乐交流环境。
			<br/>
			<br/>
			如果你志存高远、怀揣梦想，决心踏实做事、创造价值，却在扭曲的现实中自我怀疑、彷徨无奈，那就加入我们吧！ 在这里，与更多真知灼见者碰撞，与更多志同道合者同行！
			<br/>
			<br/>
			创新，无所不能！”
			<br/>
			<br/>
			<p >—— 买歌小组</p>
			<br/><br/><br/><br/>
			线上商务合作:<a href="mailto:2362860676@qq.com">2362860676@qq.com</a>
			<br/><br/>
			战略合作及投资:<a href="mailto:yin1jun1999@163.com">yin1jun1999@163.com</a>
			<br/><br/>
			联系电话:+86 010 68932333
			<br/><br/>
			地址:北京市海淀区中关村南大街27号中央民族大学,邮编：100081
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