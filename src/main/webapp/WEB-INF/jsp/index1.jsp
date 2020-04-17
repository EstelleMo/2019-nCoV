<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>Welcome to zzxxNews!</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<link rel="stylesheet" href="./Css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="./Css/zerogrid.css">
	<link rel="stylesheet" href="./Css/style.css">
	<link rel="stylesheet" href="./Css/responsiveslides.css" />
	<link rel="stylesheet" href="./Css/responsive.css">
	<link href='./Images/favicon.ico' rel='icon' type='image/x-icon'/>
	
	<script src="../Js/jquery.min.js"></script>
	<script src="../Js/responsiveslides.js"></script>
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
<body style="background-color:black">
<c:if test="${!empty user}">
<header style="background-color:lightgray"> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"><a href="${pageContext.request.contextPath }/"><img src="zzxxNews1/src/main/webapp/WEB-INF/jsp/Images/logo.png"/></a></div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top:20px">
					<ul style="padding-top:18px; padding-left:70%; font-size:13px;">
						<li style="display:inline"><a href="${pageContext.request.contextPath}/Personal/index">${user.username}</a></li>
						<li style="display:inline; margin-left:1rem"><a href="${pageContext.request.contextPath}/user/logout">退出</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
</c:if>
<c:if test="${empty user}">
<header style="background-color:lightgray;"> 
	<div class="zerogrid">
		<div class="row">
			<div class="col05">
				<div id="logo"><a href="${pageContext.request.contextPath }/"><img src="./Images/logo.png"/></a></div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top:20px">
					<ul style="padding-top:18px; padding-left:70%; font-size:15px;">
						<li style="display:inline"><a href="${pageContext.request.contextPath}/login">登陆</a></li>
						<li style="display:inline; margin-left:1rem"><a href="${pageContext.request.contextPath}/register">注册</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
</c:if>
<script type="text/javascript">
								$(function(){
									$("#word").keyup(function(){
										$.get(
											"${pageContext.request.contextPath}/FindAllNewsServlet",
											{
												"word":$("#word").val()
											},
											function(data){
												$("#list").empty();
												for(var i=0;i<data.length;i++){
													if(i>5){
														break;
													}
													$("#list").append("<a href=${pageContext.request.contextPath}+'/nid="+data[i].nid+"'><div style='cursor:pointer' onmouseover='over(this)' onmouseout='out(this)' onmousedown='go(this)'>"+data[i].title+"</div></a >");
												}
												$("#list").css("display","block");
											},
											"json"	
										);
									})
									/* 
									$("#more").onclick(function(){
										$.get(
											"${pageContext.request.contextPath}/FindMoreNewsServlet",
											{
												"hiddennum":$("#hiddennum").val()
											},
											function(data){
												for(var i=0;i<data.length;i++){
													$("#allnewslist").append("<article><div class='heading'><h2><a href='OpenNewsServlet?nid="+data[i].nid+"&index="+ParseInt($("#hiddennum").val())*10+i+1+"'>"+data[i].title+"</a></h2><p class='info'>Posted on"+data[i].newstime+"--"+data[i].commentsCount+"Comments</p></div><div class='content'><img "+${!empty data[i].image ? "" : "style='display: none'"}+" src="+data[i].image+" height='150px' width='195px'/><p>"+data[i].content+"</p></div><div class='footer'><p class='more'><a class='button' href='OpenNewsServlet?nid="+data[i].nid+"&index="+ParseInt($("#hiddennum").val())*10+i+1+"'>Read more >></a></p></div></article>");
												}
												$("#hiddennum").val(ParseInt($("#hiddennum").val())+1)
											},
											"json"	
												
										);
									}) */
								})
								function over(obj){
									$(obj).css("background-color","gray")
								}
								function out(obj){
									$(obj).css("background-color","white")
								}
								function go(obj){
									$("#word").val($(obj).html());
									$("#list").css("display","none");
								}
								$("#word").blur(function(){
						 			$("#list").css("display", "none");
						 		}); 
						 		$("#word").focus(function(){
						 			$("#list").css("display", "block");
						 		});
</script>
<nav style="height:45px">
	<ul style="background-color:gray">
		<li><a href="${pageContext.request.contextPath}/" style="background: DimGray">首页</a></li>
	
		<c:forEach items="${typeList }" var="types" >
		<li><a href="${pageContext.request.contextPath}/${types.typeplus }">${types.typename}</a></li>
		</c:forEach>
		
		<li><a href="${pageContext.request.contextPath}/video">视频</a></li>
		<form action="" id="search-form" method="get">
			<input class="form-control" id='word' name='q' placeholder='search news' type='text' style="display: inline-block; margin-top:4px; margin-left:32%; width:auto"/>
			<div id="list" style="width:172px; left:860px; top:130px; border:1px solid gray;
									 background-color: white; position:absolute; z-index:1000; display:none"></div>
			<button id='search-button' type='submit' class="btn btn-default"><span>搜索</span></button>
		</form>
	</ul>
</nav>

<section id="content">
	<div class="zerogrid">
		<div class="row block">
			<div class="featured col16">
				<div class="rslides_container" style="text-align:center">
				<!-- 轮播图:轮播今日要闻 -->
					<ul class="rslides" id="slider">
					<c:forEach items="${todayNewsList}" var="todaynews">
						<li><a href="OpenNewsServlet?nid=${todaynews.nid}">
						<img src="${todaynews.image}" style="height:303px"/>
						<div style="font-size:20px">${todaynews.title}</div>
						</a>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<div class="sidebar col05">
				<section>
					<div class="heading"><a href="todaynews.jsp">今日要闻</a></div>
					<div class="content">
						<ul class="list">
							<c:forEach items="${todayNewsList}" var="todaynews">
								<li><a href="OpenNewsServlet?nid=${todaynews.nid}">${todaynews.title}</a></li>
							</c:forEach>		
						</ul>
					</div>
				</section>
				<section>
					<div class="heading"><a href="hotnews.jsp">热点精选</a></div>
					<div class="content">
						<c:forEach items="${hotNewsList}" var="hotnews">
							<section style="height:80px">
								<img src="${hotnews.image}" width="60px" height="80px"/>
								<h4><a href="OpenNewsServlet?nid=${hotnews.nid}">${hotnews.title}</a></h4>
							</section>
						</c:forEach>
					</div>
				</section>
				</div>
			<!-- 所有新闻展示 -->
			<div class="main-content col11" style="width:640px;" id="">
			<c:forEach items="${allNewsList}" var="news" varStatus="status">
				<article>
					<div class="heading">
						<p class="info">Posted on ${news.newstime} -- ${news.commentsCount} Comments</p>
					</div>
					<div class="content">
						<img ${!empty news.image ? "" : "style='display: none'"} src="${news.image}" height="150px" width="195px"/>
						<p>${news.content}</p>
					</div>
					<div class="footer">
						<p class="more"><a class="button" href=" OpenNewsServlet?nid=${news.nid}&index=${status.count}">Read more >></a></p>
					</div>
				</article>
			</c:forEach>
			<!-- 加载更多 -->
			<!-- <form action="">
				<input type="hidden" name="hiddennum" id="hiddennum" value="2"/>
				<button id='more' type='submit'><span>加载更多</span></button>
			</form>
			</div> -->
			
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