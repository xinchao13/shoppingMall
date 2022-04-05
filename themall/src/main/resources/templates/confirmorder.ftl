<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://192.168.1.233:11585/shopping/goods_cart2.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>订单确认</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/public.css" type="text/css" rel="stylesheet">
							<link href="/css/goods.css" type="text/css" rel="stylesheet">
								<link href="/css/jquery-ui-1.8.22.custom.css" type="text/css"
									rel="stylesheet">
									<link href="/css/overlay.css" type="text/css" rel="stylesheet">
										<script src="/js/jquery-1.6.2.js"></script>
										<script src="/js/jquery-ui-1.8.21.js"></script>
										<script src="/js/jquery.validate.min.js"></script>
										<script src="/js/jquery.shop.common.js"></script>
										<script>
jQuery(document).ready(function(){	
	//地址默认
	 var addr= $(".writeok :radio").parent().next().html();
	 //收货人默认（加收货人电话）
	 var person= $(".writeok :radio").parent().next().next().html() +""+$(".writeok :radio").parent().next().next().next().html();
	 jQuery("#order_address_info").html("寄送至:"+addr);
	 jQuery("#order_person_info").html("收货人:"+person);
   //
    jQuery(":radio[id=invoiceType]").click(function(){
     var val=jQuery(this).val();
	 if(val=="1"){
	   jQuery("#invoice_info").show();
	 }else{
	   jQuery("#invoice_info").hide();
	 }
  });
  //改变收货地址
    jQuery(".writeok [type=radio]").click(function(){
     var addr= $(this).parent().next().html();
     var person= $(this).parent().next().next().html() +""+$(this).parent().next().next().next().html();
    console.log(addr);
    console.log(person);
     jQuery("#order_address_info").html("寄送至:"+addr);
   jQuery("#order_person_info").html("收货人:"+person);
    });
  //
  jQuery("#coupon_id").change(function(){
      var coupon_amount=parseFloat(jQuery(this).find("option:selected").attr("coupon_amount"));
	  if(isNaN(coupon_amount)){
		 coupon_amount=0;
	  }
	  var goods_amount=parseFloat(jQuery("#goods_amount").val());
	  jQuery("#order_coupon_div").show();
	  var coupon_info="-¥"+coupon_amount;
	  jQuery("#order_coupon").html(coupon_info);
	  var ship_price=parseFloat(jQuery("#ship_price").val());
	  if(isNaN(ship_price)){
		  ship_price=0; 
	  }
	  var order_fee=goods_amount-coupon_amount+ship_price;
	  jQuery("#order_store_amount").html("¥"+order_fee);
	  jQuery("#order_pay_fee").html("¥"+order_fee);
	  if(coupon_amount==0){
	    jQuery("#order_coupon_div").hide();
	  }
  });
  //
  jQuery(":radio[id^=addr_id]").click(function(){											   
       var addr_id=jQuery(this).val();
	   jQuery.ajax({type:'POST',url:'http://192.168.1.233:11585/shopping/order_address.htm',data:{'addr_id':addr_id,"store_id":"32849"},dataType:'json',
				  beforeSend:function(){
					    jQuery("#order_save").attr("disabled",true);
					  }, 
				  success:function(data){
	                 jQuery("#ship_price").empty();
					 jQuery(data).each(function(index,item){
					     jQuery("#ship_price").append("<option value='"+item.value+"'>"+item.key+"</option>");
					 });
				     var ship_price=parseFloat(jQuery("#ship_price").val());
					 if(isNaN(ship_price)){
					    ship_price=0; 
					 }
	                 var coupon_amount=parseFloat(jQuery("#coupon_id").find("option:selected").attr("coupon_amount"));
					 if(isNaN(coupon_amount)){
					   coupon_amount=0;
					 }
	                 var goods_amount=parseFloat(jQuery("#goods_amount").val());
	                 var order_fee=goods_amount-coupon_amount+ship_price;
	                 jQuery("#order_store_amount").html("¥"+order_fee);
	                 jQuery("#order_pay_fee").html("¥"+order_fee); 
					 jQuery("#order_save").attr("disabled",false);
				  }
	   });
  });
  //
  jQuery("#ship_price").change(function(){
     var ship_price=parseFloat(jQuery(this).val());
	 if(isNaN(ship_price)){
		 ship_price=0; 
	 }
	 var coupon_amount=parseFloat(jQuery("#coupon_id").find("option:selected").attr("coupon_amount"));
	 if(isNaN(coupon_amount)){
		 coupon_amount=0;
	  }
	 var goods_amount=parseFloat(jQuery("#goods_amount").val());
	 var order_fee=goods_amount-coupon_amount+ship_price;
	 jQuery("#order_store_amount").html("¥"+order_fee);
	 jQuery("#order_pay_fee").html("¥"+order_fee); 
	 var text=jQuery(this).find("option:selected").text();
	 var transport=text.substring(0,text.indexOf("["));
	 jQuery("#transport").val(transport);
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
  jQuery("#coupon_id").val("0");
  jQuery("#ship_price").find("option:first").attr("selected",true);
  jQuery(":radio[id^=addr_id]:first").attr("checked",true);
});
function save_order(){
	
  jQuery("#cart_form").submit();
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
		 var goods_count=2;
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
								id="cart_goods_count_top" class="top_car">2</span>种商品<b></b></span>
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

		<div class="Steps_box">
			<div class="Steps">
				<ul>
					<li class="done prev">1.查看购物车</li>
					<li class="this">2.确认订单信息</li>
					<li>3.付款到卖家</li>
					<li>4.确认收货</li>
					<li class="last">5.评价</li>
				</ul>
			</div>
			<form action="/goods/ordersubmit" method="post"
				enctype="http://192.168.1.233:11585/shopping/goods_cart3.htm"
				id="cart_form">
				<div class="h1">
					<span class="h1_l"><a href="javascript:void(0)"
						target="_blank"></a> <input name="store_id" type="hidden"
						id="store_id" value="32849"></span>
				</div>
				<div class="table">
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tbody>
							<tr>
								<td width="57%" align="center" class="title">店铺商品</td>
								<td width="10%" align="center" class="title">单价</td>
								<td width="11%" align="center" class="title">数量</td>
								<td width="11%" align="center" class="title">小计</td>
							</tr>
							<#list listGoodcart as goodcart>
							<tr>
								<td class="baby"><a href="#" target="_blank"> <input
										type="hidden" name="goodcartid" value="${goodcart.id}" /> <img
										src="${goodcart.goods.imgpath}" width="65" height="65"></a>
									<p>
										<a href="#" target="_blank">${goodcart.goods.goodname}</a> <br>
									</p></td>
								<td align="center">#{goodcart.goods.newprice;m2M2}</td>
								<td align="center">${goodcart.count}</td>
								<td align="center"><strong class="orange">¥#{(goodcart.goods.newprice*goodcart.count);m2M2}</strong></td>
							</tr>
							</#list>
						</tbody>
					</table>
				</div>
				<div class="sendadress">
					<h1>
						<div class="sendhright">
							<span class="sendperbtn"> <!--           <a href="javascript:void(0);" dialog_uri="http://192.168.1.233:11585/shopping/cart_address.htm?store_id=32849" dialog_title="新增地址" dialog_width="480" dialog_height="100" dialog_id="cart_address">新增地址</a>  -->
							</span> <span class="sendperbtn"><a
								href="/address/showaddresslist?userid=${user.id}"
								target="_blank">管理收货地址</a></span>
						</div>
						<span class="sendperadr">收货人地址</span>
					</h1>
					<div class="writeok">
						<#list listAddress as address>
						<ul>
							<li><strong> <#if address.morenstatus> <img
										src="/images/Steps_02.gif" width="14" height="23"></#if>
							</strong> <label> <strong> <input type="radio"
										name="addressid" id="${address.id}" value="${address.id}"
										${address.morenstatus?string("checked='checked'","")}></strong>
									<span id="address">${address.procityarea}${address.detailaddress}</span><span
									id="person">${address.consigneename}</span><span id="mobile">${address.phone}</span>
							</label></li>
						</ul>
						</#list>
					</div>
					<h1>
						<span class="sendperadr margin10">发票信息</span>
					</h1>
					<div class="sendmethod">
						<ul>
							<li><label> <input name="invoiceType" type="radio"
									id="invoiceType" value="0" checked="checked"> 个人 </label> <label>
									<input name="invoiceType" id="invoiceType" type="radio"
									value="1"> 单位 
							</label></li>
							<li id="invoice_info" style="display: none;"><span
								style="margin-bottom: 5px;">发票抬头：</span> <input name="invoice"
								type="text" id="invoice" size="40" style="height: 20px;"></li>
						</ul>
					</div>
					<h1>
						<span class="sendperadr margin10">配送方式</span>
					</h1>
					<div class="sendmethod">
						<ul>
							<li><span style="margin-bottom: 5px;">可用配送方式：</span> <select
								name="ship_price" style="width: 110px;" id="ship_price">
									<option value="0" selected="selected">卖家承担</option>
							</select> <input name="transport" type="hidden" id="transport" value="平邮"></li>
						</ul>
					</div>
					<h1>
						<span class="sendperadr margin10">买家附言</span>
					</h1>
					<div class="sendmeg">
						<textarea name="msg" cols="" rows="" id="msg"></textarea>
					</div>
					<div class="paysend" id="order_coupon_div" style="display: none;">
						优惠券抵消：<strong class="red" style="font-size: 24px;"
							id="order_coupon"></strong>
					</div>
					<div class="paysend">
						店铺合计：<strong class="red" style="font-size: 24px;"
							id="order_store_amount">¥#{sum;m2M2}</strong>
					</div>
					<div class="paysend">
						<div class="paysd">
							<div class="paysd_box">

								<span>实付款：<strong></strong><b id="order_pay_fee">¥#{sum;m2M2}</b></span>
								<ul>
									<li><span id="order_address_info">寄送至:辽宁省大连市adsfadf</span></li>
									<li><span id="order_person_info">收货人:dsfafs
											15877777777</span></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="paybtn">
						<input name="order_save" type="button" value="提交订单并支付"
							onclick="save_order();" style="cursor: pointer;" id="order_save">
							<input name="cart_session" type="hidden" id="cart_session"
							value="LF36k2gMmlo3AdSt3M7KMeLtSUm0n3NH"> <input
								name="goods_amount" type="hidden" id="goods_amount"
								value="1920.00">
					</div>
				</div>
			</form>
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
					href="http://192.168.1.233:11585/shopping/goods_cart2.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>


</body>
</html>