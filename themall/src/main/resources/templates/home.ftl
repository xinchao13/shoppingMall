<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://192.168.1.233:11585/shopping/index.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>平台首页</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 2.0">
				<meta name="author" content="gaoyang">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<meta content="IE=edge" http-equiv="X-UA-Compatible">
							<meta property="wb:webmaster" content="3c0d2bedd819ab1c">

								<script>
var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire");
var browser = navigator.userAgent.toLowerCase(); 
for (var i=0; i<mobileAgent.length; i++){ 
	if (browser.indexOf(mobileAgent[i])!=-1){ 
		location.href = 'http://192.168.1.233:11585/shopping/wap/index.htm';
		break; 
	} 
} 
</script>
								<link href="/css/public.css" type="text/css" rel="stylesheet">
									<link href="/css/public_auto.css" type="text/css"
										rel="stylesheet">
										<link href="/css/index.css" type="text/css" rel="stylesheet">
											<script src="/js/jquery-1.6.2.js"></script>
											<script src="/js/DataLazyLoad.min.js"></script>
											<script src="/js/jquery.lazyload.js"></script>
											<script src="/js/jquery.SuperSlide.2.1.1.js"></script>
											<script src="/js/jquery.shop.common.js"></script>
											<script src="/js/jquery.validate.min.js"></script>
											<script src="/js/jquery-ui-1.8.21.js"></script>
											<script src="/js/jquery.shop.validate.js"></script>
											<script src="/js/jquery.KinSlideshow.min.js"></script>
											<script>
jQuery(document).ready(function(){
	
  jQuery(".sale_two_img img").lazyload({effect:"fadeIn",width:150,height:150});
  //鼠标经过推荐商品tab
  jQuery("#index_sale_tab ul li").mouseover(function(){	
	jQuery(this).siblings().removeClass("this");
	jQuery(this).addClass("this");
	var i = jQuery(this).index();
	jQuery("#index_sale_tab").siblings().hide();
	jQuery("#index_sale_tab").siblings().eq(i).show();
	jQuery("#sale_change").attr("mark",jQuery(this).attr("id").replace("goodscase",""));	
  });
  
  /* jQuery(".shop_left_btn_con li").mouseover(function(){
	var child_count = jQuery(this).attr("child_count");
	if(child_count>0){
	 var id=jQuery(this).attr("id");
     jQuery("#child_"+id).show();			
	}
  }).mouseleave(function(){
	 var child_count = jQuery(this).attr("child_count");
	if(child_count>0){ 
     var id=jQuery(this).attr("id");
     jQuery("#child_"+id).hide();
	}
  });
  jQuery(".specialde li").mouseover(function(){
     jQuery(this).find("i").show();
  }).mouseleave(function(){
     jQuery(this).find("i").hide();
  });
  jQuery(".productone ul").mouseover(function(){
    jQuery(".productone ul").removeClass("this");
	jQuery(this).addClass("this");
  }).mouseleave(function(){
    jQuery(".productone ul").removeClass("this");
  }); */
  
  //广告图片懒加载
  /* jQuery(".flr_advertisment img").lazyload({effect:"fadeIn",width:156,height:156});
  jQuery(".rank_advertisment img").lazyload({effect:"fadeIn",width:205,height:205});
  jQuery(".brand_bottom_adv img").lazyload({effect:"fadeIn",width:288,height:127});
  jQuery(".floor_brand img").lazyload({effect:"fadeIn",width:98,height:35}); */
  //团购图片轮播懒加载
  jQuery(".goods_tab img").lazyload({effect:"fadeIn",width:210,height:210});
  //楼层懒加载
  jQuery(".floor_main img").lazyload({effect:"fadeIn",width:147,height:147});
  
 //
 jQuery(".index_sales_left>h3>ul>li").mouseover(function(){
    jQuery(".index_sales_left>h3>ul>li").removeClass("this");
	jQuery(this).addClass("this");
	jQuery(".index_sales_box>[class^=index_sales_]").hide();
	var div_index=jQuery(this).attr("div_index");
	jQuery(".index_sales_"+div_index).show();
 });

  //
  var size="6";
  if(size>0){
  	  jQuery("html").scrollTop(0);	//刷新页面返回顶部	
	  //Call DataLazyLoad
	  jQuery("#floors .floor_main").DataLazyLoad({load : function(page, unLocked) {
		var html = '';
		var max = 6+1;
		var count = page-1;
		var id =jQuery(".floor_main[count="+count+"]").attr("id");
		var load_url =jQuery(".floor_main[count="+count+"]").attr("load_url");
		//Generate the data
		jQuery.get("http://192.168.1.233:11585/shopping/"+load_url,{"id":id,"count":count},function(data){
					html += data;
					jQuery(html).appendTo('#floors .floor_main[count='+count+']');
					jQuery(".floorclass img").lazyload({effect:"fadeIn",width:147,height:147});
					jQuery(".ranking img").lazyload({effect:"fadeIn",width:73,height:73});
					//鼠标经过楼层tab时
					jQuery(".floorul li").mouseover(function(){
						var store_gc=jQuery(this).attr("store_gc");
					    jQuery(".floorul li[store_gc="+store_gc+"]").css("cursor","pointer").removeClass("this");
						jQuery(this).addClass("this");
					    var id=jQuery(this).attr("id");
						jQuery(".ftab[store_gc="+store_gc+"]").hide();
						jQuery(".ftab[store_gc="+store_gc+"][id="+id+"]").show();
					});
					//Check whether to end
					page = page >= max ? 0 : page + 1;
					//To prevent repeated load, The first parameter to the next page, No page is 0
					unLocked(page);
			},"text");
	  }});
  }else{
	//jQuery("#toolbar").load("toolbar.htm");	 
  }
  
  jQuery(window).scroll(function(){
	var top = jQuery(document).scrollTop();
	//楼层导航跟随
	jQuery(".back_floor").css("display","none");
	jQuery("li[floor_id^=floor_] b").css("display","block");
	jQuery("div[id^=floor_]").each(function(){//循环每一个楼层
	    var floor_top=jQuery(this).offset().top-top;
		 if(floor_top<=580&&floor_top>=0){//如果到达一个位置
			  var floor_id=jQuery(this).attr("id");
			  if(jQuery("li[floor_id="+floor_id+"] b").css("display","none"))
			  {
				jQuery(".back_floor").css("display","block");  
			  }
	 }
	});
  });	
  
  //back_floor
  jQuery(".back_floor>ul>li").click(function(){
  	 var id=jQuery(this).attr("floor_id");
     var top = jQuery("#"+id).offset().top-80;
     jQuery('body,html').animate({scrollTop:top},1000);
  });
  
  var l=jQuery(".main").offset().left;
  jQuery(".back_box_x").css("left",l-43+"px");
  
});

jQuery(window).resize(function() {
   var l=jQuery(".main").offset().left;
   jQuery(".back_box_x").css("left",l-43+"px");
});

/* var recommend_goods_random=1;//随机次数
function switch_recommend_goods(){
  jQuery.ajax({type:'POST',url:'http://192.168.1.233:11585/shopping/switch_recommend_goods.htm',data:{"recommend_goods_random":recommend_goods_random},
			  beforeSend:function(){
				     jQuery(".limishop_hidden").empty();
					 jQuery("#store_reommend_goods").html("<div style='width:100%;height:301px;text-align:center;'><img src='http://192.168.1.233:11585/shopping/resources/style/common/images/loader.gif' style='margin-top:145px;' /></div>");
				  },
			  success:function(html){
	                      jQuery("#store_reommend_goods").html(html);
	                      recommend_goods_random++;
	                      if(recommend_goods_random>3.0){
                              recommend_goods_random=1;
	                       }
					  }
			 });
} */

</script>
</head>
<body>
	<!--低版本提示-->
	<!--[if IE 6]>
<div class="top_tipe">
	<div class="top_tipe_center">
    	<em><img src="http://192.168.1.233:11585/shopping/resources/style/system/front/default/images/ie6_warning.png" style="height:16px; width:16px;"/></em><b>温馨提示：您当前使用的浏览器版本过低，兼容性和安全性较差，建议您升级：</b><em><img src="http://192.168.1.233:11585/shopping/resources/style/system/front/default/images/ie_b.png"/></em><b><a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie?tp=1.0.0.0.0.KdMt0Yu">IE8浏览器</a>或</b><em><img src="http://192.168.1.233:11585/shopping/resources/style/system/front/default/images/google_b.png" /></em><b><a href="http://www.google.cn/intl/zh-CN/chrome/">谷歌浏览器</a></b>
        <span><a href="javascript:void(0);" onclick="javascript:jQuery('.top_tipe').hide();">x</a></span>
    </div>
</div>
<![endif]-->

	<div class="top" style="">
		<div class="top_page">
			<div class="pageright" id="site-nav">
				<ul class="quick-menu">
					<li class="mytaobao menu-item menupx">
						<div class="menu">
							<a class="menu-hd" href="/goods/toshowOrder" rel="nofollow">我的订单<b></b></a>
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
					<#if user?? && user.power>
					<li class="menupx"><a href="/admin/index/login">后台管理</a></li>
					</#if>
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

	<div id="nav">
		<script>
jQuery(document).ready(function(){
  jQuery("#navul li").each(function(){
    var original_url=jQuery(this).attr("original_url");
	if("/index.htm".indexOf(original_url)>=0){
	   jQuery(this).addClass("this");
	}
  });
  //
  jQuery(".left_menu_dl").live("mouseover",function(){
    var sc_id=jQuery(this).attr("id");
	var sc_color=jQuery(this).attr("sc_color");
	var child_count = jQuery(this).attr("child_count");
	var eq =jQuery(this).index();
	/*if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){
	  jQuery.ajax({type:'POST',url:'http://192.168.1.233:11585/shopping/nav_data.htm',data:{"sc_id":sc_id},
	  	  success:function(data){
			if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){																						
	      	  jQuery(".left_menu_dt[id=dts_"+sc_id+"]").after(data);
			}
		    if(child_count>0){
			  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
			  jQuery("#child_"+sc_id).show();			
			}
			jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
		    var z = -35;
	    	var x = eq*z;
		    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
			jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
		 }});
	}else{
	   if(child_count>0){
		  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
		  jQuery("#child_"+sc_id).show();			
		}
		jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
	    var z = -35;
    	var x = eq*z;
	    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
		jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
	} */
	if(child_count>0){
	  jQuery("#dts_"+sc_id).addClass("left_menu_this").removeClass("left_menu_dt");
	  jQuery("#child_"+sc_id).show();			
	}
	jQuery("#left_menu_con_"+sc_id).attr("style","border:1px solid "+sc_color+"; border-left:1px solid "+sc_color+";").find(".menu_con_right_top").css("background-color",sc_color);
    var z = -35;
   	var x = eq*z;
    jQuery("#left_menu_con_"+sc_id).css('margin-top',x+'px');
	jQuery(".left_menu_dd[id=child_"+sc_id+"]").show();
	
  }).live("mouseleave",function(){
      jQuery("dt[id^=dts_]").removeAttr("style");
	  jQuery("div[id^=left_menu_con_]").removeAttr("style"); 
	  var child_count = jQuery(this).attr("child_count");
	  jQuery("dt[id^=dts_]").removeClass("left_menu_this").addClass("left_menu_dt");	  
	  jQuery(".left_menu_dd[id^=child_]").hide();
  }); 
  //
});

</script>

		<div class="nav">

			<div class="nav_center">

				<div class="nav_left">

					<h2>
						<a href="http://192.168.1.233:11585/shopping/goods_class.htm"><span>全部分类<em><img
									src="/images/nav_left.png"></em></span></a>
					</h2>

					<div class="index_topleft">

						<div id="left_menu" class="left_menu">

							<dl sc_color="#E60012" style="position: relative;" id="65961"
								child_count="2" class="left_menu_dl">

								<dt id="dts_15" class="left_menu_dt">
									<i class="left_menu_i"><img width="16" height="16"
										src="/images/default_icon.png"></i> <strong
										class="left_menu_str"> <a
										href="http://192.168.1.233:11585/shopping/store_goods_list_65961.htm">电子广场</a>
									</strong>
								</dt>

								<dd id="child_65961" style="display: none;" class="left_menu_dd">
									<div id="left_menu_con_15" class="left_menu_con this ">
										<span class="left_menu_sp">
											<div class="left_menu_con_center">
												<div class="menu_con_right_top"
													style="background-color: rgb(230, 0, 18);">
													<dl>
														<dt>
															<span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65998.htm"
																target="_blank">华为专区</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65999.htm"
																target="_blank">三星专区</a></span>
														</dt>
													</dl>
												</div>

												<div class="left_menu_con_center_left">
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65998.htm"
																target="_blank">华为专区</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65999.htm"
																target="_blank">三星专区</a>
														</dt>
														<dd>
															<a
																href="http://192.168.1.233:11585/shopping/store_goods_list_66001.htm"
																target="_blank">X90</a>
														</dd>
													</dl>
												</div>
											</div>
										</span>
									</div>
								</dd>

							</dl>
							<dl sc_color="#E60012" style="position: relative;" id="65889"
								child_count="10" class="left_menu_dl">

								<dt id="dts_15" class="left_menu_dt">
									<i class="left_menu_i"><img width="16" height="16"
										src="/images/65bc353f-9c86-46f2-8daa-f21adec4b772.png"></i>
									<strong class="left_menu_str"> <a
										href="http://192.168.1.233:11585/shopping/store_goods_list_65889.htm">日用1</a>
									</strong>
								</dt>

								<dd id="child_65889" style="display: none;" class="left_menu_dd">
									<div id="left_menu_con_15" class="left_menu_con this ">
										<span class="left_menu_sp">
											<div class="left_menu_con_center">
												<div class="menu_con_right_top"
													style="background-color: rgb(230, 0, 18);">
													<dl>
														<dt>
															<span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65970.htm"
																target="_blank">aaaa</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65976.htm"
																target="_blank">wqeqw</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65896.htm"
																target="_blank">营养系列</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65922.htm"
																target="_blank">儿童绿色食品</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65923.htm"
																target="_blank">学习用品</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65932.htm"
																target="_blank">儿童家具用品</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65933.htm"
																target="_blank">家庭消费品</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65953.htm"
																target="_blank">秀场</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65956.htm"
																target="_blank">范德萨发沙发</a></span>
														</dt>
													</dl>
												</div>

												<div class="left_menu_con_center_left">
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65970.htm"
																target="_blank">aaaa</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65976.htm"
																target="_blank">wqeqw</a>
														</dt>
														<dd>
															<a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65966.htm"
																target="_blank">教育</a>
														</dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65896.htm"
																target="_blank">营养系列</a>
														</dt>
														<dd>
															<a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65964.htm"
																target="_blank">111</a>
														</dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65922.htm"
																target="_blank">儿童绿色食品</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65923.htm"
																target="_blank">学习用品</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65932.htm"
																target="_blank">儿童家具用品</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65933.htm"
																target="_blank">家庭消费品</a>
														</dt>
														<dd>
															<a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65948.htm"
																target="_blank">红酒</a> <a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65983.htm"
																target="_blank">123123</a> <a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65949.htm"
																target="_blank">海参</a>
														</dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65953.htm"
																target="_blank">秀场</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65956.htm"
																target="_blank">范德萨发沙发</a>
														</dt>
														<dd></dd>
													</dl>
												</div>
											</div>
										</span>
									</div>
								</dd>

							</dl>
							<dl sc_color="#E60012" style="position: relative;" id="65892"
								child_count="1" class="left_menu_dl">

								<dt id="dts_15" class="left_menu_dt">
									<i class="left_menu_i"><img width="16" height="16"
										src="/images/f22ec3ea-7c23-4372-b7c1-c0edffd308eb.png"></i>
									<strong class="left_menu_str"> <a
										href="http://192.168.1.233:11585/shopping/store_goods_list_65892.htm">aa</a>
									</strong>
								</dt>

								<dd id="child_65892" style="display: none;" class="left_menu_dd">
									<div id="left_menu_con_15" class="left_menu_con this ">
										<span class="left_menu_sp">
											<div class="left_menu_con_center">
												<div class="menu_con_right_top"
													style="background-color: rgb(230, 0, 18);">
													<dl>
														<dt>
															<span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_66004.htm"
																target="_blank">111</a></span>
														</dt>
													</dl>
												</div>

												<div class="left_menu_con_center_left">
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_66004.htm"
																target="_blank">111</a>
														</dt>
														<dd>
															<a
																href="http://192.168.1.233:11585/shopping/store_goods_list_66005.htm"
																target="_blank">2222</a>
														</dd>
													</dl>
												</div>
											</div>
										</span>
									</div>
								</dd>

							</dl>
							<dl sc_color="#E60012" style="position: relative;" id="65891"
								child_count="6" class="left_menu_dl">

								<dt id="dts_15" class="left_menu_dt">
									<i class="left_menu_i"><img width="16" height="16"
										src="/images/bd5c25d6-7a0b-4134-8cc9-6750bee6a90f.png"></i>
									<strong class="left_menu_str"> <a
										href="http://192.168.1.233:11585/shopping/store_goods_list_65891.htm">玩具</a>
									</strong>
								</dt>

								<dd id="child_65891" style="display: none;" class="left_menu_dd">
									<div id="left_menu_con_15" class="left_menu_con this ">
										<span class="left_menu_sp">
											<div class="left_menu_con_center">
												<div class="menu_con_right_top"
													style="background-color: rgb(230, 0, 18);">
													<dl>
														<dt>
															<span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65899.htm"
																target="_blank">男孩玩具</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65982.htm"
																target="_blank">机器人</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65900.htm"
																target="_blank">女孩玩具</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65901.htm"
																target="_blank">毛绒玩具</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65903.htm"
																target="_blank">玩具枪</a></span> <span><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65904.htm"
																target="_blank">益智玩具</a></span>
														</dt>
													</dl>
												</div>

												<div class="left_menu_con_center_left">
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65899.htm"
																target="_blank">男孩玩具</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65982.htm"
																target="_blank">机器人</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65900.htm"
																target="_blank">女孩玩具</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65901.htm"
																target="_blank">毛绒玩具</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65903.htm"
																target="_blank">玩具枪</a>
														</dt>
														<dd></dd>
													</dl>
													<dl>
														<dt>
															<b> &gt; </b><a
																href="http://192.168.1.233:11585/shopping/store_goods_list_65904.htm"
																target="_blank">益智玩具</a>
														</dt>
														<dd></dd>
													</dl>
												</div>
											</div>
										</span>
									</div>
								</dd>

							</dl>
							<dl sc_color="#E60012" style="position: relative;" id="65971"
								child_count="0" class="left_menu_dl">

								<dt id="dts_15" class="left_menu_dt">
									<i class="left_menu_i"><img width="16" height="16"
										src="/images/default_icon.png"></i> <strong
										class="left_menu_str"> <a
										href="http://192.168.1.233:11585/shopping/store_goods_list_65971.htm">矿泉水</a>
									</strong>
								</dt>

								<dd id="child_65971" style="display: none;" class="left_menu_dd">
									<div id="left_menu_con_15" class="left_menu_con this ">
										<span class="left_menu_sp">
											<div class="left_menu_con_center">
												<div class="menu_con_right_top"
													style="background-color: rgb(230, 0, 18);">
													<dl>
														<dt></dt>
													</dl>
												</div>

												<div class="left_menu_con_center_left"></div>
											</div>
										</span>
									</div>
								</dd>

							</dl>
						</div>

					</div>
				</div>

				<ul id="navul">


					<li><a id="229391" target="_blank"
						original_url="store_goods_list_65935.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65935.htm"><span>教育11</span></a></li>
					<li><a id="229381" target="_blank"
						original_url="store_goods_list_65890.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65890.htm"><span>健康</span></a></li>
					<li><a id="229387" target="_blank"
						original_url="store_goods_list_65894.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65894.htm"><span>亲子</span></a></li>
					<li><a id="229394" target="_blank"
						original_url="eventlist.htm"
						href="http://192.168.1.233:11585/shopping/eventlist.htm"><span>活动</span></a></li>
					<li><a id="229386" target="_blank"
						original_url="store_goods_list_65891.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65891.htm"><span>玩具</span></a></li>
					<li><a id="229388" target="_blank"
						original_url="store_goods_list_65892.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65892.htm"><span>摄影</span></a></li>
					<li><a id="229392" target="_blank"
						original_url="store_goods_list_65889.htm"
						href="http://192.168.1.233:11585/shopping/store_goods_list_65889.htm"><span>日用</span></a></li>
					<li><a id="229393" target="_blank" original_url="lovelist.htm"
						href="http://192.168.1.233:11585/shopping/lovelist.htm"><span>公益</span></a></li>
					<li><a id="229395" target="_blank" original_url="showlist.htm"
						href="http://192.168.1.233:11585/shopping/showlist.htm"><span>秀场</span></a></li>

				</ul>

			</div>

		</div>

	</div>



	<script src="./童臻时代 - Powered by HQ_files/advert_invoke.htm"></script>
	<script>jQuery('document').ready(function(){jQuery('.top_mid_slide').slide({mainCell:'.top_mid_slider_ul',titCell:'.banner_top li',titOnClassName:'this',trigger:'mouseover',autoPlay:true});});</script>
	<div class="top_mid_slide">
		<ul class="top_mid_slider_ul">
			<li class="top_mid_slider_ul_li"
				style="background: url(&quot;http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/advert/b134b85c-2125-4b5b-b1ec-a56a0071e305.jpg&quot;) 50% 0% no-repeat rgb(255, 148, 80); width: 100%; height: 490px; display: none;"><a
				style="display: block; height: 420px; width: 100%;"
				href="http://192.168.1.233:11585/shopping/advert_redirect.htm?url=#1780316980981244#&amp;id=65536"></a></li>
			<li class="top_mid_slider_ul_li"
				style="background: url(&quot;http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/advert/1773afbd-8094-4a09-af4a-b1b2e227dd3a.jpg&quot;) 50% 0% no-repeat rgb(255, 214, 2); width: 100%; height: 490px; display: list-item;"><a
				style="display: block; height: 420px; width: 100%;"
				href="http://192.168.1.233:11585/shopping/advert_redirect.htm?url=&amp;id=262175"></a></li>
			<li class="top_mid_slider_ul_li"
				style="background: url(&quot;http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/advert/a0f727d7-5951-41f2-b691-de137415fec3.jpg&quot;) 50% 0% no-repeat rgb(53, 71, 130); width: 100%; height: 490px; display: none;"><a
				style="display: block; height: 420px; width: 100%;"
				href="http://192.168.1.233:11585/shopping/advert_redirect.htm?url=#&amp;id=262176"></a></li>
		</ul>
		<div class="banner_top">
			<ul>
				<li class="" style="cursor: pointer;"></li>
				<li style="cursor: pointer;" class="this"></li>
				<li style="cursor: pointer;" class=""></li>
				<li style="cursor: pointer;" class=""></li>
			</ul>
		</div>
	</div>

	<div class="main">

		<div class="index">

			<div class="top_index">

				<div class="top_mid">
					<div class="top_mid">
						<div class="banner_nothing"></div>
					</div>
				</div>

				<div class="top_mid_right">
					<style>
.phone_txt.error {
	width: 120px;
	height: 20px;
	line-height: 20px;
	border: 1px solid #f00;
}
</style>

					<script>
			  jQuery(function(){ 
			     
				 jQuery(".top_mid_nav div").css("cursor","pointer").mouseover(function(){
				    var target_tab_id=jQuery(this).attr("target_tab_id");
					jQuery(".top_mid_nav div").removeClass("this");
					jQuery(this).addClass("this");
					jQuery("#news_tab").hide();
					jQuery("#group_tab").hide();
					jQuery("#"+target_tab_id).show();
				 });
				 //
				 jQuery(".group_tab").slide({mainCell:".top_regiment ul",autoPlay:true,interTime:3000,prevCell:".top_mid_regiment_img_left",nextCell:".top_mid_regiment_img_right"});
				 jQuery(".goods_tab").slide({mainCell:".top_regiment ul",autoPlay:true,interTime:3000,prevCell:".top_mid_regiment_img_left",nextCell:".top_mid_regiment_img_right"});
				 //
				 jQuery(".top_regiment").mouseenter(function(){
				    jQuery(".top_mid_regiment_img_left").show();
					jQuery(".top_mid_regiment_img_right").show();
				 }).mouseleave(function(){
			        jQuery(".top_mid_regiment_img_left").hide();
					jQuery(".top_mid_regiment_img_right").hide();
				 });
			  })
			  </script>

					<!-- 右上角轮播推荐商品 -->
					<!-- 		      <div class="goods_tab"> -->
					<!-- 		          <div style="display:;" id="" class="top_regiment"> -->
					<!-- 		              <ul class="top_mid_regiment_t"> -->
					<!-- 		              	 -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->

					<!-- 		                  <li style="display: none;">  -->
					<!-- 		                  	<span class="top_mid_regiment_img_t"><a href="http://192.168.1.233:11585/shopping/goods_98802.htm" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/loader02.jpg" original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg" onerror="this.src='http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg';" width='28' height='28'></a></span> -->
					<!-- 				          	<span class="top_mid_regiment_name_t">华为p50</span> -->
					<!-- 				            <p class="top_mid_regiment_img_bottom_t">  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_left_t"><strong><i>¥</i>5000.00</strong></span>  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_right_t"><a href="http://192.168.1.233:11585/shopping/goods_98802.htm" target="_blank">立即购买</a></span>  -->
					<!-- 				            </p> -->
					<!-- 				          </li> -->
					<!-- 				      	 -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->

					<!-- 		                  <li style="display: none;">  -->
					<!-- 		                  	<span class="top_mid_regiment_img_t"><a href="http://192.168.1.233:11585/shopping/goods_98803.htm" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/loader02.jpg" original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg" onerror="this.src='http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg';" width='28' height='28'></a></span> -->
					<!-- 				          	<span class="top_mid_regiment_name_t">华为Mate40pro 5G</span> -->
					<!-- 				            <p class="top_mid_regiment_img_bottom_t">  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_left_t"><strong><i>¥</i>6999.00</strong></span>  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_right_t"><a href="http://192.168.1.233:11585/shopping/goods_98803.htm" target="_blank">立即购买</a></span>  -->
					<!-- 				            </p> -->
					<!-- 				          </li> -->
					<!-- 				      	 -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->

					<!-- 		                  <li style="display: none;">  -->
					<!-- 		                  	<span class="top_mid_regiment_img_t"><a href="http://192.168.1.233:11585/shopping/goods_98799.htm" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/loader02.jpg" original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg" onerror="this.src='http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg';" width='28' height='28'></a></span> -->
					<!-- 				          	<span class="top_mid_regiment_name_t">华为Mate40 5G </span> -->
					<!-- 				            <p class="top_mid_regiment_img_bottom_t">  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_left_t"><strong><i>¥</i>5500.00</strong></span>  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_right_t"><a href="http://192.168.1.233:11585/shopping/goods_98799.htm" target="_blank">立即购买</a></span>  -->
					<!-- 				            </p> -->
					<!-- 				          </li> -->
					<!-- 				      	 -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->

					<!-- 		                  <li style="display: none;">  -->
					<!-- 		                  	<span class="top_mid_regiment_img_t"><a href="http://192.168.1.233:11585/shopping/goods_98798.htm" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/loader02.jpg" original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg" onerror="this.src='http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg';" width='28' height='28'></a></span> -->
					<!-- 				          	<span class="top_mid_regiment_name_t">华为p40</span> -->
					<!-- 				            <p class="top_mid_regiment_img_bottom_t">  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_left_t"><strong><i>¥</i>4500.00</strong></span>  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_right_t"><a href="http://192.168.1.233:11585/shopping/goods_98798.htm" target="_blank">立即购买</a></span>  -->
					<!-- 				            </p> -->
					<!-- 				          </li> -->
					<!-- 				      	 -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->
					<!-- 			               -->

					<!-- 		                  <li style="display: none;">  -->
					<!-- 		                  	<span class="top_mid_regiment_img_t"><a href="http://192.168.1.233:11585/shopping/goods_98765.htm" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/loader02.jpg" original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32858/2016/12/28/4fd5d024-c5e6-47b6-8161-00f91ecdc442.jpg_middle.jpg" onerror="this.src='http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg';" width='28' height='28'></a></span> -->
					<!-- 				          	<span class="top_mid_regiment_name_t">AOMEI婴幼全能全脑开发中心全能成...</span> -->
					<!-- 				            <p class="top_mid_regiment_img_bottom_t">  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_left_t"><strong><i>¥</i>22360.00</strong></span>  -->
					<!-- 					            <span class="top_mid_regiment_img_bottom_right_t"><a href="http://192.168.1.233:11585/shopping/goods_98765.htm" target="_blank">立即购买</a></span>  -->
					<!-- 				            </p> -->
					<!-- 				          </li> -->
					<!-- 				      	 -->
					<!-- 		              </ul> -->
					<!-- 		           </div> -->
					<!-- 		      </div> -->

					<!-- 		      <div class="top_mid_phone"> -->

					<!-- 		          <div class="top_mid_nav"> -->
					<!-- 		               <div target_tab_id="news_tab" class="top_mid_nav_phone this" style="cursor: pointer;">公告</div> -->
					<!-- 		               <div target_tab_id="group_tab" class="top_mid_nav_phone" style="cursor: pointer;">团购</div> -->
					<!-- 		          </div> -->

					<!-- 		          <div id="news_tab" class="top_mr_news"> -->
					<!-- 		             <ul style=" display: block " u_id="1" class="top_mr_box"> -->

					<!-- 		             	 -->

					<!-- 		             </ul> -->
					<!-- 		          </div>  -->

					<div class="group_tab">
						<div style="display: none;" id="group_tab"
							class="top_regiment top_tg">
							<ul class="top_mid_regiment">
							</ul>
							<div style="display: none;" class="top_mid_regiment_img_left">
								<a href="javascript:void(0);"></a>
							</div>
							<div style="display: none;" class="top_mid_regiment_img_right">
								<a href="javascript:void(0);"></a>
							</div>
						</div>
					</div>

				</div>
				<!-- top_mid_phone end -->

			</div>
			<!-- top_mid_right end -->

		</div>
		<!-- top_index end -->


		<!-- 中间广告 -->
		<!-- <script src="http://192.168.1.233:11585/shopping/advert_invoke.htm?id=4"></script> -->

		<!-- 童臻活动  以图片的形式展现，点进去是详情，显示4个  开始  -->
		<div class="sub_box2">
			<div class="title_news">
				<h1>童臻活动</h1>
				&nbsp;<span>关注童臻活动争做小明星!</span>
			</div>
			<div class="xz_box1">
				<ul class="xz_list1">
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/event_135.htm"
						class="list_xa"> <img
							src="/images/a2c4bb27-ada8-47db-aee3-e281e3b8e590.png"> <span>少儿绘画大赛</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/event_135.htm">少儿绘画大赛</a>
							<a href="http://192.168.1.233:11585/shopping/event_135.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/event_134.htm"
						class="list_xa"> <img
							src="/images/11ac1e3e-6a4c-4ed0-abb6-a2074f92cde9.png"> <span>联想ABC</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/event_134.htm">联想ABC</a>
							<a href="http://192.168.1.233:11585/shopping/event_134.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/event_133.htm"
						class="list_xa"> <img
							src="/images/f33d2509-e3a7-4c4c-9daf-918b8d9cd662.png"> <span>运动项目</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/event_133.htm">运动项目</a>
							<a href="http://192.168.1.233:11585/shopping/event_133.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/event_132.htm"
						class="list_xa"> <img
							src="/images/70af7ab0-63f9-4a17-bed3-dc541631b936.png"> <span>主题活动</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/event_132.htm">主题活动</a>
							<a href="http://192.168.1.233:11585/shopping/event_132.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/event_131.htm"
						class="list_xa"> <img
							src="/images/9bec4c19-025e-4aad-9725-215f20e4a747.png"> <span>评选活动</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/event_131.htm">评选活动</a>
							<a href="http://192.168.1.233:11585/shopping/event_131.htm"
								class="xz_in1">点击进入</a>
						</div></li>
				</ul>
			</div>
		</div>
		<!-- 童臻活动  以图片的形式展现，点进去是详情，显示4个  结束  -->

		<!-- 童臻秀场  以图片的形式展现，点进去是详情，显示4个  开始  -->
		<div class="sub_box2">
			<div class="title_news">
				<h1>童臻秀场</h1>
				&nbsp;<span>关注童臻秀场!</span>
			</div>
			<div class="xz_box1">
				<ul class="xz_list1">
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/show_125.htm"
						class="list_xa"> <img
							src="/images/49ce7649-81d1-4ee9-8303-3fa86f79d76f.png"> <span>我们的秀场</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/show_125.htm">我们的秀场</a>
							<a href="http://192.168.1.233:11585/shopping/show_125.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/show_124.htm"
						class="list_xa"> <img
							src="/images/6a49cf6d-a859-4aff-8b07-3c246bc6f868.png"> <span>我们的Show</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/show_124.htm">我们的Show</a>
							<a href="http://192.168.1.233:11585/shopping/show_124.htm"
								class="xz_in1">点击进入</a>
						</div></li>
					<li class="list_xz"><a
						href="http://192.168.1.233:11585/shopping/show_123.htm"
						class="list_xa"> <img
							src="/images/c8b63a3e-e408-4a1e-9e62-f1a5e80adb1f.png"> <span>秀秀秀</span></a>
						<div class="hide_xbox" style="display: none;">
							<a class="xz_name1"
								href="http://192.168.1.233:11585/shopping/show_123.htm">秀秀秀</a>
							<a href="http://192.168.1.233:11585/shopping/show_123.htm"
								class="xz_in1">点击进入</a>
						</div></li>
				</ul>
			</div>
		</div>
		<!-- 童臻秀场  以图片的形式展现，点进去是详情，显示4个  结束  -->
		<script>
	jQuery(".hide_xbox").hide();
	jQuery(".list_xz").hover(function(){
		jQuery(this).children(".hide_xbox").show();
	 },function(){
		 jQuery(this).children(".hide_xbox").hide(); 
	 })
	</script>
		<!-- tab页商品 -->
		<div class="index_center_box">

			<div class="index_sale">
				<div id="index_sale_tab" class="index_sale_tab">
					<!-- <a onclick="change_case_goods();" id="sale_change" mark="2" class="sale_change" href="javascript:void(0);">换一组</a> -->
					<ul>
						<!--                <li goods_random="1" id="goodscase2" class="this">疯狂抢购<s></s></li> -->
						<li goods_random="1" id="goodscase3" class="">人气商品<s></s></li>
						<li goods_random="1" id="goodscase4" class="">推荐商品<s></s></li>
						<!--                <li goods_random="1" id="goodscase5" class="">买送商品<s></s></li> -->
						<li goods_random="1" id="goodscase6" class="this">新品上架 <s></s></li>
					</ul>
				</div>

				<!-- 疯狂抢购 -->
				<div id="index_sale_box_2" class="index_sale_box"
					style="display: none;">
					<div id="index_sale_con_2" class="index_sale_con">
						<#list listGoods1 as goods>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">
									<span class="img_cspan">
										<p>
											<img width="150" height="150" src="${goods.imgpath}"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">${goods.goodname}</a></li>
							<li class="sale_two_price">售价：<strong>¥${goods.newprice}</strong></li>
						</ul>
						</#list>
					</div>
				</div>

				<!-- 猜您喜欢 -->
				<div id="index_sale_box_3" style="display: none;"
					class="index_sale_box">
					<div id="index_sale_con_3" class="index_sale_con">
						<#list listGoods2 as goods>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">
									<span class="img_cspan">
										<p>
											<img width="150" height="150" src="${goods.imgpath}"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">${goods.goodname}</a></li>
							<li class="sale_two_price">售价：<strong>¥${goods.newprice}</strong></li>
						</ul>
						</#list>
					</div>
				</div>

				<!-- 新品上架 -->
				<div id="index_sale_box_4" style="display: block;"
					class="index_sale_box">
					<div id="index_sale_con_4" class="index_sale_con">
						<#list listGoods3 as goods>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">
									<span class="img_cspan">
										<p>
											<img width="150" height="150" src="${goods.imgpath}"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="/goods/toshowgoods?goodsid=${goods.id}&productid=${goods.productid}">${goods.goodname}</a></li>
							<li class="sale_two_price">售价：<strong>¥${goods.newprice}</strong></li>
						</ul>
						</#list>
					</div>
				</div>

				<!-- 满送商品 -->
				<div id="index_sale_box_5" style="display: none;"
					class="index_sale_box">
					<div id="index_sale_con_5" class="index_sale_con"></div>
				</div>

				<!-- 人气商品 -->
				<div id="index_sale_box_6" style="display: none;"
					class="index_sale_box">
					<div id="index_sale_con_6" class="index_sale_con">

						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98676.htm">
									<span class="img_cspan">
										<p>
											<img width="150" height="150"
												src="/images/a9be29f2-c460-47d2-9cd6-f8fb831ec941.jpg_small.jpg"
												onerror="this.src=&#39;http://192.168.1.233:11585/shopping/resources/style/common/images/good.jpg&#39;;"
												original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32840/2016/12/15/a9be29f2-c460-47d2-9cd6-f8fb831ec941.jpg_small.jpg"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98676.htm">美国科蒂思维学科英语全外教精品小班绘本课...</a></li>
							<li class="sale_two_price">售价：<strong>¥99.00</strong></li>
						</ul>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98579.htm">
									<span class="img_cspan">
										<p>
											<img width="150" height="150"
												src="/images/37d73ae3-c5d7-4dbb-ab5b-c0d0ea31410e.png_small.png"
												onerror="this.src=&#39;http://192.168.1.233:11585/shopping/resources/style/common/images/good.jpg&#39;;"
												original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32829/2016/12/08/37d73ae3-c5d7-4dbb-ab5b-c0d0ea31410e.png_small.png"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98579.htm">童星汇各科试听课</a></li>
							<li class="sale_two_price">售价：<strong>¥0.01</strong></li>
						</ul>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98690.htm">
									<span class="img_cspan">
										<p>
											<img width="150" height="150"
												src="/images/9ea43e0c-519c-4312-bcc6-47efdafd4206.png_small.png"
												onerror="this.src=&#39;http://192.168.1.233:11585/shopping/resources/style/common/images/good.jpg&#39;;"
												original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32848/2016/12/19/9ea43e0c-519c-4312-bcc6-47efdafd4206.png_small.png"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98690.htm">俄罗斯烤酸奶</a></li>
							<li class="sale_two_price">售价：<strong>¥38.00</strong></li>
						</ul>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98674.htm">
									<span class="img_cspan">
										<p>
											<img width="150" height="150"
												src="/images/a9be29f2-c460-47d2-9cd6-f8fb831ec941.jpg_small.jpg"
												onerror="this.src=&#39;http://192.168.1.233:11585/shopping/resources/style/common/images/good.jpg&#39;;"
												original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32840/2016/12/15/a9be29f2-c460-47d2-9cd6-f8fb831ec941.jpg_small.jpg"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98674.htm">美国科蒂思维学科英语一中一外精品小班课（...</a></li>
							<li class="sale_two_price">售价：<strong>¥18800.00</strong></li>
						</ul>
						<ul class="index_sale_two">
							<li class="sale_two_img"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98802.htm">
									<span class="img_cspan">
										<p>
											<img width="150" height="150"
												src="/images/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
												onerror="this.src=&#39;http://192.168.1.233:11585/shopping/resources/style/common/images/good.jpg&#39;;"
												original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
												style="display: inline;">
										</p>
								</span>
							</a></li>
							<li class="sale_two_name"><a target="_blank"
								href="http://192.168.1.233:11585/shopping/goods_98802.htm">华为p50</a></li>
							<li class="sale_two_price">售价：<strong>¥5000.00</strong></li>
						</ul>

					</div>
				</div>

			</div>


			<div class="index_brand_right">

				<div class="brand">
					<h3>
						<span><a target="_blank"
							href="http://192.168.1.233:11585/shopping/brand.htm">更多</a></span>推荐品牌
					</h3>
					<ul>
						<#list listBrand as brand>
						<li><img width="142" height="66" src="${brand.imgpath}"><a
								href="http://192.168.1.233:11585/shopping/brand_goods_95.htm"
								target="_blank">${brand.brandName}</a></li>
						</#list>
						<li style="display: none;"><img width="142" height="66"
							src="/images/e924c234-ee32-4bcc-ab78-cd7b10a79194.jpg"><a
								href="http://192.168.1.233:11585/shopping/brand_goods_41.htm"
								target="_blank">阿斯顿未来英语</a></li>
						<li style="display: none;"><img width="142" height="66"
							src="/images/b83fa091-4383-473b-953e-cfa13b627151.png"><a
								href="http://192.168.1.233:11585/shopping/brand_goods_79.htm"
								target="_blank">趣学堂学习能力培训中心</a></li>
					</ul>
				</div>
				<div class="brand_bottom_adv">
					<script src="./童臻时代 - Powered by HQ_files/advert_invoke(1).htm"></script>
					<div style="float: left; overflow: hidden;">
						<a
							href="http://192.168.1.233:11585/shopping/advert_redirect.htm?url=#&amp;id="
							target="_blank"><img width="288" height="127"
							src="/images/acdc0ef0-879c-4e0d-90ea-65317c9a1735.jpg"
							style="border: none;"></a>
					</div>
				</div>

			</div>


		</div>

		<!-- 楼层 -->

		<div id="floors">
			<div load_url="floor_ajax.htm" id="131147" count="1"
				class="floor_main">
				<div class="floor floor_orange">
					<div class="floor_box" id="floor_1">
						<div class="floor_menu">
							<div class="title">
								<div class="txt-type">
									<span>1</span>
									<h2 title="楼层1">楼层1</h2>
								</div>
							</div>
							<div class="flr_m_details">
								<ul class="flr_m_du">
									<li><h4>
											<a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65961.htm">电子广场</a>
										</h4>
										<p>
											<span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65998.htm"
												target="_blank">华为专区</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65999.htm"
												target="_blank">三星专区</a></span>
										</p></li>
									<li><h4>
											<a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65889.htm">日用1</a>
										</h4>
										<p>
											<span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65970.htm"
												target="_blank">aaaa</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65976.htm"
												target="_blank">wqeqw</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65895.htm"
												target="_blank">奶粉系列</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65896.htm"
												target="_blank">营养系列</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65922.htm"
												target="_blank">儿童绿色食品</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65923.htm"
												target="_blank">学习用品</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65932.htm"
												target="_blank">儿童家具用品</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65933.htm"
												target="_blank">家庭消费品</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65953.htm"
												target="_blank">秀场</a></span><span><a
												href="http://192.168.1.233:11585/shopping/store_goods_list_65956.htm"
												target="_blank">范德萨发沙发</a></span>
										</p></li>
								</ul>
								<div class="flr_advertisment">
									<div style="float: left; overflow: hidden;"></div>
								</div>
							</div>
						</div>
						<div class="floorclass">
							<ul class="floorul">
								<li class="this" style="cursor: pointer;" id="131148"
									store_gc="131147">楼层1-1<s></s></li>
								<li style="cursor: pointer;" id="131149" store_gc="131147"
									class="">楼层1-2<s></s></li>
							</ul>
							<div id="131148" store_gc="131147" class="ftab"
								style="display: block;">
								<div class="ftabone">
									<div class="classpro">
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98746.htm"
																target="_blank"><img
																src="/images/b03ea5f1-898d-42a4-b704-a60ae9a2e18d.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/22/b03ea5f1-898d-42a4-b704-a60ae9a2e18d.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98746.htm"
													target="_blank">季群扶阳罐</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥980.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥980.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98745.htm"
																target="_blank"><img
																src="/images/d609fe06-e5d8-40ce-8e23-378b033b76b6.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/22/d609fe06-e5d8-40ce-8e23-378b033b76b6.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98745.htm"
													target="_blank">季群三九贴 儿童5次</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥500.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥500.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98747.htm"
																target="_blank"><img
																src="/images/473b65ff-c34d-4b89-a04f-2d48b035b2e1.png_small.png"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32854/2016/12/22/473b65ff-c34d-4b89-a04f-2d48b035b2e1.png_small.png"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98747.htm"
													target="_blank">盖伦少儿英语启蒙级（3-5周岁）88课时/22周</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥2592.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥2592.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98744.htm"
																target="_blank"><img
																src="/images/59ecbe17-d4b8-4040-a67b-d931a5694a28.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/22/59ecbe17-d4b8-4040-a67b-d931a5694a28.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98744.htm"
													target="_blank">季群三伏贴 儿童5次</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥500.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥500.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98743.htm"
																target="_blank"><img
																src="/images/a354eb9a-feac-424b-a8b9-a3145fcb1b7c.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32857/2016/12/22/a354eb9a-feac-424b-a8b9-a3145fcb1b7c.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98743.htm"
													target="_blank">小小王国澳洲亲子游泳24节课包</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥6000.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥5500.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98748.htm"
																target="_blank"><img
																src="/images/a46815cb-9e72-40cc-8445-b6501547c315.png_small.png"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32854/2016/12/22/a46815cb-9e72-40cc-8445-b6501547c315.png_small.png"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98748.htm"
													target="_blank">盖伦少儿英语初级（学前至一年级）88课时/22周</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥2592.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥2592.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98749.htm"
																target="_blank"><img
																src="/images/c8653866-463d-4c0d-b868-8660bd1aba10.png_small.png"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32854/2016/12/22/c8653866-463d-4c0d-b868-8660bd1aba10.png_small.png"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98749.htm"
													target="_blank">盖伦少儿英语中一级（一二年级及以上）88课时/22周</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥2592.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥2592.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98742.htm"
																target="_blank"><img
																src="/images/d590dddc-ca71-4773-a4c4-b3b758fffef9.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/21/d590dddc-ca71-4773-a4c4-b3b758fffef9.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98742.htm"
													target="_blank">季群高级专家诊</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥200.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥200.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98741.htm"
																target="_blank"><img
																src="/images/b5451d1e-0d7e-44be-ac69-43651a5b7236.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/21/b5451d1e-0d7e-44be-ac69-43651a5b7236.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98741.htm"
													target="_blank">季群专家诊小儿发烧</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥150.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥150.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98740.htm"
																target="_blank"><img
																src="/images/57c4fd9b-1297-4057-a228-56b68e9ffb75.jpg_small.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32853/2016/12/21/57c4fd9b-1297-4057-a228-56b68e9ffb75.jpg_small.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98740.htm"
													target="_blank">季群高级主任诊小儿发烧</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥110.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥110.00</strong></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div id="131149" store_gc="131147" class="ftab"
								style="display: none;">
								<div class="ftabone">
									<div class="classpro">
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98803.htm"
																target="_blank"><img
																src="/images/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98803.htm"
													target="_blank">华为Mate40pro 5G</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥8000.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥6999.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98802.htm"
																target="_blank"><img
																src="/images/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98802.htm"
													target="_blank">华为p50</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥7000.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥5000.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98801.htm"
																target="_blank"><img
																src="/images/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98801.htm"
													target="_blank">华为nova 7 pro</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥4000.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥4000.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98749.htm"
																target="_blank"><img
																src="/images/c8653866-463d-4c0d-b868-8660bd1aba10.png_small.png"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32854/2016/12/22/c8653866-463d-4c0d-b868-8660bd1aba10.png_small.png"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98749.htm"
													target="_blank">盖伦少儿英语中一级（一二年级及以上）88课时/22周</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥2592.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥2592.00</strong></li>
											</ul>
										</div>
										<div class="productone">
											<ul class="this">
												<li><span class="center_span"><p>
															<a
																href="http://192.168.1.233:11585/shopping/goods_98748.htm"
																target="_blank"><img
																src="/images/a46815cb-9e72-40cc-8445-b6501547c315.png_small.png"
																original="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//upload/store/32854/2016/12/22/a46815cb-9e72-40cc-8445-b6501547c315.png_small.png"
																onerror="this.src=http://192.168.1.233:11585/shopping/upload/system/493d2793-18f7-4444-b5b0-b2fb96863aea.jpg;"
																width="147" height="147" style="display: inline;"></a>
														</p></span></li>
												<li class="pronames"><a
													href="http://192.168.1.233:11585/shopping/goods_98748.htm"
													target="_blank">盖伦少儿英语初级（学前至一年级）88课时/22周</a></li>
												<li><span class="hui2">市场价：</span><span
													class="through hui">¥2592.00</span></li>
												<li><span class="hui2">商城价：</span><strong class="red">¥2592.00</strong></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="ranking">
							<h1>商品排行</h1>
							<ul class="rankul2"></ul>
							<div class="rank_advertisment">
								<div style="float: left; overflow: hidden;"></div>
							</div>
						</div>
					</div>
					<div class="floor_brand">
						<span class="fl_brand_sp"></span><span class="flr_sp_brand"></span>
					</div>
				</div>
			</div>
		</div>


		<div class="back_box_x" style="left: 30.5px; display: block;">
			<div class="back_floor" style="display: none;">
				<ul>
					<li floor_id="floor_1"><a href="javascript:void(0);"><b
							style="display: block;"> <img src="/images/fushi.jpg"></b><span>楼层1</span></a></li>
				</ul>
			</div>
		</div>

		<script src="./童臻时代 - Powered by HQ_files/advert_invoke(2).htm"></script>
		<div class="friendlink">
			<h1>合作伙伴</h1>
			<ul class="linkimg">
				<!--         <li> <a href="#" target="_blank"><img src="http://tongzhenpro.oss-cn-beijing.aliyuncs.com//resources/style/common/images/shopping.jpg" width="92" height="35" /></a></li> -->
				<li><a href="http://www.dltzsd.com/index.htm" target="_blank"><img
						src="/images/38aab918-488a-4118-be50-71fe691ab0a6.jpg" width="92"
						height="35"></a></li>
				<li><a href="http://m.kuaidi100.com/" target="_blank"><img
						src="/images/90fec35a-b258-4d12-82cb-6e23ff027f6c.gif" width="92"
						height="35"></a></li>
			</ul>
			<div class="linka"></div>
		</div>

		<div class="shopping">
			<div class="shopone">
				<h1>
					<a
						href="http://192.168.1.233:11585/shopping/articlelist_163842.htm">新手上路</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a href="http://192.168.1.233:11585/shopping/articlelist_98304.htm">帮助中心
					</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a href="http://192.168.1.233:11585/shopping/articlelist_98306.htm">店主之家</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a href="http://192.168.1.233:11585/shopping/articlelist_98307.htm">支付方式</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a
						href="http://192.168.1.233:11585/shopping/articlelist_131072.htm">售后服务
					</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a
						href="http://192.168.1.233:11585/shopping/articlelist_163840.htm">客服中心</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a
						href="http://192.168.1.233:11585/shopping/articlelist_163843.htm">特色服务</a>
				</h1>
				<ul>
				</ul>
			</div>
			<div class="shopone">
				<h1>
					<a
						href="http://192.168.1.233:11585/shopping/articlelist_163841.htm">关于我们</a>
				</h1>
				<ul>
				</ul>
			</div>
		</div>

		<script>jQuery(document).ready(function(){	jQuery(window).scroll(function(){	var top = jQuery(document).scrollTop();	if(top==0){		  jQuery("#back_box").hide();		  jQuery(".back_box_x").hide();		}else{		  jQuery("#back_box").show();		      jQuery(".back_box_x").show();		}	});		jQuery("#toTop").click(function(){       jQuery('body,html').animate({scrollTop:0},1000);       return false;    });});</script>

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
			<a id="toTop" href="http://192.168.1.233:11585/shopping/index.htm#"
				bosszone="hometop" style="display: block;"
				onclick="window.scrollTo(0,0);return false" title="返回顶部"
				target="_self"></a>
		</div>
	</div>


</body>
</html>