<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0050)http://192.168.1.233:11585/shopping/user/login.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<title>用户登录页</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/public.css" type="text/css" rel="stylesheet">
							<link href="/css/goods.css" type="text/css" rel="stylesheet">
								<script src="/js/jquery-1.6.2.js"></script>
								<script src="/js/jquery.validate.min.js"></script>
								<script>
jQuery(document).ready(function(){
  jQuery("#theForm").validate({
     errorPlacement:function(error,element) {
      error.appendTo(element.parent().find(".login_error_sp"));  
	  element.parent().find(".login_error_sp").show('normal');
    },
	success:function(label){
	    label.parent().hide();
	},
	rules: {
			username: "required",
			password: "required",
			code:"required"},
		messages: {
			username: "用户名不能为空",
			password: "密码不能为空",
			code:"验证码不能为空"					}
  });
});
</script>
</head>
<body>
	<div class="main">
		<div class="head_login">
			<div class="login_logo" style="margin-top: 30px; padding-left: 80px;">
				<a href="http://192.168.1.233:11585/shopping/index.htm"><img
					src="/images/ff2232cb-7a55-47b2-b0b4-cd90793e5ea1.jpg" border="0"></a>
			</div>
		</div>
		<div class="index">
			<div class="index2">
				<div class="login_usertb">
					<div class="login_usetbox">
						<div class="login_usrin">
							<ul>
								<form action="/index/tologin" method="post" name="theForm"
									id="theForm" novalidate="novalidate">
									<li class="login_usertxt"><b>登录名：</b> <input
										name="username" type="text" id="username" class="login_utxt"
										autocomplete="off"> <span class="login_error_sp"
											style="display: none"></span></li>
									<li class="login_usertxt"><b>密&nbsp;&nbsp;&nbsp;码：</b> <input
										name="password" type="password" id="password"
										autocomplete="off" class="login_utxt"> <span
											class="login_error_sp" style="display: none"></span></li>
									<li class="login_usercode"><b>验证码：</b> <input name="code"
										type="text" id="code" autocomplete="off"
										style="text-transform: uppercase;" class="usecode"> <input
											name="verify_code" type="hidden" id="verify_code"
											value="02e656adee09f8394b402d9958389b7d"> <span
												class="login_codeimg"> <img style="cursor: pointer;"
													src="/index/imgcode" id="imgcode" onclick="refresh(this)"
													width="59" height="27" />
											</span> <a href="javascript:void(0);" onclick="refreshtext()"
												class="usenosee">看不清换一张</a> <span class="login_error_sp"
												style="display: none"></span></li>
									<li class="login_usercheck"><a
										href="http://192.168.1.233:11585/shopping/forget.htm"
										class="forgetpsw">忘记登录密码?</a><a href="/index/toregister"
										class="user_regist">免费注册</a></li>
									<li><input name="" type="submit" class="login_userbtn"
										value="登录">
											<p>${message!}</p></li>
								</form>
							</ul>
						</div>
					</div>
					<div class="login_usertb_bgimg">
						<span class="imgcenter_span">
							<p>
								<img src="/images/37f747a9-80b2-444f-803b-9561af30474d.jpg"
									width="490" height="400">
							</p>
						</span>
					</div>
				</div>
			</div>
		</div>
		<script>
function refresh(element) {
	//加入随机数的目的为了避免因为缓存机制的原因，导致请求路径相同而页面不刷新的问题
	element.src = "imgcode?r=" + Math.random();
}
function refreshtext() {
	var src= "imgcode?r=" + Math.random();
	$("#imgcode").attr("src",src);
}
jQuery(document).ready(function(){
			//滚动条滚动事件
	jQuery(window).scroll(function(){
	var top = jQuery(document).scrollTop();
	if(top==0){
		jQuery(".back_box").hide();
		}else{
		jQuery(".back_box").show();	
			}
	});						
});
</script>
		<div class="footer">
			<div class="footerArea">
				<ul>
					<li><a
						href="http://192.168.1.233:11585/shopping/article_join.htm"
						target="_blank">招聘英才</a>| <a
						href="http://192.168.1.233:11585/shopping/article_adver.htm"
						target="_blank">广告合作</a>| <a
						href="http://192.168.1.233:11585/shopping/article_contact.htm"
						target="_blank">联系我们</a>| <a
						href="http://192.168.1.233:11585/shopping/article_about.htm"
						target="_blank">关于shopping</a></li>
					<li class="hui2">Copyright 2015-2016 tongzhenshidai Inc. All
						rights reserved</li>
					<li class="hui2">Powered by 童臻时代</li>
					<li></li>
				</ul>
			</div>
		</div>


		<!--返回最顶部-->
		<div class="back_box"
			style="display: none; width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; _position: absolute; /*兼容IE6的代码*/ _bottom: auto; /*兼容IE6的代码*/ _top: expression(eval(document.documentElement.scrollTop + document.documentElement.clientHeight-this.offsetHeight- ( parseInt(this.currentStyle.marginTop, 10)||0)-(parseInt(this.currentStyle.marginBottom, 10)||0)));">
			<div class="back_index">
				<a href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank" title="返回主页"></a>
			</div>
			<div class="back_top">
				<a id="toTop"
					href="http://192.168.1.233:11585/shopping/user/login.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>

	</div>


</body>
</html>