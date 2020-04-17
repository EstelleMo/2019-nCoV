<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>zzxx_news视频</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" href="Css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="Css/zerogrid.css">
	<link rel="stylesheet" href="Css/style.css">
	<link rel="stylesheet" href="Css/responsiveslides.css" />
	<link rel="stylesheet" href="Css/responsive.css">
	<link href='./Images/favicon.ico' rel='icon' type='image/x-icon'/>
	
	<script src="Js/jquery.min.js"></script>
	<script src="Js/responsiveslides.js"></script>
	<script>
    $(function () {
      $("#slider").responsiveSlides({
        auto: true,
        pager: true,
        nav: true,
        speed: 500,
        maxwidth: 960,
        namespace: "centered-btns"
      });
    });
  </script>
    
</head>
<body style="background-color:#454545">
<c:if test="${!empty user }">
<header style="background-color:lightgray"> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"><a href="index.jsp"><img src="./Images/logo.png"/></a></div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top:20px">
					<ul style="padding-top:18px; padding-left:70%; font-size:13px;">
						<li style="display:inline"><a href="${pageContext.request.contextPath}/Personal/index.jsp">${user.username}</a></li>
						<li style="display:inline; margin-left:1rem"><a href="login.jsp">注销</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
</c:if>
<c:if test="${empty user }">
<header style="background-color:lightgray"> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"><a href="index.jsp"><img src="./Images/logo.png"/></a></div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top:20px">
					<ul style="padding-top:18px; padding-left:70%; font-size:15px;">
						<li style="display:inline"><a href="login.jsp">登陆</a></li>
						<li style="display:inline; margin-left:1rem"><a href="register.jsp">注册</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
</c:if>
<nav style="height:41px">
	<ul>
		<li><a href="index.jsp">首页</a></li>
		<li><a href="world.jsp">国际</a></li>
		<li><a href="lifestyle.jsp">生活</a></li>
		<li><a href="physical.jsp">体育</a></li>
		<li><a href="military.jsp" >政治</a></li>
		<li><a href="entertainment.jsp">娱乐</a></li>
		<li><a href="video.jsp" style="background:DimGray">视频</a></li>
		<form action="" id="search-form" method="get">
			<input class="form-control" id='search-text' name='q' placeholder='search news' type='text' style="display: inline-block; margin-top:4px; margin-left:32%; width:auto"/>
			<button id='search-button' type='submit' class="btn btn-default"><span>搜索</span></button>
		</form>
	</ul>
</nav>

<section id="content">
	<div class="zerogrid">
		<div class="row block">
			<div class="featured col16">
				<div class="rslides_container">
					<ul class="rslides" id="slider">
						
						<li><a href="news.jsp">  
							<video width="940" height="530" controls="controls">
       					 <source src="Videos/video_29.mp4" type="audio/mp4">
   						 </video>
   							</a>
   						</li>
						<li><a href="news.jsp">  
							<video width="940" height="530" controls="controls">
       					 <source src="Videos/video_30.mp4" type="audio/mp4">
   						 </video>
   							</a>
   						</li>
						<li><a href="video1.jsp">  
							<video width="940" height="530" controls="controls">
       					 <source src="Videos/video_25.mp4" type="audio/mp4">
   						 </video>
   							</a>
   						</li>
					</ul>
				</div>
			</div>
			<div class="sidebar col05">
				<section>
					<div class="heading">今日热点</div>
					<div class="content">
						<ul class="list">
							<li><a href="#">Free Html5 Templates</a></li>
							<li><a href="#">Free Css3 Templates</a></li>
							<li><a href="#">Free Responsive Html5 Templates</a></li>
							<li><a href="#">Free Basic Html5 Templates</a></li>
							<li><a href="#">Free Layout Html5 Templates</a></li>
						</ul>
					</div>
				</section>
				<section>
					<div class="heading">百态精选</div>
					<div class="content">
					<c:forEach items="${videos}" var="v">
						<section>
							<video width="100%" height="100%" controls="controls">
       					 		<source src="${v.vurl}" type="audio/mp4">
   						 	</video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This is Just Going To Be Another Test Post</a></h4>
						</section>
					</c:forEach>	
						
<!-- 						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_3.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This Is Going To Be A Decent Length Title With Little Text</a></h4>
							</section>
							<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_4.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This Is Going To Be A Decent Length Title With Little Text</a></h4>
							</section>
								<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_5.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_6.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This is Just Going To Be Another Test Post</a></h4>
						</section>
						
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_14.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This is Just Going To Be Another Test Post</a></h4>
						</section>
						
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_17.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_18.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This is Just Going To Be Another Test Post</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_19.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This Is Going To Be A Decent Length Title With Little Text</a></h4>
							</section>
							<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_20.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">This Is Going To Be A Decent Length Title With Little Text</a></h4>
							</section>
								<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_21.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_22.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_23.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_24.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_25.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>
						
						<section>
							<video width="100%" height="100%" controls="controls">
       					 <source src="Videos/video_27.mp4" type="audio/mp4">
   						 </video>
							<h4 style="margin-top:0.5rem"><a href="look.jsp">Sample post with, links, paragraphs and comments</a></h4>
						</section>-->
							
					</div> 
				</section>
				</div>
			
			<div class="main-content col11" style="width:640px;">
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_1.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_7.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_8.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_9.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_10.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_11.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_12.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_13.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_15.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_16.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_26.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				<article>
					<div class="heading">
						<h2><a href="#">Sample post with, links, paragraphs and comments</a></h2>
						<p class="info">+ Posted by Admin - 01/01/2016 - 0 Comments</p>
					</div>
					<div class="content">
						<video width="100%" height="540" controls="controls">
       					 <source src="Videos/video_28.mp4" type="audio/mp4">
   						 </video>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href="#">Have a look >></a></p>
					</div>
				</article>
				
			</div>
			
		</div>
	</div>
	</div>
</section>
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
</body></html>