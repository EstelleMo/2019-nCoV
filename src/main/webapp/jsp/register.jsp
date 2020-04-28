<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>zzxxNews - Register</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<style type="text/css">
		.col-md-8{
		color:black
		}
		.checkwords{
		
		}
	</style>
	<link rel="stylesheet" href="Css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="Css/zerogrid.css">
	<link rel="stylesheet" href="Css/style.css">
	<link rel="stylesheet" href="Css/responsiveslides.css" />
	<link rel="stylesheet" href="Css/responsive.css">
	<link href='./Images/favicon.ico' rel='icon' type='image/x-icon'/>
	
	<script src="Js/jquery.min.js"></script>
	<script src="Js/responsiveslides.js"></script>
	<script src="Js/jquery.validate.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#checkwords").click(function(){
				$("#checkwords").prop("src","/zzxx_news/CheckWordsServlet?time="+new Date());
			});
		});
	</script>
</head>
<body style="background-color:#454545">
<header style="background-color:Gainsboro"> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"><a href="index.jsp"><img src="./Images/logo.png"/></a></div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top:20px">
					<ul style="padding-top:10px; padding-left:70%; font-size:18px;">
						<li style="display:inline"><a href="login.jsp">登录</a></li>
						<li style="display:inline; margin-left:1rem"><a href="register.html">注册</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>

<nav style="height:41px">
	<ul>
		<li><a href="index.jsp">首页</a></li>
		<li><a href="world.jsp">国际</a></li>
		<li><a href="lifestyle.jsp">生活</a></li>
		<li><a href="physical.jsp">体育</a></li>
		<li><a href="military.jsp">军事</a></li>
		<li><a href="entertainment.jsp">娱乐</a></li>
		<li><a href="video.jsp">视频</a></li>
		<form action="" id="search-form" method="get">
			<input class="form-control" id='search-text' name='q' placeholder='search news' type='text' style="display: inline-block; margin-top:4px; margin-left:32%; width:auto"/>
			<button id='search-button' type='submit' class="btn btn-default"><span>搜索</span></button>
		</form>
	</ul>
</nav>
<script type="text/javascript">
$(function() {
	$("#registerform").validate({
		rules: {
			username: {
				required: true,
				maxlength: 20,
				minlength: 4,
			},
			password: {
				required: true,
				minlength: 4,
				maxlength: 20
			},
			confirmpwd:{
				required: true,
				equalTo:"#password"
			},
			email:{
				required: true,
		        email: true
			}
			
			
		},
		messages: {
			username: {
				required: "用户名不能为空",
				maxlength: "用户名长度不能超过20",
				minlength: "用户名长度不能小于4",
				checkUser: "用户名已存在"
			},
			password: {
				required: "密码不能为空",
				minlength: "密码长度不能小于6",
				maxlength: "密码长度不能超过20"
			},
			confirmpwd:{
				required: "请再次输入密码",
				equalTo:"两次密码输入不一致，请重新输入"
			},
			email:{
				required:"请输入邮箱地址",
		        email: "请输入正确的邮箱地址"
			}
			
		}
	});
});
</script>
<div class="container" style="width:100%;background:url('Images/timg.jpg') no-repeat; background-size:100%;">
<div class="row"> 
	<div class="col-md-2"></div>
	<div class="col-md-8" style="background:#ccc;padding:40px 60px;margin:50px;border:7px solid #ccc;filter:alpha(Opacity =80);-moz-opacity:0.80;opacity:0.80;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font>用户注册</font>USER REGISTER 
		&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<span style="text-align:right" >如有账号，直接<a id="logintips" name="logintips" href="${pageContext.request.contextPath }/user/login">登录</a></span>
		<form action="${pageContext.request.contextPath }/user/register" method="post" class="form-horizontal" style="margin-top:5px; " id="registerform">
			 <div class="form-group">
			    <label for="userId" class="col-sm-2 control-label">用户帐号</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" name="userId" id="userId" placeholder="请输入手机号/邮箱">
			    </div>
			  </div>
			 <div class="form-group">
			    <label for="username" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名">
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" name="password" id="inputPassword3" placeholder="请输入密码">
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="confirmpwd" class="col-sm-2 control-label" >确认密码</label>
			    <div class="col-sm-6">
			      <input type="password" class="form-control" name="confirm" id="confirmpwd" placeholder="请输入确认密码">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			    <div class="col-sm-6">
			      <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
			    </div>
			  </div>
			 <div class="form-group">
			    <label for="usercaption" class="col-sm-2 control-label">姓名</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" name="realname" id="realname" placeholder="请输入姓名">
			    </div>
			  </div>
			  <div class="form-group opt">  
			  <label for="inlineRadio1" class="col-sm-2 control-label">性别</label>  
			  <div class="col-sm-6">
			    <label class="radio-inline">
			  <input type="radio" name="gender" id="gender" value="m"> 男
			</label>
			<label class="radio-inline">
			  <input type="radio" name="gender" id="gender" value="f"> 女
			</label>
			</div>
			  </div>		
			  <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">出生日期</label>
			    <div class="col-sm-6">
			      <input type="date" class="form-control" name="birthday" id="birthday">		      
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="date" class="col-sm-2 control-label">验证码</label>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" name="code" id="code">
			      
			    </div>
			    <div class="col-sm-2">

			    <img src="${pageContext.request.contextPath}/CheckWordsServlet" style="width=120px;" id="checkwords" class="checkwords"/>
				 <span style="color:red">${exception.message}</span>
			    </div>
			    
			  </div>
			 
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <input type="submit" width="100" value="注册" name="submit" 
				    style="border:0; background: url('./Images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0);
				    height:35px;width:100px;color:white;">
			    </div>
			  </div>
			</form>
	</div>
	
	<div class="col-md-2"></div>
  
</div>
</div>
<footer>
	<div class="zerogrid">
		<div class="row">
			<section class="col-1-3">
				<div class="heading">关于我们</div>
				<div class="content">
					指针新闻始终站在最前沿，致力于将新闻实时、准确地传达给每一名用户，您的好评是我们最好的鼓励！<br>
					如有错误请联系我们！
				</div>
			</section>
			<section class="col-1-3" style="width:150px; margin-left:80px; margin-right:110px">
				<div class="heading">友情链接</div>
				<div class="content">
					<ul>
						<li><a href="http://www.baidu.com" target="_blank">百度一下，你就知道</a></li>
						<li><a href="http://news.qq.com" target="_blank">腾讯新闻网</a></li>
						<li><a href="http://www.people.com.cn/" target="_blank">人民网</a></li>
						<li><a href="http://www.xinhuanet.com/" target="_blank">新华网</a></li>
						<li><a href="http://www.huanqiu.com/?agt=15438" target="_blank">环球网</a></li>
					</ul>
				</div>
			</section>
			<section class="col-1-3">
				<div class="heading">友情赞助</div>
				<div class="content">
					<table border="0px">
						<tr>
							<td><img src="Images/thumb4.jpg"/></td>
							<td><img src="Images/thumb5.jpg"/></td>
							<td><img src="Images/thumb6.jpg"/></td>
						</tr>
						<tr>
							<td><img src="Images/thumb6.jpg"/></td>
							<td><img src="Images/thumb5.jpg"/></td>
							<td><img src="Images/thumb4.jpg"/></td>
						</tr>
					</table>
				</div>
			</section>
		</div>
	</div>
</footer>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2019-2020 指针新闻 版权所有
		</div>  
</body>
</html>