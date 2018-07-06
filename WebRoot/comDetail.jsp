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
    
    <title>歌曲详情</title>
    
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
  					<a href="song/song/song_showNewSong"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
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
  	
	
	<!-- 歌曲详情语句开始 -->
	<div class="detail-contain">
	

	<div class="above">
	<div class="part1">
	<!-- 图片 -->
	<form action="com/com_addComment?songs.songid=${songs.songid}&order.orderid=${order.orderid}&customer.name=<s:property value='#session.customer.name'/>" method="post">
	<span class = "show-photo">
 		<!-- <img src = "<%=basePath %>${songs.filepath}" style="width:300px; height:300px;">  -->
 	 <img src = "<%=basePath %>${songs.filepath}" style="width:300px; height:300px;">
    </span>
    <!-- 歌手信息 -->
    <div class="data-cont">
    <div class="data-name"> <p>歌曲名称：<c:out value="${songs.songname}"></c:out></p></div>
   <div class="data-name"> <p>歌手：<c:out value="${songs.singer}"></c:out></p></div>
    <div class="data-singer"><i class="icon_singer sprite"></i>
   
	<ul class="data-info">
			
			    <!-- <li class="data_info__item data_info__item--even">专辑：<a>渺小</a></li>  -->
			
			    <li class="data_info__item js_lan" style="">语种:<c:out value="${songs.language}"></c:out></li>
			     
			    <li class="data_info__item js_genre data_info__item--even" style="">流派：情歌</li>
			    <li class="data_info__item js_lan" style="">播放量:<c:out value="${songs.bofangliang}"></c:out></li>
			   <!--  <li class="data_info__item js_public_time data_info__item--even" style="">发行时间：2018-04-13</li>  -->
	</ul>
	<div class="data__actions" role="toolbar">
			    <a href="song/song_playmusic?song.songid=<s:property 
	                  value="song.songid"/>" class="mod_btn_green js_all_play"><i class="mod_btn_green__icon_play"></i>试听</a>
			   
			    <a href="order/order_addOrder?song.songid=<s:property 
	                  value="song.songid"/>&customer.name=<s:property value='#session.customer.name'/>" class="mod_btn_green js_all_play">
	                  <i class="mod_btn_green__icon_play">购买</i></a>
			     
			     <a href="#comment_box" class="mod_btn js_into_comment" data-stat="y_new.song.gotocomment"><i class="mod_btn__icon_comment"></i>评论</a>
			     
			    <a href="javascript:;" class="mod_btn js_more" data-stat="y_new.song.header.more"  data-mid="001PfID21QGDh3"><i class="mod_btn__icon_menu"></i>更多</a>
		
			  </div>   
			</div>		
		</div>
		<!-- 这段是评论 -->
    <div class="mod_comment" >
    <div class="part__hd">
    <h2 class="part__tit">评论<span class="c_mg_thin part__tit_desc js_all_comment_num"></span>
    </h2>
    </div>
    <div class="mod_comment1 js_cmt_input">
    
   
    <div class="comment__input">
    <div class="comment__textarea js_comment__textarea c_bg_normal">
    <div class="comment_textarea_inner ">
    <!-- c_mg_normal -->
    <!-- focus评论框的时候将。comment__textarea_default模块儿隐藏，同时显示。comment_textarea_input -->
    <textarea class="comment__textarea_default c_mg_thin js_reply_text_blur"
    name="comme" id="reply_text_blur" contenteditable="true" placeholder="期待你的评论..."><s:property value='comment.comme'></s:property></textarea>
    <div class="js_reply_text comment__textarea_input c_mg_narmal" name 
    id="reply_text" contenteditable="true" style="display:none;"></div>
    </div>  
    </div>   
    <div class="comment__tool">
    <button type="submit" class="mod_btn_red comment__tool_btn js_send_reply">发表评论</button>
    </div>
    </div>
    
    </div>
    <a name="comment_box"></a>
   
    </div>
    </div>
    </form>
    </div>
	<!-- 歌词 -->
	<div class="detail-layout">
	<div class="detail-layout-main">
	<div class="mod_lyric">
			    <input id="copy_content" style="display:none;"></input>
			    <div class="lyric__hd">
				<h2 class="lyric__tit">歌词</h2>
			    </div>
			    <div class="lyric__cont limit">
				<div class="lyric__cont_box" id="lrc_content"></div>
			    </div>
			</div>
			</div>
			
			<div id="lyrics" style="height:400px; overflow-y:auto">${ songs.lyrics }</div>
		<script>
		$("#lyrics").html($("#lyrics").html().replace(/\n/g,"<br/>"));
		</script>
	<!-- 这段是歌词 -->
	</div>	
	 <div class="mod_all_comment js_mod_all">
    <div class="comment_type__title c_b_normal"><h2>评论</h2></div>
    <ul class="comment_list js_all_list">
    <!-- 最新评论部分 -->
    <s:iterator value="commentList" status="status">
        <tr>
            <td><img src = "<%=basePath %>${music_customer.filepath}" style="width:50px; height:50px;">
             	 <c:out value="${music_customer.name}"></c:out>
             	 :
             </td>
            
	        <td><c:out value="${comme}"></c:out></td>
	        <br/>
	        <br/>
        </tr>
    </s:iterator>    
    </ul>
    <div class="mod_page_nav js_pager_comment">
    <!-- 换页部分 -->
      
    </div>
    </div>
	<!-- 歌曲详情语句结束 -->
	
	</div>
	 	<!--  友情链接和footer -->
    <footer class="footer" role="footer">
   		<div class="footer-inner">
   			<div class="footer-info">
   			
   			<ul>
   			<li><img src = "<%=basePath %>images/rongrong.png" title="黄丽蓉"><br><a href="mailto:525807250@qq.com">黄丽蓉</a></li>
   			<li><img src = "<%=basePath %>images/jiali.png" title="王佳丽"><br><a href="mailto:1092117078@qq.com">王佳丽</a></li>
   			<li><img src = "<%=basePath %>images/junjun.png" title="尹一君"><br><a href="mailto:2362860676@qq.com">尹一君</a></li>
   			<li><img src = "<%=basePath %>images/qiqi.png" title="齐国红"><br><a href="mailto:1823982150@qq.com">齐国红</a></li>
   			<li><img src = "<%=basePath %>images/wangke.png" title="王珂"><br><a href="mailto:1007040724@qq.com">王珂</a></li>
   			
   			
   			</ul>
   			
   			
   			</div>
   			<div class="footer-copyright">
   			
   			<p>©2018 买歌原创音乐版权所有</p>

   			</div>
   		</div>
   	</footer>
  </body>
</html>