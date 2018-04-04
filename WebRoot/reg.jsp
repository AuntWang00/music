<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
	<!-- ------------以下这个css是bootstrap Validator插件的css-------------- -->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrapValidator.css">
	
	<link rel="shortcut icon" href="<%=basePath%>images/logo.png">
	
  </head>
  
  <body>
    <header>
        <div >
       		<h1 class="maige-title">
       			<a href="main.jsp"><img srcset="images/title.png" alt="title logo" class="maige-logo"></a>					
  			</h1>
  		</div>	    
    </header>  
    <main class="bg">
    
	    <!-- <s:form action="customer/customer_reg" method="post" cssClass="login" validate="true">
	      <h3>注&nbsp;&nbsp;&nbsp;&nbsp;册</h3>
	      <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <s:textfield name="customer.name"></s:textfield> -->
                <!--<input type="text" name="customer.name" pattern="^[a-zA-Z]\w{5,15}$" class="form-control" placeholder="请输入用户名" required>  -->
                <!--<input type="email" name="customer.name" class="form-control" placeholder="请输入您的邮箱" required>  -->
                <!--<input type="text" name="customer.name" class="form-control" placeholder="请输入用户名" required>  -->
             <!--  </div>
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" name="customer.password" class="form-control" placeholder="请输入密码" required>
              </div>
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                <input type="text" name="customer.address" class="form-control" placeholder="请输入您的地址">
              </div>
          </div>
	      <button type="submit" class="btn btn-success btn-login">注&nbsp;&nbsp;册 </button>
	    </s:form> -->
	    <s:form action="customer/customer_reg" id="defaultForm" method="post" cssClass="login" validate="true">
	      <h3>注&nbsp;&nbsp;&nbsp;&nbsp;册</h3>
	       <div class="form-group">
	         <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-user"></i></span>
                 <input type="text" class="form-control" name="customer.name" />
             </div>
           </div>
           <div class="form-group">
	         <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                 <input type="text" class="form-control" name="customer.password" />
             </div>
           </div>
           <div class="form-group">
	         <div class="input-group">
                 <span class="input-group-addon"><i class="fa fa-home"></i></span>
                 <input type="text" class="form-control" name="customer.address" />
             </div>
           </div>
           <div class="form-group">
             <div class="input-group">
               <button type="submit" class="btn btn-success btn-login">注&nbsp;&nbsp;册 </button>
             </div>
           </div>
	    </s:form>
	    
    </main>
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <!-- -------以下这个css是bootstrap Validator插件的css--------- -->
    <script src="<%=basePath%>js/bootstrapValidator.js"></script>
    <script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm')
		        .bootstrapValidator({
		            message: '请输入内容',
		            feedbackIcons: {
		                valid: 'fa fa-check',
		                invalid: 'fa fa-remove',
		                validating: 'fa fa-refresh'
		            },
		            fields: {
		                'customer.name': {
		                    message: '用户名无效',
		                    validators: {
		                        notEmpty: {
		                            message: '用户名不得为空'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 20,
		                            message: '用户名必须在6-20个字符之间'
		                        },
		                        regexp: {
		                            regexp: /^[a-zA-Z0-9_\.]+$/,
		                            message: '用户名只能包含字母、数字、点、下划线 '
		                        }	                        
		                    }
		                },
		                'customer.password': {
		                    validators: {
		                        notEmpty: {
		                            message: '密码不得为空'
		                        },
		                        different: {
									field: 'customer.name',
									message: '密码不能与用户名相同'
									},
		                    }
		                },
		                'customer.address': {
		                    validators: {
		                        notEmpty: {
		                            message: '请输入地址'
		                        }
		                    }
		                }
		            }
		        })
		});
	</script>
  </body>
</html>
