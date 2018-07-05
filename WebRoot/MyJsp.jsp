<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimal-ui">
	<title>EWork - Creative work website</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="css/templatemo_style.css">-->
	<link rel="stylesheet" href="css/one.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/imge.css">
	<script type="text/javascript" src="js/icheck.min.js"></script>
	<link rel="stylesheet" href="css/base.css" type="text/css"></link>
	<link rel="stylesheet" href="css/home.css" type="text/css"></link>
	
</head>
<body>
	 <div class="header">
    <!-- bar start -->
    <div class="bar">
        <div class="in">
            
            <span class="l">|</span>
            <div class="app">
                <ul>
                    <li><em class="e_icon"></em>EWORK<em class="icon_arrow"></em></li>
                </ul>
            </div>
            <p class="rlk">
                <a href="https://jobs.51job.com" target="_blank">招聘信息</a>
                <span class="l">|</span>
                <a href="https://ehire.51job.com" target="_blank">企业服务</a>
            </p>
            
            <div class="uer">
                    <p class="op">
                    <c:choose>
                    <c:when test="${session.customer.name==null}">
                        <a href="login.jsp" rel="external nofollow">登录</a> / <a href="reg.jsp" rel="external nofollow">注册</a>
                        </c:when>
                        <c:otherwise>
                        <c:choose>
                          <c:when test="${session.customer.ifcustomer==1}">
                          <a href="#"><c:out value="${session.customer.name}"></c:out>　欢迎您</a>/<a href="main/main_re">注销</a>
                          </c:when>
                        <c:otherwise>
                         <a href="#"><c:out value="${session.customer.name}"></c:out>　欢迎您</a>/<a href="main/main_re">注销</a>
                        </c:otherwise>
                        </c:choose>
                        </c:otherwise>
                        </c:choose>
                    </p>
                
            </div>
            <!-- 添加的搜索方法，需要调整位置 -->
                <div class="search">
                    <form action="message/message_queryMessage" method="post" class="form-inline">
                       <input type="text" name="keyWords" class="form-control" placeholder="请输入关键词" style="width:250px">
                       <button type="submit" style="btn btn-default">查询</button>    
                    </form>
                </div>
        </div>
    </div>
    <div class="nag" id="topIndex">
        <div class="in">
           <img class="logo" id="logo" width="66" height="46" src="images/logo.png" alt="前程无忧">
                <img class="slogen" id="slogen"  height="46"  src="images/pp.png">
            
            <p class="nlink">
            <c:choose>
            <c:when test="${session.customer.name==null}">
            <a class="on" href="main.jsp">首页</a>
            <a class="" href="#">关于我们</a>
            <a class="" href="#">成果展示</a>
            <a class="" href="#">公司优势</a>
            <a class="" href="#">联系我们</a>
            </c:when>
            <c:otherwise>
            <c:choose>
            <c:when test="${session.customer.ifcustomer==1}">
            <a class="" href="main.jsp">首页</a>
            <a class="on" href="message/message_queryMessage?keyWords=">我的工作</a>
            <a class="" href="customerorder/customerorder_editOrder?key=${session.customer.customerid}">我的预约</a>
            <a class="" href="Customer_message.jsp">我的信息</a>
            <a class="" href="#">联系我们</a>
            </c:when>
            <c:otherwise>
            <a class="" href="main.jsp">首页</a>
            <a class="on" href="message/message_queryMessage?keyWords=">工作</a>
            <a class="" href="message/message_fwork?message.fid=${session.customer.customerid}">我发布的工作</a>
            <a class="" href="customerorder/customerorder_editOrder2?key=${session.customer.customerid}">回应</a>
            <a class="" href="Customer_message.jsp">我的信息</a>
            </c:otherwise>
            </c:choose>
            </c:otherwise>
            </c:choose>
    </p>        
   </div>
   </div>
   </div>
<main><br>
<a href="message/message_sortMessageBySalary">薪资降序</a>
<a href="message/message_sortMessageBySalary2">薪资升序</a>
<a href="message/message_sortMessageByDegree">学历降序</a>
<a href="message/message_sortMessageByDegree2">学历升序</a>
<a href="message/message_sortMessageByAvaliable">需求人数降序</a>
<a href="message/message_sortMessageByAvaliable2">需求人数升序</a>

<!--<select class="form-control" onchange="self.location.href=options[selectedIndex].value" id="select">显示不合理
   <option value="message/message_sortMessageBySalary">薪资降序</option>
   <option value="message/message_sortMessageBySalary2">薪资升序</option>
   <option value="message/message_sortMessageByDegree">学历降序</option>
   <option value="message/message_sortMessageByDegree2">学历升序</option>
   <option value="message/message_sortMessageByAvaliable">需求人数降序</option>
   <option value="message/message_sortMessageByAvaliable2">需求人数升序</option>
</select>-->

<section class="aui-screen-box" >
            <div class="aui-screen-content" >
                <div class="aui-choice-screen">
                  <form action="message/message_sortMessage" method="post">
                    <div class="aui-screen-head-choice">
                        <dl>
                            <dt>已选条件：</dt>
                            <dd style="display:none" class=aui-clear-delete>
                                <div class=aui-clear-list></div>
                                <div style="display:none" class="aui-eliminate">清除筛选条件</div>
                            </dd>
                        </dl>
                    </div>
                    <div id="aui-selectList" class="aui-screen-list-box">
                        <dl class="aui-screen-list-item" attr="terminal_brand_s">
                            <dt>学历：</dt>
                            <dd>
                                <a href="javascript:void(0)" values2="" values1="" attrval="高中及以下"><input type="checkbox" name="box2" value="0">高中及以下</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="大专"><input type="checkbox" name="box2" value="1">大专</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="本科"><input type="checkbox" name="box2" value="2">本科</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="硕士"><input type="checkbox" name="box2" value="3">硕士</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="博士及以上"><input type="checkbox" name="box2" value="4">博士及以上</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="无学历要求">无学历要求</a>  
                            </dd>
                        </dl>
                        <dl class="aui-screen-list-item" attr="">
                            <dt>月薪：</dt>
                            <dd>
                                <a href="javascript:void(0)" values2="" values1="" attrval="4000以下">2000以下</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="4000-6000">4000-6000</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="6000-8000">6000-8000</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="8000-10000">8000-10000</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="10000-15000">10000-15000</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="15000-20000">15000-20000</a>
                                <a href="javascript:void(0)" values2="" values1="" attrval="20000以上">20000以上</a>
                                <label class="aui-sr-input">
                                    <input name="minsalary" type="text" placeholder="min">
                                    -
		                            <input name="maxsalary" type="text" placeholder="max">
                                    <button >确认</button>
                                </label>
                            </dd>
                        </dl>
                        <dl class="aui-screen-list-item aui-aui-screen-list-item" attr="aui-terminal">
                            <dt>按类型：</dt>
                            <dd>
                          
                                <ul class="aui-list-pz-size">
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="商务/营销"><input type="checkbox" name="box" value="商务/营销">商务/营销</a>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="生活/医疗"><input type="checkbox" name="box" value="生活/医疗">生活/医疗</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="劳工/制造"><input type="checkbox" name="box" value="劳工/制造">劳工/制造</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                            <a href="javascript:void(0)" values2="" values1="" attrval="艺术/教育"><input type="checkbox" name="box" value="艺术/教育">艺术/教育</a><br>
                                        </label>
                                    </li>
                                    <li>
                                        <label>
                                           <a href="javascript:void(0)" values2="" values1="" attrval="科技/设计"><input type="checkbox" name="box" value="科技/设计">科技/设计</a><br>
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
<ul>

            <c:forEach var="message" items="${messageList}" varStatus="status">
             <li>
              <div class="port-2 effect-3" style="border:0px"> 
               <div class="image-box">      
                 <a href="message/message_getComMessage?message.jobid=${message.jobid}">        
	             <img src="<%=basePath%>upload/${message.companyphoto}">
	               </a>
	              </div>
	            
	             <div class="text-desc">
		                    	<h3>${message.jobname}<br></h3>
		                    	<a href="message/message_getComMessage?message.jobid=${message.jobid}" class="btn">详情</a>
		                       <p><a href="customerorder/customerorder_tran?customerorder.jobid=${message.jobid}&customerorder.id=${customer.customerid}&customerorder.fid=${message.fid}" class="add-order">
	                  <i class="fa fa-check-square"></i>申请</a></p>
	                
		                        
	             </div>
	               <p>
	               <!--  <a href="message/message_getComMessage?message.jobid=${message.jobid}"> -->
	                  <c:out value="${message.jobname}"></c:out>
	               
	                <span class="price"> <c:out value="${message.companyname}"></c:out></span>
                    </p>
                 </div>
	          </li>
 
  </c:forEach>
  </ul>
</main>
<div id="box" class="box">
    <div class="box-in"></div>
</div>    
<script>
var timer  = null;
box.onclick = function(){
    cancelAnimationFrame(timer);
    //获取当前毫秒数
    var startTime = +new Date();     
    //获取当前页面的滚动高度
    var b = document.body.scrollTop || document.documentElement.scrollTop;
    var d = 1000;
    var c = b;
    timer = requestAnimationFrame(function func(){
        var t = d - Math.max(0,startTime - (+new Date()) + d);
        document.documentElement.scrollTop = document.body.scrollTop = t * (-c) / d + b;
        timer = requestAnimationFrame(func);
        if(t == d){
          cancelAnimationFrame(timer);
        }
    });
}
</script>


	<footer class="site-footer container text-center">

			<div class="col-md-12 copyright">
				<p>Copyright &copy; 2018 <a href="#">Company Name:E Work</a></p>
			
		</div>
	</footer>
	<span class="border-top"></span>
	<span class="border-left"></span>
	<span class="border-right"></span>
	<span class="border-bottom"></span>
	<span class="shape-1"></span>
	<span class="shape-2"></span>

	<script src="js/jquery.min.js"></script>

	<script type="text/javascript">
	function display(){
	    document.getElementById('light').style.display='block';
	    document.getElementById('fade').style.display='block';
	}
	</script>
	<script>
	function select(){
	  document.getElementById('light').style.display='none';
	  document.getElementById('fade').style.display='none';
	}
	</script>
	 <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<!--icheck的js文件-->
<script src="http://cdn.bootcss.com/iCheck/1.0.2/icheck.min.js"></script>
	<script src="js/jquery-1.4.3.min.js"></script>
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