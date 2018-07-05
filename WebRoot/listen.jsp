<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>
<title>播放页</title>
<meta charset="utf-8">
  <base href="<%=basePath%>">
    
<link rel="stylesheet" type="text/css" href="css/scroll.css">
<link rel="stylesheet" type="text/css" href="css/xiami.css">
<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>
<script type="text/javascript" src="js/mousewheel.js"></script>
<script type="text/javascript" src="js/scroll.js"></script>
<script type="text/javascript" src="js/xiami.js"></script>


</head>
<body>
	<!--模糊画布-->
	<div class="blur">
		<canvas style="width:1366px;height:700px;opacity:0;" width="1366" height="700" id="canvas">
	</div>
	
	<div class="playerMain">
		<div class="top">
			<a href="song/song_showNewSong"><img srcset="images/title.png" class="logo"></a>
			<div class="search">
				<div type="submit" class="searchBtn"></div>
				<input type="text" class="searchTxt">
			</div>
			<div class="mainNav">
			 <a href="customer/customer_showEdit?customer.customerid=${customer.customerid}&customer.sex=${customer.sex}&customer.country=${customer.country}">
		       	<img src = "<%=basePath %>${customer.filepath}" style="width:30px; height:30px;"></a>   
		  	    <c:out value="${customer.name}"></c:out>, 欢迎您!
			    <a href="logout.jsp">退出</a>	
			</div>
		</div>
		<div class="middle">
			<div class="mainWrap">
				<div class="leftBar">
					<ul class="menuUL">
						<li class="menuLi cur">
							<a href="#">
								<i class="icon iplay"></i>
								正在播放
							</a>
						</li>
						<li class="menuLi">
							<a href="#">
								<i class="icon ihst"></i>
								播放历史
							</a>
						</li>
						<li class="menuLi">
							<a href="#">
								<i class="icon ishouc"></i>
								我收藏的单曲
							</a>
						</li>
					</ul>
					<div class="collectOut">
						<span class="colS">我创建的精选集</span>
						<a href="#" class="colA"></a>
					</div>
					<div class="cellectList"></div>
								<audio id="audio" src="<%=basePath %>${song.audiopath}" ></audio>	
				</div>
				<div class="mainBody">
					<div class="playHd">
						<div class="phInner">
							<div class="col">歌曲</div>
							<div class="col">演唱者</div>
							<div class="col">播放量</div>
						</div>
					</div>
					<div class="playBd">
					<div class="scrollView">
							<!-- <div class="scroll"></div> -->
							<ul class="songUL">
								<li class="songList">
									<div class="songLMain">
										<div class="check">
											<input class="checkIn" type="checkbox" select="0">
										</div>
										<div class="start" >
											<em sonN="${song.songid}">1</em>
										</div>
										<div class="songBd">
											<div class="col colsn">
											<p> 
											<c:out value="${song.songname}"></c:out>
											</p>
											</div>
											<div class="col colcn">
											<p> 
											<c:out value="${song.singer}"></c:out>
											</p></div>
											<div class="col"><p> 
											<c:out value="${song.bofangliang}"></c:out>
											</p></div>
										</div>
										<div class="control">
											<a class="cicon love"></a>
											<a class="cicon more" style="display:none"></a>
											<a class="cicon dele" style="display:none"></a>
										</div>
									</div>									
								</li>
								</ul>
						</div>
					</div>
					<div class="playFt">
						<div class="track">
							<div class="uiCheck">
								<input class="checkAll" type="checkbox" select="0">
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itDele">删除</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itShou">收藏</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itJin">添加到精选集</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itMore">更多</a>
							</div>
						</div>
					</div>
				</div>
				<div class="mainOuther">
					<div class="albumCover">
						<a href="#">
							<img src = "<%=basePath %>${song.filepath}" id="canvas1" style="width:180px; height:180px;">
						</a>
					</div>
					<div class="albumSale">
					</div>
					<div id="lyr"></div>
				</div>
			</div>
		</div>
		<div class="bottom">
			<div class="playerWrap">
				<div class="playerCon">
					<a href="javascript:;" class="pbtn prevBtn"></a>
					<a href="javascript:;" class="pbtn playBtn" isplay="0"></a>
					<a href="javascript:;" class="pbtn nextBtn"></a>
					<a href="javascript:;" class="mode"></a>
				</div>
				<div class="playInfo">
					<div class="trackInfo">
						<a href="#" class="songName"><p> 
											<c:out value="${song.songname}"></c:out>
											</p></a>
						-
						<a href="#" class="songPlayer">
											<c:out value="${song.singer}"></c:out>
											</a>
						<div class="trackCon">
							<a href="#" class="tc1"></a>
							<a href="#" class="tc2"></a>
							<a href="#" class="tc3"></a>
						</div>
					</div>
					<div class="playerLength">
						<div class="position">00:00</div>
						<div class="progress">
							<div class="pro1"></div>
							<div class="pro2">
								<a href="#" class="dian"></a>
							</div> 
						</div>
						<div class="duration">00:00</div>
					</div>
				</div>
				<div class="vol">
					<a href="#" class="pinBtn"></a>
					<div class="volm">
						<div class="volSpeaker"></div>
						<div class="volControl">
							<a href="#" class="dian2"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>