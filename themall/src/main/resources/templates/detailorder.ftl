<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0066)http://192.168.1.233:11585/shopping/buyer/order_view.htm?id=230288 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>订单详情页</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/public.css" type="text/css" rel="stylesheet">
							<link href="/css/user.css" type="text/css" rel="stylesheet">
								<script src="/js/jquery-1.6.2.js"></script>
								<script>
jQuery(document).ready(function(){
jQuery("#ship_info_a").click(	  
				function(){
				var dis = jQuery("#ship_info_ul").css("display");
				if(dis=="none"){
					jQuery("#ship_info_ul").slideDown();
					jQuery(this).find("img").attr("src","http://192.168.1.233:11585/shopping/resources/style/system/front/default/images/usercenter/user_down.png");
					}else{
					jQuery("#ship_info_ul").slideUp();
					jQuery(this).find("img").attr("src","http://192.168.1.233:11585/shopping/resources/style/system/front/default/images/usercenter/user_up.png");
						}
		});	
//
});
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
				<span>djp您好,欢迎来到童臻时代！</span><a
					href="http://192.168.1.233:11585/shopping/shopping_logout.htm"
					class="lightblue">[退出]</a>
			</div>
		</div>
	</div>

	<div class="main">
		﻿
		<script>
jQuery(document).ready(function(){
  jQuery(".users_menu>li>em>a").mouseover(function(){
    jQuery(".users_menu>li").removeClass();												
	jQuery(this).parent().parent().addClass("hover_use");	
	jQuery("div[class=users_navh]").hide();	
    jQuery(this).parent().parent().find("div[class=users_navh]").show(); 
  })
  jQuery(".users_menu>li").mouseleave(function(){
    jQuery("div[class=users_navh]").hide();																	 
	 jQuery(".users_menu>li").removeClass();
  });
  jQuery("#search_type").mouseover(function(){
    var clz=jQuery(this).attr("class");
	if(clz=="sear_type"){
	  jQuery(this).attr("class","sear_type active");
	}
	jQuery(this).find("ul li").show();	
  }).mouseleave(function(){
     jQuery(this).attr("class","sear_type");
	 jQuery(this).find("ul li").hide();
	  jQuery(this).find("ul li:first").show();
  });

  jQuery(".sear_type").find("ul li").click(function(){
		var type =jQuery(this).attr("type");
		jQuery("#type").val(type);
		var ht =jQuery(this).find("a").html();
		jQuery(this).parent().find("li:first").html(ht);
		jQuery(this).parent().find("li").hide();
		jQuery(this).parent().find("li:first").show();
		 });
  
  jQuery(".user_ser_btn").click(function(){
		var type =jQuery("#type").val();
		if(type==""){
			jQuery("#type").val("goods");
			}
		jQuery("#SearchForm").submit();													   
		});
});
</script>
		<form action="http://192.168.1.233:11585/shopping/search.htm"
			method="post" id="SearchForm">
			<input name="type" type="hidden" id="type" value="goods">
				<div class="head">
					<div class="logo">
						<a href="http://192.168.1.233:11585/shopping/index.htm"><img
							src="/images/ff2232cb-7a55-47b2-b0b4-cd90793e5ea1.jpg" border="0"></a>
					</div>
					<div class="usersearch">
						<ul class="users_menu">
							<li class=""><em><a
									href="http://192.168.1.233:11585/shopping/buyer/index.htm">买家首页</a></em></li>
							<li><em><a
									href="http://192.168.1.233:11585/shopping/buyer/homepage.htm"
									target="_blank">个人主页</a></em></li>
							<!--hover_use经过下拉样式class="hover_use"-->
							<li><em><a
									href="http://192.168.1.233:11585/shopping/buyer/friend.htm">好友<s></s></a></em>
								<div class="users_navh" style="display: none;">
									<div class="users_navh_box">
										<span> <a
											href="http://192.168.1.233:11585/shopping/buyer/friend_add.htm"
											target="_blank">找人</a>
										</span><span><a
											href="http://192.168.1.233:11585/shopping/buyer/homepage/myattention.htm"
											target="_blank">关注</a> </span><span><a
											href="http://192.168.1.233:11585/shopping/buyer/homepage/myfans.htm"
											target="_blank">粉丝</a> </span>
									</div>
								</div></li>
							<li><em><a href="javascript:void(0);">交易<s></s></a></em>
								<div class="users_navh" style="display: none">
									<div class="users_navh_box">
										<span><a
											href="http://192.168.1.233:11585/shopping/goods_cart1.htm">我的购物车</a></span>
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/order.htm">已买到的商品</a></span>
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/favorite_goods.htm">我的收藏</a></span>
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/complaint.htm">投诉管理</a></span>
									</div>
								</div></li>
							<li><em><a href="javascript:void(0);">设置<s></s></a></em>
								<div class="users_navh" style="display: none">
									<div class="users_navh_box">
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/account.htm">个人资料</a></span>
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/address.htm">收货地址</a></span>
									</div>
								</div></li>
							<li><em><a href="javascript:void(0);">消息<s></s></a></em>
								<div class="users_navh" style="display: none">
									<div class="users_navh_box">
										<span><a
											href="http://192.168.1.233:11585/shopping/buyer/message.htm?type=0">系统消息</a></span><span><a
											href="http://192.168.1.233:11585/shopping/buyer/message.htm">站内私信</a></span>
									</div>
								</div></li>
						</ul>
						<div class="user_ser">
							<!--展开时加active-->
							<div class="sear_type" id="search_type">
								<ul>
									<li><a href="javascript:void(0);">商品</a></li>
									<li type="goods" style="display: none"><a
										href="javascript:void(0);">商品</a></li>
									<li type="store" style="display: none"><a
										href="javascript:void(0);">店铺</a></li>
								</ul>
								<s></s>
							</div>

							<div class="user_ser_box">
								<input name="keyword" type="text" class="user_ser_txt"
									placeholder=" 搜索真的很简单！" id="keyword" x-webkit-speech=""
									lang="zh-CN"
									onwebkitspeechchange="jQuery(&#39;#SearchForm&#39;).submit()">
									<input name="" type="button" class="user_ser_btn"
									style="cursor: pointer;">
							</div>
						</div>
					</div>
				</div>
		</form>

		<div class="orderdetail">
			<div class="orderdh">
				<h1>订单详情</h1>
			</div>
			<div class="ordersee">
				<div class="ordersee1">
					<table width="925" border="0" cellspacing="0" cellpadding="0"
						class="tablesee1">
						<tbody>
							<tr>
								<td width="80" align="right" class="blue2">订单状态：</td>
								<td width="220" align="left"><strong style="color: #F60">待付款</strong></td>
								<td width="80" align="right" class="blue2">订单编号：</td>
								<td width="220" align="left">${order.ordernum}</td>
								<td width="80" align="right" class="blue2">下单时间：</td>
								<td width="220" align="left">${order.addtime?string("yyyy-MM-dd
									HH:mm:ss")}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ordersee2">
					<h2>卖家信息</h2>
					<table width="925" border="0" cellspacing="0" cellpadding="0"
						class="tablesee2">
						<tbody>
							<tr>
								<td width="80" align="right" class="blue2">店铺名：</td>
								<td width="220" align="left">电商平台自营店</td>
								<td width="80" align="right" class="blue2">电话号码：</td>
								<td width="220" align="left">18888888888</td>
								<td width="80" align="right" class="blue2">所在地区：</td>
								<td width="220" align="left"></td>
							</tr>
							<tr>
								<td width="80" align="right" class="blue2">MSN：</td>
								<td width="220" align="left"></td>
								<td width="80" align="right" class="blue2">QQ：</td>
								<td width="220" align="left"></td>
								<td width="80" align="right" class="blue2">旺旺：</td>
								<td width="220" align="left"></td>
							</tr>
							<tr>
								<td width="80" align="right" class="blue2">详细地址：</td>
								<td colspan="5" align="left">大连市中山区长江路29-2长江物流商厦1316</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="ordersee3">
					<h2>订单信息</h2>
					<div class="orderinfo">
						<div class="orderinfo_r">
							<span class="frspan">运费：¥0.0[平邮]</span>
						</div>
						<div class="orderinfo_r">
							<span class="frspan">订单总价：<strong style="color: #F90">¥#{order.ordersum;m2M2}</strong></span>
						</div>
						<div class="orderinfo_l">
							<table width="923" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td width="119" align="center" style="background: #F9F9F9"><strong>商品图片</strong></td>
										<td width="352" height="31" style="background: #F9F9F9"><strong>商品名称</strong></td>
										<td width="62" align="center" style="background: #F9F9F9">商品属性</td>
										<td width="62" align="center" style="background: #F9F9F9">商品数量</td>
										<td width="90" align="center" style="background: #F9F9F9">商品价格</td>
									</tr>
									<#list order.listDetailOrder as detailOrder>
									<tr style="border-bottom: 1px solid #EEE;">
										<td width="119" align="center"
											style="border-right: 1px solid #EEE"><span
											class="infoimg"><a
												href="http://192.168.1.233:11585/shopping/goods_98690.htm"
												target="_blank"><img src="${detailOrder.goods.imgpath}"
													width="62" height="62"></a></span></td>
										<td height="71"><a href="#" target="_blank">${detailOrder.goods.goodname}</a></td>
										<td align="center"></td>
										<td align="center">${detailOrder.count}</td>
										<td align="center"><strong style="color: #F90">¥#{detailOrder.goods.newprice;m2M2}</strong></td>
									</tr>
									</#list>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="ordersee4">
					<h2>物流信息</h2>
					<ul>
						<li><span class="orseet">收货人:</span><span class="orseet2">${order.consigneename}</span></li>
						<li><span class="orseet">收货地址:</span><span class="orseet2">${order.procityarea}</span></li>
						<li><span class="orseet">邮政编码:</span><span class="orseet2">${order.postcodecode}</span></li>
						<li><span class="orseet">电话号码:</span><span class="orseet2">${order.phone}</span></li>
						<li><span class="orseet">手机号码:</span><span class="orseet2"></span></li>
						<li><span class="orseet">配送方式:</span><span class="orseet2"></span></li>

						<li><span class="orseet">配送时间:</span><span class="orseet2"></span></li>
						<li><span class="orseet">发票类型:</span><span class="orseet2">个人
						</span></li>
					</ul>
					<h2>
						<span>物流动态</span><a href="javascript:void(0);" id="ship_info_a">
							<img src="/images/user_up.png">
						</a>
					</h2>
					<ul style="display: none" id="ship_info_ul">
						<li><span class="orseet">物流公司:</span><span class="orseet2"></span></li>
						<li><span class="orseet">物流单号:</span><span class="orseet2"></span></li>
					</ul>
				</div>
				<div class="ordersee5">
					<h2>操作历史</h2>
					<div class="ophistory">
						<strong style="color: #F90">${order.user.userName}</strong>于<strong><em>2021-06-01
								17:54:38</em></strong>提交订单
					</div>
				</div>
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
			style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: none;">
			<div class="back_index">
				<a href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank" title="返回主页"></a>
			</div>
			<div class="back_top">
				<a id="toTop"
					href="http://192.168.1.233:11585/shopping/buyer/order_view.htm?id=230288#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>


</body>
</html>