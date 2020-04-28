<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新冠肺炎疫情防控系统</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="./css/zerogrid.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/responsiveslides.css" />
<link rel="stylesheet" href="./css/responsive.css">
<link href='./images/favicon.ico' rel='icon' type='image/x-icon' />

<script src="../js/jquery.min.js"></script>
<script src="../js/responsiveslides.js"></script>
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container .row div {
	/* position:relative;
	 float:left; */
	
}

font {
	color: #666;
	font-size: 22px;
	font-weight: normal;
	padding-right: 17px;
}

.col-md-5 {
	filter: alpha(Opacity = 80);
	-moz-opacity: 0.8;
	opacity: 0.8
}
</style>
</head>
<body>
	<script type="text/javascript">
	$(function(){
		/*  $("#verifyCode").click(function(){
			$("#verifyCode").prop("src","${pageContext.request.contextPath }/user/getVerifyCode?time="+new Date());
		});  */
		 $("#verifyCode").click(function(){
		    $(this).attr('src',"${pageContext.request.contextPath}/user/getVerifyCode?d="+new Date().getTime());
		}); 
	});
	</script>
	<div class="container"
		style="width: 100%; height: 460px; background: #FF2C4C url('images/01.jpg') no-repeat; background-size: 100%;">
		<div class="row">
			<div class="col-md-7">
				<!--  -->
			</div>

			<div class="col-md-5">
				<div
					style="width: 440px; border: 1px solid #E7E7E7; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 60px; background: Gainsboro;">

					欢迎使用新冠肺炎疫情防控系统
					<div>&nbsp;</div>
					<form class="form-horizontal" id="loginForm"
						action="${pageContext.request.contextPath }/user/login">
						<div class="form-group">
							<label for="no" class="col-sm-2 control-label">账号</label> <span
								style="color: red">${exception1.message}</span>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="no"
									placeholder="请输入您的学号/工号" name="no" value="${param.no }">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="inputPassword3"
									placeholder="请输入密码" name="password">
							</div>

						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="inputPassword3"
									name="checkcode" placeholder="请输入验证码">
							</div>
							<div class="col-sm-3">
								<img src="${pageContext.request.contextPath}/user/getVerifyCode"
									style="width: 180px;" type="text" id="verifyCode"
									name="verifyCode "onclick="javascript:changeImage();" /> <span style="color: red">${exception.message}</span>
							</div>

						</div>
						
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox" name="autoLogin">
										自动登录
									</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label> <input
										type="checkbox"> 记住用户名
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="登录" name="submit"
									border="0"
									style="background: url('./images/login.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<div style="text-align: center; margin-top: 5px; margin-bottom: 20px;">
		Copyright &copy; 2019-2020 Estelle 版权所有</div>
</body>
</html>