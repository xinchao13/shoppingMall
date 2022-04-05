<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://192.168.1.233:11585/shopping/goods_cart1.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>我的购物车</title>
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
function selectGoodsCart(){
    var ids = "";
	var totalPrice = parseFloat(0.00);
	$("input[name='goodscartIds']:checked").each(function(){
		id = $(this).val();
		var sprice = $("#goods_total_price_"+id).html().replace("¥","");
		console.log(sprice);
		totalPrice += parseFloat(sprice);
		ids += id +",";
	})
	$("#ids").val(ids);
	$("#total_price1").html(totalPrice.toFixed(2));
	$("#total_price2").html(totalPrice.toFixed(2));
}
function selectGoodCart(){
    var ids = "";
	var totalPrice = parseFloat(0.00);
	$("input[name='goodscartIds']:checked").each(function(){
		id = $(this).val();
		var sprice = $("#goods_total_price_"+id).html().replace("¥","");
		console.log(sprice);
		totalPrice += parseFloat(sprice);
		ids += id +",";
	})
	$("#ids").val(ids);
	$("#total_price1").html(totalPrice.toFixed(2));
	$("#total_price2").html(totalPrice.toFixed(2));
}


  function goods_count_adjust(cart_id,count){
	  
   	  jQuery.post("/goods/ajaxUpdateCount",
   			  {"cartid":cart_id,"count":count},function(data){
// 		 if(data.error=="100"){																										
	       jQuery("#goods_count_"+cart_id).val(data.count);
		   jQuery("#goods_count_"+cart_id).attr("goods_count",data.count)
		   jQuery("#goods_total_price_"+cart_id).html("¥"+data.sprice);
		   selectGoodsCart();
// 		   jQuery("#total_price_"+store_id).html(data.sc_total_price);
// 		   jQuery("#top_total_price_"+store_id).html(data.sc_total_price);
			
// 		 }
// 		 if(data.error=="200"){
// 		   alert("库存不足，请重新选择数量！");
// 		   jQuery("#goods_count_"+cart_id).val(jQuery("#goods_count_"+cart_id).attr("goods_count"));
// 		 }
// 		 if(data.error=="300"){
// 		   alert("团购库存不足，请重新选择数量！");
// 		   jQuery("#goods_count_"+cart_id).val(jQuery("#goods_count_"+cart_id).attr("goods_count"));
// 		 }
// 		 if(data.error=="350"){
// 			   alert("大于团购限购数，请重新选择数量！");
// 			   jQuery("#goods_count_"+cart_id).val(jQuery("#goods_count_"+cart_id).attr("goods_count"));
// 			 }
	   },"json");
  }
  function confirm_cart(sc_id){
    jQuery("#cart_"+sc_id).hide();
	jQuery("#cart_"+sc_id).attr("status","submit");
	if(jQuery("form[id^=cart_][status=no_submit]").length==0){
	   jQuery("#cart_"+sc_id).attr("target","_self");
	}
	jQuery("#cart_"+sc_id).submit();
  }  
  
jQuery(document).ready(function(){
	$("#all").click(function(){
		$("input[name='goodscartIds']").prop("checked",$(this).prop("checked"))
		selectGoodsCart();

	})
  //收藏商品的函数  开始
  jQuery("a[id^=favorite_]").click(function(){
	 
      	  var id=jQuery(this).attr("id").substring(9);
	  jQuery.post("http://192.168.1.233:11585/shopping/add_goods_favorite.htm",{"id":id},function(data){
		 if(data==0){
		    alert("收藏成功!");
		 }
		 if(data==1){
		    alert("您已经收藏过该商品!");
		 }
	  },"text");
	    });
  //收藏商品的函数  结束
  
  //加减图片的函数
  jQuery("a[id^=count_down]").click(function(){
	var cart_id=jQuery(this).attr("cart_id");
	var count=jQuery("#goods_count_"+cart_id).val();
	if(count>1){
	  count--;
      goods_count_adjust(cart_id,count)
	}
  });
  jQuery("a[id^=count_up]").click(function(){
	var cart_id=jQuery(this).attr("cart_id");
	var count=jQuery("#goods_count_"+cart_id).val();
	if(count>0){
	  count++;
	  goods_count_adjust(cart_id,count);
	}									 
  });
  jQuery("input[id^=goods_count_]").keyup(function(){
  	var cart_id=jQuery(this).attr("cart_id");
	var count=jQuery("#goods_count_"+cart_id).val().replace(/\D/g,'');
	if(count==""){
       count=1;
	}
	if(count>0){
	  goods_count_adjust(cart_id,count);
	}	
  });
  //
  jQuery(".baby_gp>a").mouseover(function(){
	jQuery(this).parent().find(".arrow").show();									  
    jQuery(this).parent().find(".baby_group").show();
  });
  jQuery(".baby_gp").mouseleave(function(){
    jQuery(this).parent().find(".arrow").hide();									  
    jQuery(this).parent().find(".baby_group").hide();
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
		 var goods_count=1;
		 var total_price=0.00;
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
								id="cart_goods_count_top" class="top_car">1</span>种商品<b></b></span>
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
						<form action="" method="post" target="_blank" id="searchForm">
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

		<div class="Steps_box">
			<div class="Steps">
				<ul>
					<li class="this">1.查看购物车</li>
					<li>2.确认订单信息</li>
					<li>3.付款到卖家</li>
					<li>4.确认收货</li>
					<li class="last">5.评价</li>
				</ul>
			</div>
			<form status="no_submit" method="post" name="cart_32815"
				target="_blank" id="cart_32815" action="/goods/toconfirmorder">
				<div class="h1">
					<span class="h1_l">全选：<input type="checkbox" id="all"
						value="全选" /></span> <span class="h1_r">商品总价：<b>¥<span
							id="total_price1">0.00</span></b><a href="javascript:void(0);"
						onclick="confirm_cart(&#39;32815&#39;);">结算</a></span>
				</div>
				<div class="table">
					<table width="115%" cellpadding="0" cellspacing="0" border="0">
						<tbody>
							<tr>
								<td width="3%" align="center" class="title"></td>
								<td width="50%" align="center" class="title">店铺商品</td>
								<td width="8%" align="center" class="title">单价</td>
								<td width="14%" align="center" class="title">数量</td>
								<td width="8%" align="center" class="title">小计（元）</td>
								<td align="center" class="title">操作</td>
							</tr>
							<#list listGoodCart as goodcart>
							<tr goods_list="goods_info_232512" id="${goodcart.goods.id}">
								<td width="3%"><input type="checkbox"
									value="${goodcart.id}" id="${goodcart.id}" name="goodscartIds"
									onclick="selectGoodCart()" /></td>
								<td class="baby"><img src="${goodcart.goods.imgpath}"
									width="65" height="65">
										<p>
											<a href="" target="_blank">${goodcart.goods.goodname}</a>
											<#list goodcart.goods.listGoodsAndSpecv as goodsAndSpecv>
											<br> <span class="color">${goodsAndSpecv.spec.specname}:
													${goodsAndSpecv.specv.specvname}</span>
											</#list>
										</p></td>
								<td align="center">¥${goodcart.goods.newprice}</td>
								<td class="input" align="center"><span><a
										href="javascript:void(0);" id="count_down_${goodcart.id}"
										cart_id="${goodcart.id}" store_id="32815"> <img
											src="/images/jinahao.jpg" width="12" height="12"></a></span> <input
									name="goods_count_${goodcart.id}" type="text"
									id="goods_count_${goodcart.id}" value="${goodcart.count}"
									cart_id="${goodcart.id}" store_id="32815"
									goods_count="${goodcart.count}"> <span><a
											href="javascript:void(0);" id="count_up_${goodcart.id}"
											cart_id="${goodcart.id}" store_id="32815"> <img
												src="/images/add.jpg" width="12" height="12"></a> </span></td>
								<td align="center"><strong class="orange"
									id="goods_total_price_${goodcart.id}">¥#{(goodcart.count*goodcart.goods.newprice);m2M2}</strong></td>
								<td align="center"><a href="javascript:void(0);"
									class="cart_common" id="favorite_98802">收藏</a> <a
									href="javascript:void(0);"
									dialog_uri="http://192.168.1.233:11585/shopping/goods_share.htm?goods_id=98802"
									dialog_title="分享商品" dialog_width="450" dialog_height="400"
									dialog_id="goods_share" class="cart_common">分享</a> <a
									href="javascript:void(0);"
									onclick="cart_remove(&#39;232512&#39;,&#39;32815&#39;);"
									class="cart_common">删除</a></td>
							</tr>
							</#list>
							<input type="hidden" id="ids" value="" name="ids" />
						</tbody>
					</table>
				</div>
				<div class="h2">
					<span class="h2_r"><em>商品总价：</em><b>¥<strong
							class="orange" id="total_price2">0.00</strong></b> <input
						name="store_id" type="hidden" id="store_id" value="32815">
							<a href="javascript:void(0);" onclick="confirm_cart(32815);">结算</a></span>
				</div>
			</form>
			<div class="car_nogoods" style="display: none;">
				<div class="shopcar">
					<dl>
						<dt>
							<img src="/images/shopping_cart.jpg" width="130" height="118">
						</dt>
						<dd>
							<h1>您的购物车还没有商品</h1>
							<span><a
								href="http://192.168.1.233:11585/shopping/index.htm">马上去购物&gt;&gt;</a></span><span><a
								href="http://192.168.1.233:11585/shopping/buyer/order.htm">查看自己的订单&gt;&gt;</a></span>
						</dd>
					</dl>
				</div>
			</div>


			<div class="tm_hot">
				<h1>
					<span class="tm_h1_left">商家热卖</span><span class="tm_h1_right"><a
						href="http://192.168.1.233:11585/shopping/ztc_goods_list.htm"
						target="_blank">更多&gt;&gt;</a></span>
				</h1>
				<ul>
				</ul>
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
					href="http://192.168.1.233:11585/shopping/goods_cart1.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>


</body>
</html>