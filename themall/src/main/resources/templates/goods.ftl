<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0064)http://192.168.1.233:11585/shopping/goods_98805.htm#goods_anchor -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>商品介绍页</title>
	<meta name="keywords" content="">
		<meta name="description" content="">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/public.css" type="text/css" rel="stylesheet">
							<link href="/css/default.css" type="text/css" rel="stylesheet">
								<link href="/css/overlay.css" type="text/css" rel="stylesheet">
									<link href="/css/jquery.jqzoom.css" type="text/css"
										rel="stylesheet">
										<script src="/js/jquery-1.6.2.js"></script>
										<script src="/js/jquery-ui-1.8.21.js"></script>
										<script src="/js/jquery.shop.common.js"></script>
										<script src="/js/jquery.validate.min.js"></script>
										<script src="/js/jquery.jqzoom-core.js"></script>
										<script src="/js/jquery.lazyload.js"></script>
										<script>
function img_switch(obj){
  jQuery(".photoimgul li").removeClass("this");
  jQuery(obj.parentNode.parentNode).addClass("this");
  var src=jQuery(obj).attr("big_img");
  jQuery("#main_img").attr("src",src);
}
  var store_price=3999.00;
  var goods_inventory=11110;

var goods_price=6890.00
jQuery(document).ready(function(){
   	jQuery('.jqzoom').jqzoom({
            zoomType: 'standard',
			zoomWidth:480,
			zoomHeight:300,
            lens:true,
            preloadImages: false,
            alwaysOn:false,
			title:true,
			preloadText:'努力加载'
        });
//初始化数据
  var data='[{"val":"莱卡","id":"2","name":"摄像"}, {"val":"LED，LCD","id":"1","name":"屏幕材质"}]';
  if(data!=""){
    var properties=eval("("+data+")");
    jQuery.each(properties,function(index,item){
        jQuery(".goodsintro").append("<span>"+item.name+":"+item.val+"</span>");
    });
  }
//
jQuery(".selled li").click(function(){
   jQuery(".selled li").each(function(){
	   var id=jQuery(this).attr("id")+"_tab";
	   jQuery(this).removeClass("this");
    });
    jQuery(this).addClass("this");
	var uri=jQuery(this).attr("uri");
	jQuery(".selleddetails").empty();
	jQuery(".img_center_load").show();
	jQuery.post(uri,"",function(data){
	    jQuery(".img_center_load").hide();						
        jQuery(".selleddetails").append(data);
	 },"text");
    	
}).mouseover(function(){
  jQuery(this).css("cursor","pointer");	
});
//
//
//
jQuery("input[id^=goods_count]").keyup(function(){
   var goods_count=jQuery(this).val();
   var goods_count=jQuery("#goods_count").val().replace(/\D/g,'');
	   					if(goods_count > goods_inventory){
		  		alert("超出库存数量，请重新输入购买数量");
		  		jQuery(this).val(goods_inventory);
			  }else{
				  jQuery(this).val(goods_count);
			  }
		});
  //
  jQuery(".twocoad").css("cursor","pointer").mouseover(function(){
     jQuery(".shop_botmhbox").fadeIn('fast'); 
  }).mouseleave(function(){
     jQuery(".shop_botmhbox").fadeOut('fast'); 
  });
  jQuery(".shop_report").css("cursor","pointer").mouseover(function(){
     jQuery(".shop_reul").fadeIn("normal");
	 jQuery(".shop_rep_top").hide();
	 jQuery(".shop_rep_botm").show();
  }).mouseleave(function(){
     jQuery(".shop_reul").fadeOut("normal");
	 jQuery(".shop_rep_top").show();
	 jQuery(".shop_rep_botm").hide();
  });;
//
var switch_loaded = true;
var goods_tab_loaded=true;
var switch_top = jQuery("#switch_bar").offset().top;
var goods_tab_top = jQuery("#goods_tab").offset().top;
var switch_left = jQuery("#switch_bar").offset().left;

jQuery(window).scroll(function(){
  var scrolla=jQuery(window).scrollTop();
  var switch_cha=parseInt(switch_top)-parseInt(scrolla);
  if(switch_loaded && switch_cha<=30){
   jQuery("#switch_bar").removeClass("switch_bar").css({"position":"fixed","top":"30px","z-index":"100"});	  
   switch_loaded=false;
  }
  if(!switch_loaded && switch_cha>30){
   switch_loaded=true;
   jQuery("#switch_bar").removeClass().addClass("switch_bar").css({"position":"absolute","top":"30px","z-index":"100"});
  }
  var goods_tab_cha=parseInt(goods_tab_top)-parseInt(scrolla);
  if(goods_tab_loaded && goods_tab_cha<=0){
   jQuery("#goods_tab").css({"position":"fixed","top":"0px","background":"#fff","border-bottom":"#ccc solid 1px","overflow":"hidden"});
   jQuery(".selled_kf").show();
   goods_tab_loaded=false;
  }
  if(!goods_tab_loaded && goods_tab_cha>0){
   goods_tab_loaded=true;
   jQuery(".selled_kf").hide();
   jQuery("#goods_tab").css({"position":"relative","border-bottom":"none","overflow":"visible"});
  }
});
//
jQuery(".sbar_close").attr("cursor","pointer").click(function(){
  jQuery(".shopindex_left").fadeOut("normal");
  jQuery(".sbar_open").show();
  jQuery(".sbar_close").hide();
  jQuery(".shopindex_right").css({"width":"100%"});
  jQuery(".regoods").css("width","100%");
  jQuery(".regoods h1").css("width","100%");
  jQuery(".regoods .smallgoods").css("width","100%");
  jQuery(".regoods .smallgoods ul").css("margin-right","40px");
});
jQuery(".sbar_open").attr("cursor","pointer").click(function(){
  jQuery(".shopindex_left").fadeIn("normal");
  jQuery(".sbar_close").show();
  jQuery(".sbar_open").hide();
  jQuery(".shopindex_right").css("width","797px");
  jQuery(".regoods h1").css("width","797px");
  jQuery(".regoods .smallgoods").css("width","797px");
  jQuery(".regoods .smallgoods ul").css("margin-right","4px");
});
jQuery(".smallgoods .goodsimgs img").lazyload({effect:"fadeIn",width:178,height:170});
//
jQuery(".log_d>a").click(function(){
   jQuery(this).parent().parent().find(".goods_ct").show();
});
//
jQuery(".h3_r>a").click(function(){
   jQuery(".Cities").hide();									 
   jQuery(this).parent().parent().parent().hide();
});
//
jQuery(".item a").click(function(){
   jQuery(".Cities").hide();								 
   jQuery(this).parent().find(".Cities").show();
});
//
jQuery(".Cities>ul>li>a").click(function(){
  var city_name=jQuery(this).attr("city_name");	
  jQuery.ajax({type:'POST',url:'http://192.168.1.233:11585/shopping/trans_fee.htm',dataType:'json',data:{"city_name":city_name,"goods_id":"98805"},
			   beforeSend:function(){
				    jQuery("#current_city_info").html('<img style="padding-top:3px;" src="http://192.168.1.233:11585/shopping/resources/style/common/images/wait.gif" width="14" height="14" />');
				    jQuery("#goods_mail_fee").html('<img style="padding-top:3px;" src="http://192.168.1.233:11585/shopping/resources/style/common/images/wait.gif" width="14" height="14" />');
					jQuery("#goods_express_fee").html('<img style="padding-top:3px;" src="http://192.168.1.233:11585/shopping/resources/style/common/images/wait.gif" width="14" height="14" />');
					jQuery("#goods_ems_fee").html('<img style="padding-top:3px;" src="http://192.168.1.233:11585/shopping/resources/style/common/images/wait.gif" width="14" height="14" />');				
				},
			   success:function(json){
				    jQuery("#current_city_info").html(json.current_city_info);
				    jQuery("#goods_mail_fee").html('¥'+json.mail_fee);
					jQuery("#goods_express_fee").html('¥'+json.express_fee);
					jQuery("#goods_ems_fee").html('¥'+json.ems_fee);
				 }
			  });
  jQuery(".Cities").hide();	
  jQuery(".goods_ct").hide();
});
//
jQuery("#goods_spec_info_close>a").click(function(){
   jQuery("#goods_spec_info").removeClass().addClass("detailsbottom");  
   jQuery("#goods_spec_info_close").hide();
   jQuery("#goods_spec_chose").hide();
});
//
jQuery(".enjoy_btn").mouseover(function(){
   jQuery(".enjoy_box").show();
 }).mouseleave(function(){
   jQuery(".enjoy_box").hide();
 });
//
});
var time=0;
var time_id;

function add_cart(){
  var add=true
  var specvIds = "";
  if(jQuery(".colordate").length==0){
    add=true;
  }else{
	jQuery(".colordate").each(function(){
		//获得选中的规格值id
		$(".colordate a[class='this']").each(function(){
			var specvId = $(this).attr("specvId");
			specvIds += specvId + ",";
		})
       if(jQuery(this).find("a[class=this]").length==0) add=false;
	});
  } 
  var count=jQuery("#goods_count").val();
  var goodsid=jQuery(".stock3").val();
  console.log(goodsid);
  console.log(count);
  if(count==0){
    add=false;
	alert("至少购买一件商品!");
	return;
  }
  if(goods_inventory==0){
    add=false;
	alert("商品库存为0,不能购买!");
	return;
  }  
  if(add){
	jQuery.post(
			"/goods/addgoodscart",
			{"goodsid":goodsid,"count":count},
			function(data){

			if(data.STATUS == "FAIL1"){
				window.location.href="/index/login";
	     	}
			if(data.STATUS == "SUCCESS"){
	 		     jQuery("#cart_goods_count").html(data.count);
	 			 jQuery("#cart_goods_totalprice").html(data.total_price);
	 			 jQuery(".goodscar").fadeIn();
	 		     time_id=window.setInterval(cart_fadeOut,1000);
	 			 //更新顶部购物车信息
	 			 jQuery("#cart_goods_count_top").html(data.count);
	     	}
	},"json");
  }else{
    jQuery("#goods_spec_info").removeClass().addClass("detailsbottom detailsbottom_hover");  
	jQuery("#goods_spec_info_close").show();
	jQuery("#goods_spec_chose").show();
  }
 }

function cart_fadeOut(){
  time++;
  if(time==3){
    jQuery(".goodscar").fadeOut();
	time=0;
	window.clearInterval(time_id);
  }
}

function buy_goods(){
  var add=true
  var gsp="";
  if(jQuery(".colordate").length==0){
    add=true;
  }else{
	jQuery(".colordate").each(function(){
	   jQuery.each(jQuery(this).find("a[class=this]"),function(){
		  gsp=jQuery(this).attr("gsp")+","+gsp; 
	   });
       if(jQuery(this).find("a[class=this]").length==0) add=false;
	});
  }
  var count=jQuery("#goods_count").val();
  if(count==0){
    add=false;
	alert("至少购买一件商品!");
	return;
  }
  if(goods_inventory==0){
    add=false;
	alert("商品库存为0,不能购买!");
	return;
  } 
  var buy_type=arguments[0];
  if(add){
	jQuery.post("http://192.168.1.233:11585/shopping/add_goods_cart.htm",{"id":"98805","count":count,"price":store_price,"gsp":gsp,"buy_type":buy_type},function(data){
	     jQuery("#cart_goods_count").html(data.count);
		 jQuery("#cart_goods_totalprice").html(data.total_price);
		 window.location.href="http://192.168.1.233:11585/shopping/goods_cart1.htm";
	},"json");
  }else{
	jQuery("#goods_spec_info").removeClass().addClass("detailsbottom detailsbottom_hover");  
	jQuery("#goods_spec_info_close").show();
	jQuery("#goods_spec_chose").show();
  }
 }
function ajaxPage(url,currentPage,obj){
  jQuery.ajax({type:'POST',url:url,data:{"currentPage":currentPage,"goods_id":"98805","id":"32865"},
			  beforeSend:function(){
			   },
			  success:function(data){
                 jQuery(".selleddetails").empty();						
                 jQuery(".selleddetails").append(data);																									                }
		})
}
</script>
										<script src="/js/logger.js"></script>
										<link href="/css/bdsstyle.css" rel="stylesheet"
											type="text/css">
</head>
<body>
	<iframe frameborder="0" style="display: none;"
		src="./iphone12 pro - 童臻时代 - Powered by shopping_files/saved_resource.html"></iframe>
	<div id="bdshare_s" style="display: block;">
		<iframe id="bdsIfr"
			style="position: absolute; display: none; z-index: 9999;"
			frameborder="0"
			src="./iphone12 pro - 童臻时代 - Powered by shopping_files/saved_resource(1).html"></iframe>
		<div id="bdshare_l" style="display: none;">
			<div id="bdshare_l_c">
				<h6>分享到</h6>
				<ul>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_mshare mshare">一键分享</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_qzone qqkj">QQ空间</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_tsina xlwb">新浪微博</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_bdysc bdysc">百度云收藏</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_renren rrw">人人网</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_tqq txwb">腾讯微博</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_bdxc bdxc">百度相册</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_kaixin001 kxw">开心网</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_tqf txpy">腾讯朋友</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_tieba bdtb">百度贴吧</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_douban db">豆瓣网</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_tsohu shwb">搜狐微博</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_bdhome bdhome">百度新首页</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_sqq sqq">QQ好友</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_thx thx">和讯微博</a></li>
					<li><a
						href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="bds_more">更多...</a></li>
				</ul>
				<p>
					<a href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
						class="goWebsite">百度分享</a>
				</p>
			</div>
		</div>
	</div>

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
											href="http://192.168.1.233:11585/shopping/seller/store_create_first.htm"
											rel="nofollow">商家入驻</a>
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
			  jQuery.ajax({type:'POST',
				  url:'/goods/showgoodcart',
				  data:'',
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
							<div class="menu-bd" id="cart_goods_top_info"
								style="display: none;"></div>
						</div>
					</li>

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
			<#if user??>
    <div class="pageleft"><span>${user.userName}您好,欢迎来到童臻时代！</span><a href="http://192.168.1.233:11585/shopping/shopping_logout.htm" class="lightblue">[退出]</a>  </div>
    <#else>
    <div class="pageleft"><span>亲，欢迎来到童臻时代！</span><span class="pxlr"><a href="/index/login" class="lightblue">登录</a></span><span class="pxlr">或</span><span class="pxlr"><a href="/index/toregister" class="lightblue">注册</a></span> </div>
  	</#if>
  </div>
	</div>

	<div class="page_width">
		<div class="main_top">
			<div class="head">
				<div class="logo">
					<a href="http://192.168.1.233:11585/shopping/index.htm"><img
						src="/images/ff2232cb-7a55-47b2-b0b4-cd90793e5ea1.jpg" border="0"></a>
				</div>
				<div class="shop_top_search">
					<div class="top_search_left" style="cursor: pointer;">
						<div class="filter_z">
							<div class="top_searleft"></div>
							<div class="top_nofilter">
								<div class="top_sear_kf">
									<a href="http://192.168.1.233:11585/shopping/store_32865.htm">kawayi</a><a
										target="_blank"
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;Site=&amp;Menu=yes"><img
										alt="点击这里给我发消息" src="/images/pa"></a>
								</div>
								<div class="top_sear_star">
									<a href="javascript:void(0);" class="top_sc"
										dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
										dialog_title="会员登录" dialog_width="450" dialog_height="100"
										dialog_id="user_login">点击收藏</a><span> <img
										src="/images/level_-1.gif"></span>
								</div>
							</div>
						</div>
						<b class="top_b" style="display: block;"></b><b class="top_b2"
							style="display: none;"></b>
						<div class="top_sear_bom" style="display: none;">
							<dl class="top_dl">
								<dt>
									<b>店铺动态评分</b><i>与同行业相比</i>
								</dt>
								<dd>
									<ul class="top_dl_ul">
										<li><i>描述相符：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
										<li><i>服务态度：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
										<li><i>发货速度：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
									</ul>
								</dd>
								<dd></dd>
							</dl>
							<dl class="top_dl">
								<dt>店铺认证</dt>
								<dd>
									<span><img src="/images/card_approve_false.gif"></span> <span><img
										src="/images/realstore_approve_false.gif"></span>
								</dd>
								<dd></dd>
							</dl>
							<dl class="top_dl">
								<dt>店铺信息</dt>
								<dd>
									<span class="top_dl_width">商品数量：1件</span><span
										class="top_dl_width">好评率：0.0%</span><span class="top_dl_width">创店时间：2021-04-06</span><span
										class="top_dl_width">收藏人气：0</span>
								</dd>
							</dl>
						</div>
					</div>
					<form method="post" target="_blank" id="store_top_search_form">
						<input name="store_id" type="hidden" value="32865">
							<div class="top_search_right">
								<div class="top_search_bg"></div>
								<div class="top_shop_seacher">
									<span class="sear_shop"> <input name="keyword"
										type="text" id="keyword"></span><span class="all_sear_btn">
										<input name="" type="button" value="搜全站" search_area="site"
										style="cursor: pointer;">
									</span><span class="shop_sear_btn"> <input name=""
										type="button" value="搜本店" search_area="store"
										style="cursor: pointer;"></span>
								</div>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
jQuery(function(jQuery){
    jQuery(".top_shop_seacher input[type=button]").click(function(){
    var search_area=jQuery(this).attr("search_area");
	if(search_area=="site"){
	  jQuery("#store_top_search_form").attr("action","http://192.168.1.233:11585/shopping/search.htm");
	}
	if(search_area=="store"){
	  jQuery("#store_top_search_form").attr("action","http://192.168.1.233:11585/shopping/store_goods_search.htm");
	}
	jQuery("#store_top_search_form").submit();
  });
  jQuery(".top_nofilter").mouseover(function(){
	jQuery(".top_b").hide();								
    jQuery(".top_b2").show();  
	jQuery(".top_sear_bom").fadeIn("normal");
  })
  jQuery(".top_search_left").css("cursor","pointer").mouseleave(function(){
	jQuery(".top_b").show();								
    jQuery(".top_b2").hide();
	jQuery(".top_sear_bom").fadeOut("normal");
  });
});
</script>

	<div class="banner_width">
		<div class="shopbanner">
			<img src="/images/banner.jpg" width="1002">
		</div>
	</div>
	<div class="nav_width">
		<div class="main">
			<div class="nav_bg">
				<div class="shopnav">
					<div class="shopnavul">
						<ul>
							<li id="store_index"><a
								href="http://192.168.1.233:11585/shopping/store_32865.htm">首页</a></li>
							<li id="store_goods" class="this"><a
								href="http://192.168.1.233:11585/shopping/goods_98805.htm">商品详情</a></li>
							<li id="store_credit"><a
								href="http://192.168.1.233:11585/shopping/store_credit_32865.htm">信用评价</a></li>
							<li id="store_info"><a
								href="http://192.168.1.233:11585/shopping/store_info_32865.htm">店铺详情</a></li>
						</ul>
					</div>

					<div class="shopnavs"></div>
				</div>
			</div>
		</div>
		<div class="navbotm"></div>
	</div>
	<div class="main">
		<div class="shop">
			<div class="shop_index">
				<div class="shop_repright">
					<div class="shop_report" style="cursor: pointer;">
						<span class="shop_respan"><i>举报中心</i><b
							class="shop_rep_top"></b><b class="shop_rep_botm"
							style="display: none;"></b></span>
						<ul class="shop_reul" style="display: none">
							<li><a href="javascript:void(0);" id="report_goods"
								dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
								dialog_title="会员登录" dialog_width="450" dialog_height="100"
								dialog_id="user_login">举报此商品</a></li>
						</ul>
					</div>
					<div class="shoptop">
						<h1>kawayi</h1>
						<div class="shopvalue">
							<dl class="shopvdl">
								<dt>
									<span> <img src="/images/store.jpg" width="60"
										height="60"></span>
								</dt>
								<dd>
									<span>dengjiuanpeng<a
										href="http://192.168.1.233:11585/shopping/buyer/message_send.htm?userName=djp"
										target="_blank" class="shopemail"><img
											src="/images/mail.jpg" width="15" height="11"></a></span><span>
										<img src="/images/level_-1.gif">
									</span> <span class="hui2">好评率：0.0%</span>
								</dd>
							</dl>
							<h1>动态评价</h1>
							<ul class="shop_movepj">
								<li><i>描述相符：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
								<li><i>服务态度：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
								<li><i>发货速度：</i><b>0.0</b><em class="better"><strong>持平</strong>-----</em></li>
							</ul>
							<h1>店铺信息</h1>
							<ul>
								<li>创店时间：2021-04-06</li>
								<li>所在地区：辽宁省 大连市 中山区</li>
								<li>商品数量：<strong class="blue">1</strong>件商品
								</li>
								<li>店铺收藏：<strong class="blue">0</strong>人收藏
								</li>
							</ul>
							<h1>联系方式</h1>
							<ul>
								<li class="shopcusser"><span>站内客服：</span> <span> <a
										class="im_common" href="javascript:void(0);"
										dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
										dialog_title="会员登录" dialog_width="450" dialog_height="100"
										dialog_id="user_login">咨询客服 </a>

								</span></li>
								<li class="shopcusser"><span>站外客服：</span> <span><a
										target="_blank"
										href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;Site=&amp;Menu=yes"><img
											alt="点击这里给我发消息" src="/images/pa"></a></span></li>
							</ul>
						</div>
						<div class="shop_botm_hid">
							<ul class="shopboh">
								<li class="collection"><a href="javascript:void(0);"
									id="report_goods"
									dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
									dialog_title="会员登录" dialog_width="450" dialog_height="100"
									dialog_id="user_login"><span>收藏店铺</span></a></li>
								<li class="this"><span class="twocoad"
									style="cursor: pointer;">店铺二维码
										<div class="shop_botmhbox" style="display: none;">
											<span> <img src="/images/code.png" width="140"
												height="140"></span> <i>手机扫描二维码<br> 快速收藏店铺</i>
										</div>
								</span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="productdeta">
					<h1>
						<strong class="tuang_h">${goods.goodname}</strong>
					</h1>
					<div class="photoproduct">
						<div class="photopro">
							<a href="#" class="jqzoom" rel="gal1" title=""
								style="outline-style: none; text-decoration: none;">
								<div class="zoomPad">
									<img src="${goods.imgpath}" title="商品细节图" id="main_img"
										width="300" height="300"
										style="border: 1px solid rgb(102, 102, 102); opacity: 1;">
										<div class="zoomPup"
											style="top: 200px; left: 0px; width: 150px; height: 100px; position: absolute; border-width: 1px; display: none;"></div>
										<div class="zoomWindow"
											style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: none;">
											<div class="zoomWrapper" style="width: 480px;">
												<div class="zoomWrapperTitle"
													style="width: 100%; position: absolute; display: block;">商品细节图</div>
												<div class="zoomWrapperImage"
													style="width: 100%; height: 300px;">

													<img src=""
														style="position: absolute; border: 0px; display: block; left: 0px; top: -200px;">
												</div>
											</div>
										</div>
										<div class="zoomPreload"
											style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;">努力加载</div>
								</div>
							</a>
							<ul class="photoimgul">
								<li class="this"><a class="zoomThumbActive"
									href="javascript:void(0);"
									rel="{gallery: &#39;gal1&#39;, smallimage: &#39;${goods.imgpath}&#39;,largeimage: &#39;${goods.imgpath};}">
										<img src="${goods.imgpath}" width="40" height="40"
										onclick="img_switch(this);" style="cursor: pointer;">
								</a></li>
								<#list listImg as img>
								<li><a class="zoomThumbActive" href="javascript:void(0);"
									rel="{gallery: &#39;gal1&#39;, smallimage: &#39;${img.imgpath}&#39;,largeimage: &#39;${img.imgpath};}">
										<img src="${img.imgpath}" width="40" height="40"
										onclick="img_switch(this);" style="cursor: pointer;">
								</a></li>
								</#list>
							</ul>
							<div class="collection_goods">
								<span><a class="save_good" href="javascript:void(0);"
									dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
									dialog_title="会员登录" dialog_width="450" dialog_height="100"
									dialog_id="user_login">收藏(0)</a></span>
								<div class="enjoy_btn">
									<a class="enjoy_a" href="javascript:void(0);">分享到：站内/站外</a>
									<div class="enjoy_box" style="display: none;">
										<span class="enjoy_b"> <input name="goods_share_btn"
											type="button" id="goods_share_btn" value="分享商品"
											dialog_uri="http://192.168.1.233:11585/shopping/user_dialog_login.htm"
											dialog_title="会员登录" dialog_width="450" dialog_height="100"
											dialog_id="user_login"></span> <span class="enjoy">
											<div id="bdshare"
												class="bdshare_t bds_tools get-codes-bdshare">
												<a class="bds_tsina" title="分享到新浪微博"
													href="http://192.168.1.233:11585/shopping/goods_98805.htm#"></a>
												<a class="bds_tqq" title="分享到腾讯微博"
													href="http://192.168.1.233:11585/shopping/goods_98805.htm#"></a>
												<span class="bds_more">更多</span> <a class="shareCount"
													href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
													title="累计分享0次">0</a>
											</div> <script type="text/javascript" id="bdshare_js"
												data="type=tools&amp;uid=5015224" src="/js/bds_s_v2.js"></script>

											<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
</script>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="productshop">
							<div class="detailstop">
								<ul>
									<li><span class="detbt">商品原价：</span><span class="through">¥${goods.oldprice}</span></li>
									<li><span class="detbt">店铺价格：</span><span
										class="pricedata"><strong class="orange"
											id="store_price">¥${goods.newprice}</strong></span><span
										class="greenp">(节省：<b id="rest"
											style="font-weight: normal;">¥2891.0</b>)
									</span></li>
									<li><span class="detbt">商品重量：</span><span class="weight">${goods.weight}千克(kg)</span></li>
									<li><span class="detbt">物流运费：</span>
										<div class="logistics">
											<span class="start">大连市 | 至</span>
											<div class="log_ps">
												<span class="log_d"><a href="javascript:void(0);"><em
														id="current_city_info">全国</em><i></i> </a></span>
												<div class="goods_ct" style="display: none;">
													<h3>
														<span class="h3_l">选择你的收货城市</span><span class="h3_r"><a
															href="javascript:void(0);"><img
																src="/images/14-14.png"></a></span>
													</h3>
													<p>您当前所在地：全国</p>
													<div class="Region">
														<ul>
															<li class="item"><a href="javascript:void(0);"
																area_id="4522510" area_name="辽宁省">辽宁省</a>
																<div class="Cities" style="display: none;">
																	<ul>
																		<li><a href="javascript:void(0);" city_id="123"
																			city_name="大连市">大连市</a></li>
																	</ul>
																</div></li>
															<li class="item"><a href="javascript:void(0);"
																area_id="4522512" area_name="3213">3213</a>
																<div class="Cities" style="display: none;">
																	<ul>
																	</ul>
																</div></li>
														</ul>
													</div>
												</div>
											</div>
											<!--物流运费新增start-->
											<span class="detbt"></span><span>卖家承担</span>
										</div></li>
									<!--物流运费新增end-->
									<li><span class="detbt">销售情况：</span><span class="sale">售出${goods.sale}件(0条评论)</span></li>
									<li><span class="detbt">关注次数：</span><span class="focus">${goods.focus}次</span></li>
								</ul>
							</div>
							<script>
			  function goods_spec_set(obj,specid){
				var spec=jQuery(obj).attr("spec");
				var gsp="";
				var load=true;
				//更换点击的规格值样式
				jQuery(".colordate a[spec="+specid+"]").removeClass("this");
			    jQuery(obj).addClass("this");
			    //获得选中的规格值id
				var specvIds = "";
				$(".colordate a[class='this']").each(function(){
					var specvId = $(this).attr("specvId");
					specvIds += specvId + ",";
				})
				jQuery(".colordate").each(function(){
                     if(jQuery(this).find("a[class=this]").length==0) load=false;
	             });
				var goodsnum = "${goods.productid}" //货号
			  if(load){
				jQuery("#goods_spec_info").removeClass().addClass("detailsbottom");  
	            jQuery("#goods_spec_info_close").hide();    
				jQuery("#goods_spec_chose").hide();
				jQuery.post("/goods/changegoods",
							{"productid":goodsnum,"specvIds":specvIds},
							function(data){
								$(".tuang_h").html(data.goods.goodname);
								$(".through").html(data.goods.oldprice);
								$(".orange").html(data.goods.newprice);
								$(".weight").html(data.goods.weight+"(千克)Kg");
								$(".sale").html("售出"+data.goods.sale+"件(0条评论）");
								$(".focus").html(data.goods.focus+"次");
								$(".stock2").html(data.goods.stock);
								$(".stock3").val(data.goods.id);
								$(".goodsintro2").html(data.goods.description);
								//更改浏览器地址栏地址
				   				var stateObject = {};
				   				var title = "Wow Title";
				   				var newUrl = "http://localhost:8080/goods/toshowgoods?goodsid="+data.goods.id+"&productid="+goodsnum;
				   				history.pushState(stateObject,title,newUrl);
				   				
								
// 								$.each(data.goods.listimg, function(){
									
// 								})
// 				   				goods_inventory=data.count;
// 				   				store_price=data.price;
// 				   				jQuery("#goods_inventory").html(goods_inventory);
// 				   				jQuery("#store_price").html("¥"+store_price);
// 				   				jQuery("#rest").html("¥"+ (data.economize));
				   				
				 			},
				 			"json");
			    }
			  }
			  </script>
							<div class="detail_solid"></div>
							<div class="detailsbottom_ps">
								<div class="detailsbottom" id="goods_spec_info">
									<ul>
										<li id="goods_spec_chose" class="detail_chose"
											style="display: none;">请选择商品属性</li>
										<#list listSpec as spec>
										<li class="colordate"><span class="datespan">${spec.specname}分类：</span>
											<span class="chosecolor"> <#list spec.listSpecv as
													specv> <#assign flag="false"> <#list
													listGoodsSpecv as gsv> <#if gsv.specvid== specv.id>
												<#assign flag="true"></#if> </#list> <b
													style="font-weight: lighter;"> <a
													class="${(flag == 'true')?string('this', '')}"
													href="javascript:void(0);"
													onclick="goods_spec_set(this,${specv.specid});"
													spec="${specv.specid}" specvId="${specv.id}">${specv.specvname}</a>
												</b></#list>
										</span></li>
										</#list>
										<li class="stockdate"><span class="datespan">数量：</span><span
											class="stock"> <input name="goods_count" type="text"
												id="goods_count" value="1"
												onkeyup="this.value=this.value.replace(/\D/g,&#39;&#39;)"
												onafterpaste="this.value=this.value.replace(/\D/g,&#39;&#39;)"></span>
											<span class="stockparts">件（ 库存<b id="goods_inventory"
												style="font-weight: normal;" class="stock2">${goods.stock}</b>件）
										</span> <input type="hidden" class="stock3" value="${goods.id}" /></li>

										<li><span class="datespan">&nbsp;</span><span
											class="addcar"> <input name="input" type="button"
												value="添加到购物车" onclick="add_cart();"></span><span
											class="atonce"> <input name="input" type="button"
												value="立刻购买" onclick="buy_goods();"></span>
											<div class="goodscar" style="display: none; z-index: 999;">
												<div>
													<a href="javascript:void(0);"
														onclick="javascript:jQuery(&#39;.goodscar&#39;).hide();"
														class="closed"><img src="/images/closed.jpg"
														width="12" height="12"></a>
												</div>
												<ul>
													<li>已成功添加到购物车！</li>
													<li>购物车共有 <strong class="orange" id="cart_goods_count"></strong>
														种宝贝，合计：¥ <strong class="orange" id="cart_goods_totalprice">0.00</strong></li>
													<li><a
														href="javascript:if(confirm(&#39;您尚未登录，现在登录?&#39;))window.location.href=&#39;http://192.168.1.233:11585/shopping/user/login.htm?url=http://192.168.1.233:11585/shopping/goods_cart1.htm&#39;"
														class="go_cart">立刻结算</a></li>
												</ul>
											</div></li>
									</ul>
								</div>

								<div class="Close" id="goods_spec_info_close"
									style="display: none;">
									<a href="javascript:void(0);">X</a>
								</div>
							</div>

							<li style="margin-top: 10px;"><span class="detbt">承诺：</span><span>
									正品保障&nbsp;&nbsp; </span><span> 七天无理由退货&nbsp;&nbsp; </span><span>
									描述属实&nbsp;&nbsp; </span><span> 指定店面可用&nbsp;&nbsp; </span><span>
									每人每天限购一份 拍多份按一份送货&nbsp;&nbsp; </span></li>

						</div>
					</div>
				</div>
			</div>
			<div class="shop_index_box">
				<script>
jQuery(function(jQuery){
  jQuery(".collection a").click(function(){
      });
  //
  jQuery("span[id^=ugc_]").css("cursor","pointer").click(function(){
     var ugc_type=jQuery(this).attr("ugc_type");
	 var ugc_id=jQuery(this).attr("ugc_id");
	 if(ugc_type=="show"){
	    jQuery(this).find("img").attr("src","http://192.168.1.233:11585/shopping/resources/style/shop/default/images/add.jpg");
		jQuery("#ugc_child_"+ugc_id).hide();
	    jQuery(this).attr("ugc_type","hide");
	 }else{
	    jQuery(this).find("img").attr("src","http://192.168.1.233:11585/shopping/resources/style/shop/default/images/add2.jpg");
		jQuery("#ugc_child_"+ugc_id).show();
	    jQuery(this).attr("ugc_type","show");
	 }
  });
  //
});
</script>

				<div class="shopindex_left">
					<div class="shopclassify">
						<h1>商品分类</h1>
						<ul class="shopcul">
							<li><span><img src="/images/add2.jpg" width="15"
									height="15"></span><a
								href="http://192.168.1.233:11585/shopping/goods_list.htm?store_id=32865"
								class="oneclass">所有商品</a></li>
						</ul>
					</div>
					<form
						action="http://192.168.1.233:11585/shopping/store_goods_search.htm"
						method="post" id="store_search_form">
						<div class="shopsearch">
							<ul>
								<li><span class="searspan">关键字：</span><span
									class="shopsear1"> <input name="keyword" type="text"
										id="keyword"></span></li>
								<li><span class="searspan">&nbsp;</span><span
									class="searbtns"> <input name="input2" type="submit"
										value="搜索" style="cursor: pointer;"></span> <input
									name="store_id" type="hidden" id="store_id" value="32865"></li>
							</ul>
						</div>
					</form>
					<div class="shopf">
						<h1>友情链接</h1>
						<ul>
						</ul>
					</div>
				</div>

				<div class="shopindex_right">
					<div class="switch_bar" id="switch_bar">
						<span class="sbar_open" style="display: none" cursor="pointer"><a
							class="sbar_open_btn" href="javascript:void(0);"></a></span><span
							class="sbar_close" cursor="pointer"><a
							class="sbar_close_btn" href="javascript:void(0);"></a></span>
					</div>
					<div class="shopselled" id="goods_anchor" name="goods_anchor">
						<div class="selled" id="goods_tab">
							<ul class="selled_ul">
								<li class="this" id="details"
									uri="http://192.168.1.233:11585/shopping/goods_detail.htm?goods_id=98805&amp;id=32865"
									style="cursor: pointer"><a
									href="http://192.168.1.233:11585/shopping/goods_98805.htm#goods_anchor">商品详情</a></li>
								<li id="evaluation"
									uri="http://192.168.1.233:11585/shopping/goods_evaluation.htm?goods_id=98805&amp;id=32865"
									class="" style="cursor: pointer;"><a
									href="http://192.168.1.233:11585/shopping/goods_98805.htm#goods_anchor">评价详情</a></li>
								<li id="strike"
									uri="http://192.168.1.233:11585/shopping/goods_order.htm?goods_id=98805&amp;id=32865"
									class="" style="cursor: pointer;"><a
									href="http://192.168.1.233:11585/shopping/goods_98805.htm#goods_anchor">成交记录</a></li>
								<li id="advice"
									uri="http://192.168.1.233:11585/shopping/goods_consult.htm?goods_id=98805&amp;id=32865"
									class="" style="cursor: pointer;"><a
									href="http://192.168.1.233:11585/shopping/goods_98805.htm#goods_anchor">产品咨询</a></li>
							</ul>
							<span class="selled_kf" style="display: none;"><a
								target="_blank"
								href="http://wpa.qq.com/msgrd?v=3&amp;uin=&amp;Site=&amp;Menu=yes"><img
									alt="点击这里给我发消息" src="/images/pa"></a> </span>
						</div>
						<div class="img_center_load"
							style="text-align: center; padding-top: 5px; display: none;">
							<img height="28" width="28" src="/images/loader(1).gif">
						</div>
						<div class="selleddetails">
							<div class="goodsdetails" id="details_tab">
								<div class="goodsintro">
									<span>摄像:莱卡</span><span>屏幕材质:LED，LCD</span>
								</div>
								<div class="goodsintro2" style="margin-top: 10px;">${goods.description}</div>
							</div>
						</div>
					</div>
					<div class="regoods">
						<h1>
							<a
								href="http://192.168.1.233:11585/shopping/goods_list.htm?store_id=32865&amp;recommend=true">更多</a><span>推荐商品</span>
						</h1>
						<div class="smallgoods"></div>
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
			style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: block;">
			<div class="back_index">
				<a href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank" title="返回主页"></a>
			</div>
			<div class="back_top">
				<a id="toTop"
					href="http://192.168.1.233:11585/shopping/goods_98805.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>


</body>
</html>