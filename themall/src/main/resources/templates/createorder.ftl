<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://192.168.1.233:11585/shopping/goods_cart3.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>生成订单页</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/public.css" type="text/css" rel="stylesheet">
							<link href="/css/goods.css" type="text/css" rel="stylesheet">
								<link href="/css/overlay.css" type="text/css" rel="stylesheet">
									<script src="/js/jquery-1.6.2.js"></script>
									<script src="/js/jquery-ui-1.8.21.js"></script>
									<script src="/js/jquery.shop.common.js"></script>
									<script>
//支付函数
function pay(){
	var orderId = jQuery("#order_id").val();
	window.location.href = "/goods/payorder2?orderid="+orderId;
}
//返回当前页面高度
function order_pay(){
	
  var h=document.body.clientHeight;
  var top= document.documentElement.scrollTop;
  top=top+(h-top)/2;
  jQuery('.black_overlay').css("height",h);
  jQuery(".white_content").css("top",top);
  
  var payType = jQuery('#selectpay input[name="payType"]:checked ').val();
  var orderId = jQuery("#order_id").val();
  
  
  if(payType=="wxcodepay"){
  	var html = '';
  	console.log(666)
  	jQuery.get("/goods/payorder2",{"orderid":orderId},function(data){
  		html += data;
		jQuery(html).appendTo("#wxPayCode");
		jQuery("#wxcodepay_overlay").show();
  	},"text");
  	/* jQuery.ajax({type:'POST',url:"http://192.168.1.233:11585/shopping/wechat/wxcodepay.htm",async:false,data:{"order_id":orderId},success:function(html){
		jQuery("#wxPayCode").html(html);
		jQuery("#wxcodepay_overlay").show();
	}}); */ 
  } else {
  	jQuery('#pay_overlay').show();
  	jQuery('#theForm').submit();
  }
  
}

jQuery(document).ready(function() {	
	var pprice = jQuery("#pprice").val();
	if(pprice == 0.0){
		//如果获取到支付价格为0的话，那么就可以支付宝和微信隐藏
		 $("#onpay").hide();
		 $("#alipay").hide();
		 $("#wx").hide();
	}
});

window.onscroll=function(){
  var h=document.body.clientHeight;
  var top= document.documentElement.scrollTop;
  top=top-50+(h-top)/2;
  jQuery(".white_content").css("top",top);
}
</script>
</head>
<body>

	<div class="top" style="">
		<div class="top_page">
			<div class="pageright" id="site-nav">
				<ul class="quick-menu">
					<li class="mytaobao menu-item menupx">
						<div class="menu">
							<a class="menu-hd"
								href="http://192.168.1.233:11585/shopping/buyer/index.htm"
								rel="nofollow">我的订单<b></b></a>
							<div class="menu-bd">
								<div class="menu-bd-panel">

									<div>
										<!-- <a href="http://192.168.1.233:11585/shopping/buyer/order.htm" rel="nofollow">已买到的宝贝</a>
	                <a href="http://192.168.1.233:11585/shopping/buyer/index.htm?type=4"  rel="nofollow">店铺动态</a>
	                <a href="http://192.168.1.233:11585/shopping/buyer/index.htm?type=2"  rel="nofollow">好友动态</a> -->
										<a
											href="http://192.168.1.233:11585/shopping/buyer/order.htm?order_status=order_submit"
											rel="nofollow">待支付</a> <a
											href="http://192.168.1.233:11585/shopping/buyer/order.htm?order_status=order_shipping"
											rel="nofollow">待收货</a> <a
											href="http://192.168.1.233:11585/shopping/buyer/order.htm?order_status=order_receive"
											rel="nofollow">待评价</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="mytaobao menu-item menupx">
						<div class="menu">
							<a class="menu-hd"
								href="http://192.168.1.233:11585/shopping/seller/index.htm"
								rel="nofollow">商家支持<b></b></a>
							<div class="menu-bd">
								<div class="menu-bd-panel">
									<div>
										<a href="http://192.168.1.233:11585/shopping/seller/index.htm"
											rel="nofollow">商家中心</a> <a
											href="http://192.168.1.233:11585/shopping/seller/order.htm"
											rel="nofollow">商家订单</a> <a
											href="http://192.168.1.233:11585/shopping/seller/goods.htm"
											rel="nofollow">商家商品</a> <a
											href="http://192.168.1.233:11585/shopping/store_32865.htm"
											rel="nofollow">我的店铺</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<script>
		 var goods_count=0;
		 var total_price=0;
		 		 		function cart_remove(id,store_id){
			  
           jQuery.post('http://192.168.1.233:11585/shopping/remove_goods_cart.htm',{"id":id,"store_id":store_id},function(data){
           jQuery("div[class=table] tr[id="+id+"]").remove();
		   jQuery(".shopping[id="+id+"]").remove();
		   jQuery(".shopp_ingtop[id="+id+"]").remove();
           jQuery("#cart_goods_count_top").html(data.count);
           jQuery("#cart_goods_price_top").html(data.total_price);
		   jQuery("#top_total_price_"+store_id).html(data.total_price);
           if(store_id!=""){
              jQuery("#total_price_"+store_id).html(data.sc_total_price);
           }
		   if( jQuery("form[id=cart_"+store_id+"]").find("tr[goods_list^=goods_info]").length==0){
		  	 jQuery("form[id=cart_"+store_id+"]").remove();
		   }
           if(jQuery("tr[goods_list^=goods_info]").length==0){
              jQuery(".car_nogoods").show();
           }
         },"json");
       }
	    jQuery(document).ready(function(){
		   jQuery("#cart_goods_top_menu").mouseover(function(){
			  jQuery.ajax({type:'POST',url:'http://192.168.1.233:11585/shopping/cart_menu_detail.htm',data:'',
						   beforeSend:function(){
							     jQuery("#cart_goods_top_info").empty().html('<div class="menu-bd-panel"><div style="text-align:center;"><img src="http://192.168.1.233:11585/shopping/resources/style/common/images/loader.gif" /></div></div>');
							     jQuery("#cart_goods_top_info").show();
							   },
						  success:function(data){
							     jQuery("#cart_goods_top_info").empty();
								 jQuery("#cart_goods_top_info").html(data);
							   }
						});
		   });
		   jQuery("#cart_menu").mouseleave(function(){
			  jQuery("#cart_goods_top_info").hide();
		   });
		});
	   </script>
					<li class="search menu-item menupx">
						<div class="menu" id="cart_menu">
							<span class="menu-hd" id="cart_goods_top_menu"><s></s>购物车<span
								id="cart_goods_count_top" class="top_car">0</span>种商品<b></b></span>
							<div class="menu-bd" id="cart_goods_top_info">
								<div class="menu-bd-panel">
									<div style="text-align: center;">
										<img src="/images/loader.gif">
									</div>
								</div>

							</div>
						</div>
					</li>
					<li class="menupx"><a
						href="http://192.168.1.233:11585/shopping/buyer/message.htm">站内短信</a></li>

					<li class="mytaobao menu-item menupx">
						<div class="menu">
							<a class="menu-hd"
								href="http://192.168.1.233:11585/shopping/buyer/favorite_goods.htm"
								rel="nofollow">收藏夹<b></b></a>
							<div class="menu-bd">
								<div class="menu-bd-panel">
									<div>
										<a
											href="http://192.168.1.233:11585/shopping/buyer/favorite_goods.htm"
											rel="nofollow">收藏商品</a> <a
											href="http://192.168.1.233:11585/shopping/buyer/favorite_store.htm"
											rel="nofollow">收藏店铺</a>

									</div>
								</div>
							</div>
						</div>
					</li>

					<li class="menupx" style="background: none;"><a
						href="http://192.168.1.233:11585/shopping/articlelist_help.htm">帮助中心</a></li>
				</ul>
			</div>
			<div class="pageleft">
				<span>${user.userName}您好,欢迎来到童臻时代！</span><a
					href="http://192.168.1.233:11585/shopping/shopping_logout.htm"
					class="lightblue">[退出]</a>
			</div>
		</div>
	</div>

	<div class="main">
		<script>
jQuery(document).ready(function(){
  jQuery(".toph_bgsear li").mouseover(function(){
	  
      jQuery(".toph_bgsear>li").show();
  }).mouseleave(function(){
       jQuery(".toph_bgsear>li").last().hide();
  }).click(function(){
	 
	 var index=jQuery(this).index();
	 if(index==1){
	   var f_text=jQuery(".toph_bgsear li").find("a").first().text();
	   var f_type= jQuery(".toph_bgsear li").first().attr("type");
       jQuery(".toph_bgsear li").find("a").first().html(jQuery(this).find("a").text()+"<s></s>");
	   jQuery(".toph_bgsear li").find("a").last().text(f_text);
	   jQuery("#type").val(jQuery(this).attr("type"));
	   jQuery(".toph_bgsear li").first().attr("type",jQuery(this).attr("type"));
	   jQuery(".toph_bgsear li").last().attr("type",f_type);
	   jQuery(".toph_bgsear>li").last().hide();
	 }
  });

  jQuery(".two_code_a").click(function(){
	  jQuery(this).parent().remove();
	  });
	
});
function search_form(){
	
  var keyword=arguments[0];
  var type=arguments[1];
  if(keyword!=""&&keyword!=undefined){
   jQuery("#keyword").val(keyword);
  }
  if(type!=""&&type!=undefined){
    jQuery("#type").val(type);
  }
  jQuery("#searchForm").submit();	
  jQuery("#keyword").val("");
}
</script>

		<div id="header_form">
			<script src="/js/jquery.cookie.js"></script>
			<div id="head_h" class="head_width">
				<div class="head clearFix">
					<div class="logo">
						<a href="http://192.168.1.233:11585/shopping/index.htm"> <img
							src="/images/ff2232cb-7a55-47b2-b0b4-cd90793e5ea1.jpg" border="0"></a>
					</div>
					<div class="searchForm">
						<form action="http://192.168.1.233:11585/shopping/search.htm"
							method="post" target="_blank" id="searchForm">
							<input name="type" type="hidden" id="type" value="goods">
								<div class="toph_bigsearch">
									<div class="toph_sear">
										<ul class="toph_bgsear">
											<li class="this" type="goods"><a
												href="javascript:void(0);">宝贝<s></s></a></li>
											<li style="display: none" type="store"><a
												href="javascript:void(0);">店铺</a></li>
										</ul>
										<input name="keyword" type="text" id="keyword"
											placeholder="搜索其实真的很简单！" x-webkit-speech="" lang="zh-CN"
											onwebkitspeechchange="jQuery(&#39;#searchForm&#39;).submit()"
											class="toph_sear_txt"> <input name="input"
											type="button" value="搜索" style="cursor: pointer;"
											onclick="search_form();" class="toph_sear_btn">
									</div>
									<div class="keyword">
										<a href="javascript:void(0);"
											onclick="search_form(&#39;童装&#39;,&#39;goods&#39;);">童装</a> <a
											href="javascript:void(0);"
											onclick="search_form(&#39;童鞋&#39;,&#39;goods&#39;);">童鞋</a> <a
											href="javascript:void(0);"
											onclick="search_form(&#39;餐具&#39;,&#39;goods&#39;);">餐具</a> <a
											href="javascript:void(0);"
											onclick="search_form(&#39;奶粉&#39;,&#39;goods&#39;);">奶粉</a> <a
											href="javascript:void(0);"
											onclick="search_form(&#39;玩具&#39;,&#39;goods&#39;);">玩具</a> <a
											href="javascript:void(0);"
											onclick="search_form(&#39;笔记本&#39;,&#39;goods&#39;);">笔记本</a>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="index">
			<div class="index2">
				<div class="Steps">
					<ul>
						<li>1.查看购物车</li>
						<li>2.确认订单信息</li>
						<li class="this">3.付款到卖家</li>
						<li>4.确认收货</li>
						<li class="last">5.评价</li>
					</ul>
				</div>
				<form action="http://192.168.1.233:11585/shopping/order_pay.htm"
					method="post" target="_blank" id="theForm">
					<div class="payorder">
						<div class="pay_top">
							<div class="payhh"></div>
							<div class="paybot">
								<h1>订单提交成功</h1>
								<h2>您的订单已成功生成，选择您想用的支付支付方式进行支付</h2>
								<ul>
									<li><strong>订单编号：</strong><strong class="orange">${ordernum}</strong></li>
									<li><strong>应付金额：</strong><strong class="orange">¥#{sum;m2M2}</strong></li>
								</ul>
								<h3>
									您可以在用户中心中<a href="/goods/toshowOrder">“我的订单”</a>查看该订单
								</h3>
							</div>
						</div>
						<div class="bank">
							<div class="banktitle">
								<h1>
									<span>您可以选择付款方式</span>
								</h1>
							</div>
							<div id="selectpay" class="bankcar">

								<ul>

									<li>
										<h1>预存款支付</h1>
										<div class="bankone">
											<span class="banksp"> <input name="payType"
												type="radio" value="balance" checked="checked"></span> <span
												class="bankimg"><img src="/images/balance.jpg"
												width="125" height="47"></span> <span class="bank_txt"></span>
										</div>
									</li>
									<li>
										<h1 id="onpay">在线支付</h1>
										<div id="alipay" class="bankone">
											<span class="banksp"> <input name="payType"
												type="radio" value="alipay"></span> <span class="bankimg"><img
												src="/images/alipay.jpg" width="125" height="47"></span> <span
												class="bank_txt"></span>
										</div>
										<div id="wx" class="bankone">
											<span class="banksp"> <input name="payType"
												type="radio" value="wxcodepay"></span> <span
												class="bankimg"><img src="/images/weixin.png"
												width="125" height="47"></span> <span class="bank_txt"></span>
										</div>
									</li>


								</ul>
							</div>
							<div class="banknextbtn">

								<input name="" type="button" value="确认支付" onclick="pay();"
									style="cursor: pointer;"> <input name="order_id"
									type="hidden" id="order_id" value="${order.id!}"> <input
										name="pprice" type="hidden" id="pprice" value=" 38.0">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script>
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
			style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px;">
			<div class="back_index">
				<a href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank" title="返回主页"></a>
			</div>
			<div class="back_top">
				<a id="toTop"
					href="http://192.168.1.233:11585/shopping/goods_cart3.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>
	<div style="display: none;" id="pay_overlay">
		<div class="white_content" style="top: 422.5px;">
			<a href="javascript:void(0);"
				onclick="javascript:jQuery(&#39;#pay_overlay&#39;).hide();"
				class="white_close"><img src="/images/close.jpg" width="14"
				height="14"></a>
			<div class="white_box">
				<h1>支付提醒</h1>
				<dl class="white_dl">
					<dt></dt>
					<dd>
						<div class="payf">
							<a
								href="http://192.168.1.233:11585/shopping/order_finish.htm?order_id=230288">已经完成支付！</a>
						</div>
						<div class="payf">
							<a href="javascript:void(0);"
								onclick="javascript:jQuery(&#39;#pay_overlay&#39;).hide();">支付出现问题！</a>
						</div>
					</dd>
				</dl>
			</div>
		</div>
		<div class="black_overlay"></div>
	</div>

	<div style="display: none;" id="wxcodepay_overlay">
		<div class="wx_content">
			<a href="javascript:void(0);"
				onclick="javascript:jQuery(&#39;#wxcodepay_overlay&#39;).hide();"
				class="white_close"><img src="/images/close.jpg" width="14"
				height="14"></a>
			<div class="wx_box">
				<h1>微信二维码扫码支付</h1>
				<dl class="wx_dl">
					<dt id="wxPayCode"></dt>
					<dd>
						<div class="payf">
							<a
								href="http://192.168.1.233:11585/shopping/order_finish.htm?order_id=230288">完成支付！</a>
						</div>
						<div class="payf">
							<a href="javascript:void(0);"
								onclick="javascript:jQuery(&#39;#wxcodepay_overlay&#39;).hide();">支付出现问题！</a>
						</div>
					</dd>
				</dl>
			</div>
		</div>
		<div class="black_overlay"></div>
	</div>



</body>
</html>