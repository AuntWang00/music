<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en" class="app">
<head>  
 <base href="<%=basePath%>">
  <meta charset="utf-8" />
  <title>播放页</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css" />
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
  <link rel="stylesheet" href="css/font.css" type="text/css" />
  <link rel="stylesheet" href="css/app.css" type="text/css" />  
  <link rel="shortcut icon" href="<%=basePath%>images/logo.png">
    <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body>

  <section class="vbox">
    <header class="bg-black lter header header-md navbar navbar-fixed-top-xs">
      
      
    </header>
    <!-- 音乐 -->
    <audio autoplay="autoplay" id="audio_play" loop="loop">  
    <source src="<%=basePath %>${song.audiopath}" type="audio/mpeg"> </source> 
    </audio>
    
      
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">
          <section class="w-f-md">
            <section class="hbox stretch bg-black dker">
              <!-- side content -->
              <aside class="col-sm-5 no-padder" id="sidebar">
                <section class="vbox animated fadeInUp">
                  <section class="scrollable">
                    <div class="m-t-n-xxs item pos-rlt">
                      <div class="top text-right">
                        <span class="musicbar animate bg-success bg-empty inline m-r-lg m-t" style="width:25px;height:30px">
                          <span class="bar1 a3 lter"></span>
                          <span class="bar2 a5 lt"></span>
                          <span class="bar3 a1 bg"></span>
                          <span class="bar4 a4 dk"></span>
                          <span class="bar5 a2 dker"></span>
                        </span>
                      </div>
                      <div class="bottom gd bg-info wrapper-lg">
                        <span class="pull-right text-sm">101,400 <br>Followers</span>
                        <span class="h2 font-thin">Soph Ashe</span>
                      </div>
                      <img class="img-full" src="images/m43.jpg" alt="...">
                    </div>
                   
                  </section>
                </section>
              </aside>
              <!-- / side content -->
              <section class="col-sm-4 no-padder bg">
                <section class="vbox">
                  <section class="scrollable hover">
                    <ul class="list-group list-group-lg no-bg auto m-b-none m-t-n-xxs">
                   
                    <li class="list-group-item clearfix">
                     <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                         <a href="#" class="pull-left thumb-sm m-r">
                        <img src = "<%=basePath %><s:property value='filepath'/>">
                        </a>
   						
   								
   									
   									 <a class="clear" href="#">
                          <span class="block text-ellipsis"><s:property value ="songname"/></span>
                         <small class="text-muted">by Soph Ashe</small>
                        </a>
   									
   								
   							</li>  						
   				
   					</ul>
	  
                      <!--  <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/m0.jpg" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Little Town</span>
                          <small class="text-muted">by Soph Ashe</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a1.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Get lacinia odio sem nec elit</span>
                          <small class="text-muted">by Filex</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a2.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Donec sed odio du</span>
                          <small class="text-muted">by Dan Doorack</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a3.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Curabitur blandit tempu</span>
                          <small class="text-muted">by Foxes</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a4.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Urna mollis ornare vel eu leo</span>
                          <small class="text-muted">by Chris Fox</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a5.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Faucibus dolor auctor</span>
                          <small class="text-muted">by Lauren Taylor</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a6.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Praesent commodo cursus magn</span>
                          <small class="text-muted">by Chris Fox</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a7.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Vestibulum id</span>
                          <small class="text-muted">by Milian</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a8.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Blandit tempu</span>
                          <small class="text-muted">by Amanda Conlan</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a9.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Vestibulum ullamcorpe quis malesuada augue mco rpe</span>
                          <small class="text-muted">by Dan Doorack</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a10.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Natis ipsum ac feugiat</span>
                          <small class="text-muted">by Hamburg</small>
                        </a>
                      </li>
                      <li class="list-group-item clearfix">
                        <a href="#" class="jp-play-me pull-right m-t-sm m-l text-md">
                          <i class="icon-control-play text"></i>
                          <i class="icon-control-pause text-active"></i>
                        </a>
                        <a href="#" class="pull-left thumb-sm m-r">
                          <img src="images/a0.png" alt="...">
                        </a>
                        <a class="clear" href="#">
                          <span class="block text-ellipsis">Sec condimentum au</span>
                          <small class="text-muted">by Amanda Conlan</small>
                        </a>
                      </li>
                    
                    </ul>-->
                  </section>
                </section>
              </section>
              <section class="col-sm-3 no-padder lt">
                <section class="vbox">
                  <section class="scrollable hover">
                    
                      
                     
                     
                    </div>
                  </section>
                </section>
              </section>
            </section>
          </section>
          <footer class="footer bg-success dker">
            <div id="jp_container_N">
                    <div class="jp-type-playlist">
                      <div id="jplayer_N" class="jp-jplayer hide"></div>
                      <div class="jp-gui">
                        <div class="jp-video-play hide">
                          <a class="jp-video-play-icon">play</a>
                        </div>
                        <div class="jp-interface">
                          <div class="jp-controls">
                            <div><a class="jp-previous"><i class="icon-control-rewind i-lg"></i></a></div>
                            <div>
                              <a class="jp-play"><i class="icon-control-play i-2x"></i></a>
                              <a class="jp-pause hid"><i class="icon-control-pause i-2x"></i></a>
                            </div>
                            <div><a class="jp-next"><i class="icon-control-forward i-lg"></i></a></div>
                            <div class="hide"><a class="jp-stop"><i class="fa fa-stop"></i></a></div>
                            <div><a class="" data-toggle="dropdown" data-target="#playlist"><i class="icon-list"></i></a></div>
                            <div class="jp-progress hidden-xs">
                              <div class="jp-seek-bar dk">
                                <div class="jp-play-bar bg">
                                </div>
                                <div class="jp-title text-lt">
                                  <ul>
                                    <li></li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                            <div class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
                            <div class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
                            <div class="hidden-xs hidden-sm">
                              <a class="jp-mute" title="mute"><i class="icon-volume-2"></i></a>
                              <a class="jp-unmute hid" title="unmute"><i class="icon-volume-off"></i></a>
                            </div>
                            <div class="hidden-xs hidden-sm jp-volume">
                              <div class="jp-volume-bar dk">
                                <div class="jp-volume-bar-value lter"></div>
                              </div>
                            </div>
                            <div>
                              <a class="jp-shuffle" title="shuffle"><i class="icon-shuffle text-muted"></i></a>
                              <a class="jp-shuffle-off hid" title="shuffle off"><i class="icon-shuffle text-lt"></i></a>
                            </div>
                            <div>
                              <a class="jp-repeat" title="repeat"><i class="icon-loop text-muted"></i></a>
                              <a class="jp-repeat-off hid" title="repeat off"><i class="icon-loop text-lt"></i></a>
                            </div>
                            <div class="hide">
                              <a class="jp-full-screen" title="full screen"><i class="fa fa-expand"></i></a>
                              <a class="jp-restore-screen" title="restore screen"><i class="fa fa-compress text-lt"></i></a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="jp-playlist dropup" id="playlist">
                        <ul class="dropdown-menu aside-xl dker">
                          <!-- The method Playlist.displayPlaylist() uses this unordered list -->
                          <li class="list-group-item"></li>
                        </ul>
                      </div>
                      <div class="jp-no-solution hide">
                        <span>Update Required</span>
                        To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                      </div>
                    </div>
                  </div>
          </footer>
        </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>
  <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script>  
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/app.plugin.js"></script>
  <script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
  <script type="text/javascript" src="js/jPlayer/demo.js"></script>
</body>
</html>