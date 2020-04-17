<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${student.username }的个人主页</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
<!-- Google web font "Open Sans" -->
<link rel="stylesheet" href="./Css/fontawesome-all.min.css">
<link rel="stylesheet" href="./Css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./Css/magnific-popup.css" />
<link rel="stylesheet" type="text/css" href="./slick/slick.css" />
<link rel="stylesheet" type="text/css" href="./slick/slick-theme.css" />
<link rel="stylesheet" href="./Css/tooplate-style.css">
<link rel="stylesheet" href="./Css/menu.css">



<script>
	//选择图片，马上预览
	function xmTanUploadImg(obj) {
		var file = obj.files[0];
		console.log(obj);
		console.log(file);
		console.log("file.size = " + file.size);
		var reader = new FileReader();
		reader.onloadstart = function(e) {
			console.log("开始读取....");
		}
		reader.onprogress = function(e) {
			console.log("正在读取中....");
		}
		reader.onabort = function(e) {
			console.log("中断读取....");
		}
		reader.onerror = function(e) {
			console.log("读取异常....");
		}
		reader.onload = function(e) {
			console.log("成功读取....");
			var img = document.getElementById("avarimgs");
			img.src = e.target.result;
			//或者 img.src = this.result;  //e.target == this
		}
		reader.readAsDataURL(file)
	}
</script>
<script>
	var renderPage = true;

	if (navigator.userAgent.indexOf('MSIE') !== -1
			|| navigator.appVersion.indexOf('Trident/') > 0) {
		/* Microsoft Internet Explorer detected in. */
		alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
		renderPage = false;
	}
</script>
</head>
<header class="tou" style="background-color: lightgray">
	<div class="zerogrid">
		<div class="row">
			<div class="col05" style="padding-left: 200px;">
				<div id="logo">
					<a href="./index.jsp"><img src="./img/logo.png" /></a>
				</div>
			</div>
			<div class="col06 offset05">
				<div style="padding-top: 20px">
					<ul
						style="padding-top: 10px; padding-left: 650px; font-size: 18px;">
						<li style="display: inline"><font size="3"
							style="color: darkgreen">欢迎您</font></li>
						<li style="display: inline; margin-left: 1rem"><font size="3"
							style="color: darkgreen">${user.username}</font></li>
						<li style="display: inline"><a href="./login.jsp"
							style="text-decoration: none"><font
								style="color: rgb(0, 0, 0)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注销</font></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>
<nav class="hang" style="height: 41px" float="right">
	<ul>
		<!-- <li><a href="./index.jsp">首页</a></li>
				<li><a href="./world.jsp">国际</a></li>
				<li><a href="./lifestyle.jsp">生活</a></li>
				<li><a href="./physical.jsp">体育</a></li>
				<li><a href="./military.jsp">军事</a></li>
				<li><a href="/entertainment.jsp">娱乐</a></li>
				<li><a href="./video.jsp">视频</a></li> -->
		<form action="" id="search-form" method="get">
			<input class="form-control" id='search-text' name='q'
				placeholder='search news' type='text'
				style="display: inline-block; margin-top: 0px; margin-left: 21%; height: 10%; width: 30%" />
			<button id='search-button' type='submit' class="btn btn-default">
				<span>搜索</span>
			</button>
		</form>
	</ul>
</nav>


<body>

	<!-- Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>

	<!-- Page Content -->
	<div class="container-fluid tm-main">
		<div class="row tm-main-row">

			<!-- Sidebar -->
			<div id="tmSideBar"
				class="col-xl-3 col-lg-4 col-md-12 col-sm-12 sidebar">

				<button id="tmMainNavToggle" class="menu-icon">&#9776;</button>

				<div class="inner">
					<nav id="tmMainNav" class="tm-main-nav">
						<ul>
							<li><a href="#intro" id="tmNavLink1" class="scrolly active"
								data-bg-img="constructive_bg_01.jpg" data-page="#tm-section-1">
									<i class="fas fa-home tm-nav-fa-icon"></i> <span>个人信息</span>
							</a></li>
							<li><a href="#products" id="tmNavLink2" class="scrolly"
								data-bg-img="constructive_bg_02.jpg" data-page="#tm-section-2"
								data-page-type="carousel"> <i
									class="fas fa-map tm-nav-fa-icon"></i> <span>历史记录</span>
							</a></li>
							<li><a href="#company" class="scrolly"
								data-bg-img="constructive_bg_03.jpg" data-page="#tm-section-3">
									<i class="fas fa-users tm-nav-fa-icon"></i> <span>修改密码</span>
							</a></li>
							<li><a href="#contact" class="scrolly"
								data-bg-img="constructive_bg_04.jpg" data-page="#tm-section-4">
									<i class="fas fa-comments tm-nav-fa-icon"></i> <span>信息修改</span>
							</a></li>

						</ul>
					</nav>
				</div>
			</div>

			<div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 tm-content">

				<!-- section 1 -->
				<section id="tm-section-1" class="tm-section">
					<div class="ml-auto">
						<!--标题 -->
						<header class="mb-4">
							<h3 class="tm-text-shadow">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
								</div>
							</h3>
						</header>
						<div class="am-cf am-padding"></div>
						<hr />
						<form action="${pageContext.request.contextPath }/FileServlet"
							method="post" enctype="multipart/form-data">
							<input type="file" name="filename"><br> <input
								type="submit" value="文件上传">
						</form>
						<!--头像 -->
						<div class="user-infoPic">

							<div class="wocao">
								<img src="${user.uimage} "
									class="img-circle img-thumbnail img-responsive" id="avarimgs"
									width="150px">
							</div>

							<div class="info-m">
								<div>
									<b>用户名：<i>${user.username}</i></b>
								</div>
								<div>
									<b>用户姓名：<i>${user.realname}</i></b>
								</div>
								<div class="gendar">
									<div>
										<b>性别：<i>${user.gender}</i></b>
									</div>
								</div>
								<div>
									<b>Email：<i>${user.email}</i></b>
								</div>
								<div>
									<b>电话号码：<i>${user.telephone}</i></b>
								</div>
								<div>
									<b>生日：<i>${user.birthday}</i></b>
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>
						<h7>
						<a href="#" class="btn tm-btn tm-font-big"
							data-nav-link="#tmNavLink2" float="right">More</a></h7>
						<!-- data-nav-link holds the ID of nav item, which means this link should behave the same as that nav item  -->
					</div>
				</section>

				<!-- section 2 -->
				<section id="tm-section-2" class="tm-section tm-section-carousel">
					<div>
						<header class="mb-4">
							<h2 class="tm-text-shadow">历史记录/History</h2>
						</header>
						<div class="tm-img-container">
							<div class="tm-img-slider">
								<div>
									<a href="#"><h3>1232132</h3></a>
								</div>
								<br>
								<div>
									<a href="#"><h3>1233128</h3></a>
								</div>
								<br>
								<div>
									<a href="#"><h3>123</h3></a>
								</div>
								<br>
								<div>
									<a href="#"><h3>123</h3></a>
								</div>
								<br>
								<div>
									<a href="#"><h3>123</h3></a>
								</div>
								<br>
								<div>
									<a href="#"><h3>123</h3></a>
								</div>
								<br>
							</div>
						</div>
					</div>
				</section>

				<section id="tm-section-3" class="tm-section">
					<div class="row mb-4">
						<header class="col-xl-12">
							<h2 class="tm-text-shadow">修改密码</h2>
						</header>
					</div>
					<!--   <div class="row">
       <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
        <div class="media tm-bg-transparent-black tm-border-white">
         <a href="http://www.apple.com/cn/"  style="text-decoration:none"   target="_blank"> <i class="fab fa-apple tm-icon-circled tm-icon-media"   ></i></a >
         <div class="media-body">
          <h3>苹果9月发布新机</h3>
          <p>据美国媒体最新报道称，有苹果内部人士已经向他们透露，今年该公司的秋季新品发布会将在9月10日举行，而届时发布会的主角会是三款新iPhone，不过由于它们的升级幅度并不大，所以用户关注的热情并不算太高。</p > 
         </div>
        </div>
       </div> 
       <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
        <div class="media tm-bg-transparent-black tm-border-white">
         <a href="http://fiba.qq.com/fibawc/"  style="text-decoration:none"  target="_blank"><i class="fas fa-map-pin mr-4 tm-icon-circled tm-icon-media"></i> </a >
         <div class="media-body">
          <h3>2019年篮球世界杯</h3>
          <p>2019年国际篮联篮球世界杯，将于2019年8月31日至9月15日在中国的北京、广州、南京、上海、武汉、深圳、佛山、东莞八座城市举行。 包括东道主中国国家男子篮球队在内的32支球队参加。</p > 
         </div>
        </div>
       </div>
       <div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
        <div class="media tm-bg-transparent-black tm-border-white">
         <a href="http://piaofang.maoyan.com/dashboard"  style="text-decoration:none"  target="_blank"><i class="fab fa-fly mr-4 tm-icon-circled tm-icon-media"></i><a>
         <div class="media-body">
          <h3>《哪吒》进入票房榜前三</h3>
          <p>据猫眼数据，国产动画《哪吒之魔童降世》累计票房达到42.4亿元，超过《复仇者联盟4》在3个月前创下的成绩，升至中国票房总榜第三位。至此，国产影片也将中国影史票房榜前三全部收回囊中。</p >  
         </div>
        </div>
       </div>
       	<div class="col-sm-12 col-md-6 col-lg-12 col-xl-6 mb-4">
        <div class="media tm-bg-transparent-black tm-border-white">
        <a href="http://typhoon.weather.com.cn/ "   style="text-decoration:none" target="_blank" ><i class="fab fa-linode mr-4 tm-icon-circled tm-icon-media"></i></a > 
         <div class="media-body">
          <h3>台风“白鹿”生成</h3>
          <p>从目前的路径概率预报来看，台风“白鹿”直指我国，预计将以每小时15公里左右的速度向西北方向移动，强度逐渐加强，并可能于24-25日以台风级或强热带风暴级先后登陆台湾、福建沿海。</p > 
         </div>
        </div>
       </div>               
      </div>    -->
					<div class="tm-bg-transparent-black tm-contact-box-pad"
						style="background-color: gray, filter:alpha(Opacity = 80); -moz-opacity: 0.80; opacity: 0.80">
						<div class="row mb-4">
							<div class="col-sm-12">
								<header>
									<h2 class="tm-text-shadow">修改密码/Information modification</h2>
								</header>
							</div>
						</div>
						<div class="row tm-page-4-content">
							<div class="col-md-6 col-sm-12 tm-contact-col">
								<div class="contact_message">
									<form action="/zzxx_news/UpdatePwdServlet" method="post"
										class="contact-form">
										<div class="form-group">
											<input type="password" id="password" name="password"
												id="password" class="form-control" placeholder="请输入您的密码"
												required="">
										</div>
										<div class="form-group">
											<input type="password" id="repassword" name="repassword"
												id="repassword" class="form-control" placeholder="再次输入密码"
												required="">
										</div>
										<div class="form-group">
											<input type="password" id="newPassword" name="newPassword"
												id="newPassword" class="form-control" placeholder="请输入新密码"
												required="">
										</div>

										<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">确认修改</button>
									</form>

								</div>
							</div>
							<div class="col-md-6 col-sm-10 tm-contact-col">
								<div class="tm-address-box">
									<p></p>
									<p></p>
									<address>
										<br> <br>

									</address>
								</div>

							</div>

						</div>
					</div>
				</section>
				<div class="tlinks">
					Collect from <a href="http://www.cssmoban.com/">建站模板</a>
				</div>

				<!-- section 4 -->
				<section id="tm-section-4" class="tm-section">
					<div class="tm-bg-transparent-black tm-contact-box-pad">
						<div class="row mb-4">
							<div class="col-sm-12">
								<header>
									<h2 class="tm-text-shadow">信息修改/Information modification</h2>
								</header>
							</div>
						</div>
						<div class="row tm-page-4-content">
							<div class="col-md-6 col-sm-12 tm-contact-col">
								<div class="contact_message">
									<form action="/zzxx_news/UpdateServlet" method="get"
										class="contact-form">
										<div class="form-group">
											<input type="text" id="contact_name" name="username"
												id="username" value="${user.username}" class="form-control"
												placeholder="用户名" required="">
										</div>
										<div class="form-group">
											<input type="password" id="password" name="password"
												id="password" class="form-control" placeholder="密码"
												required="">
										</div>
										<div class="form-group">
											<input type="password" id="repassword" name="repassword"
												id="repassword" class="form-control" placeholder="确认密码"
												required="">
										</div>
										<div class="form-group">
											<input type="email" name="email" id="email"
												class="form-control" placeholder="Email" required="">
										</div>

										<div class="form-group">
											性别： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;男<input type="radio"
												id="gender" name="gender" class="form-male" value="m"
												placeholder="" required="">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;女<input
												type="radio" id="gender" name="gender" class="form-female"
												value="f" placeholder="" required="">
										</div>
										<div class="form-group">
											<input type="text" id="telephone" name="telephone"
												class="form-control" placeholder="电话" required="">
										</div>
										<div class="form-group">
											<input type="text" id="realname" name="realname"
												class="form-control" placeholder="姓名" required="">
										</div>
										<div class="form-group">
											<input type="date" id="birthday" name="birthday"
												class="form-control" placeholder="生日" required="">
										</div>

										<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">提交</button>
									</form>

								</div>
							</div>
							<div class="col-md-6 col-sm-10 tm-contact-col">
								<div class="tm-address-box">
									<p></p>
									<p></p>
									<address>
										<br> <br>

									</address>
								</div>

							</div>

						</div>
					</div>
				</section>
			</div>
			<!-- .tm-content -->


			<!-- section 3 -->
			<section id="tm-section-5" class="tm-section">
				<div class="tm-bg-transparent-black tm-contact-box-pad">
					<div class="row mb-4">
						<div class="col-sm-12">
							<header>
								<h2 class="tm-text-shadow">修改密码/Password modification</h2>
							</header>
						</div>
					</div>
					<div class="row tm-page-4-content">
						<div class="col-md-6 col-sm-12 tm-contact-col">
							<div class="contact_message">
								<form action="/zzxx_news/UpdatePwdServlet" method="get"
									class="contact-form">
									<div class="form-group">
										<input type="password" id="password" name="password"
											id="password" class="form-control" placeholder="密码"
											required="">
									</div>
									<div class="form-group">
										<input type="password" id="repassword" name="repassword"
											id="repassword" class="form-control" placeholder="确认密码"
											required="">
									</div>


									<button type="submit" class="btn tm-btn-submit tm-btn ml-auto">提交</button>
								</form>

							</div>
						</div>
						<div class="col-md-6 col-sm-10 tm-contact-col">
							<div class="tm-address-box">
								<p></p>
								<p></p>
								<address>
									<br> <br>

								</address>
							</div>

						</div>

					</div>
				</div>
			</section>
		</div>


		<footer class="footer-link"> </footer>
	</div>
	<!-- row -->
	</div>
	<div id="preload-01"></div>
	<div id="preload-02"></div>
	<div id="preload-03"></div>
	<div id="preload-04"></div>

	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/jquery.magnific-popup.min.js"></script>
	<script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="slick/slick.min.js"></script>
	<!-- Slick Carousel -->

	<script>
		var sidebarVisible = false;
		var currentPageID = "#tm-section-1";

		// Setup Carousel
		function setupCarousel() {

			// If current page isn't Carousel page, don't do anything.
			if ($('#tm-section-2').css('display') == "none") {
			} else { // If current page is Carousel page, set up the Carousel.

				var slider = $('.tm-img-slider');
				var windowWidth = $(window).width();

				if (slider.hasClass('slick-initialized')) {
					slider.slick('destroy');
				}

				if (windowWidth < 640) {
					slider.slick({
						dots : true,
						infinite : false,
						slidesToShow : 1,
						slidesToScroll : 1
					});
				} else if (windowWidth < 992) {
					slider.slick({
						dots : true,
						infinite : false,
						slidesToShow : 2,
						slidesToScroll : 1
					});
				} else {
					// Slick carousel
					slider.slick({
						dots : true,
						infinite : false,
						slidesToShow : 3,
						slidesToScroll : 2
					});
				}

				// Init Magnific Popup
				$('.tm-img-slider').magnificPopup({
					delegate : 'a', // child items selector, by clicking on it popup will open
					type : 'image',
					gallery : {
						enabled : true
					}
				// other options
				});
			}
		}

		// Setup Nav
		function setupNav() {
			// Add Event Listener to each Nav item
			$(".tm-main-nav a").click(function(e) {
				e.preventDefault();

				var currentNavItem = $(this);
				changePage(currentNavItem);

				setupCarousel();
				setupFooter();

				// Hide the nav on mobile
				$("#tmSideBar").removeClass("show");
			});
		}

		function changePage(currentNavItem) {
			// Update Nav items
			$(".tm-main-nav a").removeClass("active");
			currentNavItem.addClass("active");

			$(currentPageID).hide();

			// Show current page
			currentPageID = currentNavItem.data("page");
			$(currentPageID).fadeIn(1000);

			// Change background image
			var bgImg = currentNavItem.data("bgImg");
			$.backstretch("img/" + bgImg);
		}

		// Setup Nav Toggle Button
		function setupNavToggle() {

			$("#tmMainNavToggle").on("click", function() {
				$(".sidebar").toggleClass("show");
			});
		}

		// If there is enough room, stick the footer at the bottom of page content.
		// If not, place it after the page content
		function setupFooter() {

			var padding = 100;
			var footerPadding = 40;
			var mainContent = $("section" + currentPageID);
			var mainContentHeight = mainContent.outerHeight(true);
			var footer = $(".footer-link");
			var footerHeight = footer.outerHeight(true);
			var totalPageHeight = mainContentHeight + footerHeight
					+ footerPadding + padding;
			var windowHeight = $(window).height();

			if (totalPageHeight > windowHeight) {
				$(".tm-content").css("margin-bottom",
						footerHeight + footerPadding + "px");
				footer.css("bottom", footerHeight + "px");
			} else {
				$(".tm-content").css("margin-bottom", "0");
				footer.css("bottom", "20px");
			}
		}

		// Everything is loaded including images.
		$(window).on(
				"load",
				function() {

					// Render the page on modern browser only.
					if (renderPage) {
						// Remove loader
						$('body').addClass('loaded');

						// Page transition
						var allPages = $(".tm-section");

						// Handle click of "Continue", which changes to next page
						// The link contains data-nav-link attribute, which holds the nav item ID
						// Nav item ID is then used to access and trigger click on the corresponding nav item
						var linkToAnotherPage = $("a.tm-btn[data-nav-link]");

						if (linkToAnotherPage != null) {

							linkToAnotherPage.on("click", function() {
								var navItemToHighlight = linkToAnotherPage
										.data("navLink");
								$("a" + navItemToHighlight).click();
							});
						}

						// Hide all pages
						allPages.hide();

						$("#tm-section-1").fadeIn();

						// Set up background first page
						var bgImg = $("#tmNavLink1").data("bgImg");

						$.backstretch("img/" + bgImg, {
							fade : 500
						});

						// Setup Carousel, Nav, and Nav Toggle
						setupCarousel();
						setupNav();
						setupNavToggle();
						setupFooter();

						// Resize Carousel upon window resize
						$(window).resize(function() {
							setupCarousel();
							setupFooter();
						});
					}
				});
	</script>
</body>
</html>

