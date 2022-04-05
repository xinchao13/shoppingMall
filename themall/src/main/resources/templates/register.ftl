<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://192.168.1.233:11585/shopping/register.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>用户注册页</title>
		<meta name="keywords" content="shopping1,shopping2">
			<meta name="description" content="shopping1,shopping2">
				<meta name="generator" content="shopping 2.0">
					<meta name="author" content="www.shopping.com">
						<meta name="copyright" content="shopping Inc. All Rights Reserved">
							<link href="/css/public.css" type="text/css" rel="stylesheet">
								<link href="/css/goods.css" type="text/css" rel="stylesheet">
									<link href="/css/index.css" type="text/css" rel="stylesheet">
										<script src="/js/jquery-1.6.2.js"></script>
										<script src="/js/jquery.validate.min.js"></script>
										<style>
.btn1 {
	width: 75px;
	height: 30px;
	background-color: #f7f7f7;
	font-weight: bold;
	font-family: youyuan;
	border-color: #f7f7f7;
}
</style>
										<script>
jQuery(document).ready(function(){
 jQuery.validator.addMethod("verify",function(value,element){
	  var re = /^[0-9a-zA-Z]*$/;
	  if(re.test(jQuery("#userName").val())){
	  	return true;
	  }else {
      	return false;
	  }		  
});
 //判断手机号格式
 jQuery.validator.addMethod("num",function(value,element){
	  var re = /(1[3-9]\d{9}$)/;
       if(re.test(jQuery("#mobile").val())){			
			return true;
		  } 
		  else {
		    return false;
			  }		  
});
 
 jQuery("#theForm").validate({				 
     errorPlacement:function(error, element) {
	   element.parent().parent("td").next("td").html("");
       error.appendTo(element.parent().parent("td").next("td"));  
      },
      
    //自定义规则
      
	  rules:{
	    userName:{
		  required:true,
		  verify:true,
          remote:{
		    url: "/index/findusername",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "userName": function(){return jQuery("#userName").val();}
		    }
		  }
	    },
        userPassword:{
		  required:true,
		  minlength:6,
		  maxlength:20  
		},
		pwd2:{
		  required:true,
		  verify:true,
		  equalTo:"#password" 
		},
// 		repassword:{
// 		  required:true,
// 		  verify:true,
// 		},
		phone:{
		  required:true,
		  num:true,
		  remote:{
			    url: "/index/findphone",     //后台处理程序
	            type: "post",               //数据发送方式
	            dataType: "json",           //接受数据格式   
	            data: {                     //要传递的数据
	                  "phone": function(){return jQuery("#mobile").val();}
			    }
		  }			  
	    },
		email:{
		  required:true,
		  email:true,
		  remote:{
		    url: "/index/findemail",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "email": function(){return jQuery("#email").val();}
		     }
		  }
		},		
		agree:{
		  required:true,
		},
		code:{
		  required:true,
		  remote:{
		    url: "/index/yanzhengma",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "code": function(){return jQuery("#code").val();}
		     }
		  }
		}
			  },
	  messages:{
	    userName:{
		  required:"用户名不能为空",
		  verify:"不可使用特殊字符",
		  remote:"用户名已存在"
		},
        userPassword:{
		  required:"密码不能为空",
		  minlength:"密码不能小于{0}个字符",
		  maxlength:"密码不能大于{0}个字符" 
		},
		pwd2:{
		  required:"重复密码不能为空",
		  equalTo:"两次输入密码不一致"
		},
		phone:{
		  required:"手机号不能为空",
		  num:"手机号格式不正确",
		  remote:"手机号已存在"
		},		
		email:{
		  required:"email不能为空",
		  email:"email格式不正确",
		  remote:"该email已经存在"
		},
		agree:{
		  required:"请接受用户协议"
		},
		code:{
		  required:"验证码不能为空",
		  remote:"验证码不正确"
		}
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
							     jQuery("#cart_goods_top_info").empty().html('<div class="menu-bd-panel"><div style="text-align:center;"><img src="/images/loader.gif" /></div></div>');
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
				<span>亲，欢迎来到臻时代！</span><span class="pxlr"><a
					href="/index/login" class="lightblue">登录</a></span><span class="pxlr">或</span><span
					class="pxlr"><a href="javascript:void(0)" class="lightblue">注册</a></span>
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

		<script>
jQuery(document).ready(function(){
  jQuery(".navul a").each(function(){
    var original_url=jQuery(this).attr("original_url");
	if("/shopping/register.htm".indexOf(original_url)>=0){
	   jQuery(this).addClass("this");	
	}
  });
  jQuery(".left_menu_dl").mouseover(function(){
	    var child_count = jQuery(this).attr("child_count");
		var sc_id=jQuery(this).attr("id");
		var sc_color=jQuery(this).attr("sc_color");		
	    var eq =jQuery(this).index();
		if(jQuery(".left_menu_dd[id=child_"+sc_id+"]").html()==null){
	   	  jQuery.ajax({type:'POST',url:'http://b2b2c.iskyshop.com/nav_data.htm',data:{"sc_id":sc_id},success:function(data){
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
		}
		
  }).mouseleave(function(e){
	  jQuery("dt[id^=dts_]").removeAttr("style");
	  jQuery("div[id^=left_menu_con_]").removeAttr("style"); 
	  var child_count = jQuery(this).attr("child_count");
���� ��jQuery("dt[id^=dts_]").removeClass("left_menu_this").addClass("left_menu_dt");	  
	  jQuery(".left_menu_dd[id^=child_]").hide();
  });
  jQuery(".nav_left").mouseover(function(){
	  jQuery("#other_menu").show();
	  
   });
  jQuery(".nav_left").mouseleave(function(){
	  jQuery("#other_menu").hide();
   });	
});

</script>
		<div class="nav">

			<div class="nav_center">

				<div class="nav_left">

					<!--       <h2><a href="http://192.168.1.233:11585/shopping/goods_class.htm"><span>ȫ������<em><img src="/images/nav_left.png"></em></span></a></h2> -->

					<div id="other_menu" class="other_menu" style="display: none;">

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

		<div class="index">
			<div class="index2">
				<div class="login_user">
					<div class="login_user_left">
						<div class="login_user_in">
							<h1>
								用户注册<span>REGISTER</span>
							</h1>
							<h2>填写用户注册信息</h2>
							<div class="login_user_bottom">
								<form action="/index/register" method="post" name="theForm"
									id="theForm" novalidate="novalidate">
									<table width="500" border="0" cellspacing="0" cellpadding="0"
										class="user_zc_table">
										<tbody>
											<tr>
												<td width="95" class="login_nameu">用户名：</td>
												<td width="200"><span
													class="login_user_input input_size"> <input
														name="userName" type="text" id="userName"></span></td>
												<td class="login_nameu2">登录用户名</td>
											</tr>
											<tr>
												<td class="login_nameu">密码：</td>
												<td><span class="login_user_input input_size"> <input
														name="userPassword" type="password" id="password"></span></td>
												<td class="login_nameu2">登录密码,6位以上字母数组组合，不区分大小写</td>
											</tr>
											<tr>
												<td class="login_nameu">确认密码：</td>
												<td><span class="login_user_input input_size"> <input
														name="pwd2" type="password" id="repassword"></span></td>
												<td class="login_nameu2">再次输入您的密码</td>
											</tr>
											<tr>
												<td class="login_nameu">手机号：</td>
												<td><span class="login_user_input input_size"> <input
														name="phone" type="text" id="mobile"></span></td>
												<td class="login_nameu2">填写真实的手机号</td>
											</tr>
											<tr>
												<td class="login_nameu">电子邮件：</td>
												<td><span class="login_user_input input_size"> <input
														name="email" type="text" id="email"></span></td>
												<td class="login_nameu2">录入后不可修改</td>
											</tr>
											<tr>
												<td class="login_nameu">验证码：</td>
												<td><span class="login_user_input input_size2">
														<input name="code" type="text" id="code"
														style="text-transform: uppercase;"> <input
															name="verify_code" type="hidden" id="verify_code"
															value="3a01fc0853ebeba94fde4d1cc6fb842a">
												</span><span class="yzm"> <img style="cursor: pointer;"
														src="/index/imgcode" id="code_img" onclick="refresh(this)"
														width="59" height="27"></span></td>
												<td class="login_nameu2">点击图片更新验证码</td>
											</tr>
											<tr>
												<!--                   end -->
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td class="login_nameu2"><span> <input
														name="agree" type="checkbox" id="agree" value="true">
															<label for="agree"> &nbsp;我已阅读并同意&nbsp;</label> <a
															href="http://192.168.1.233:11585/shopping/doc_agree.htm"
															target="_blank" class="s_red">用户服务协议</a></span></td>
												<td></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td><span class="login_user_btn_free"> <input
														name="save" type="submit" id="save"
														style="cursor: pointer;" value=""></span></td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>

								</form>
							</div>
						</div>
					</div>
					<div class="login_user_right">
						<h1 class="login_user_h">shopping提示</h1>
						<h2 class="login_user_h2">所有会员享受</h2>
						<ul class="login_user_ul">
							<li><span class="login_user_span"><img
									src="/images/user3.jpg" width="25" height="25"></span><span
								class="login_user_span2">免费开设店铺销售商品</span></li>
							<li><span class="login_user_span"><img
									src="/images/user1.jpg" width="25" height="25"></span><span
								class="login_user_span2">提交完善您的个人资料</span></li>
							<li><span class="login_user_span"><img
									src="/images/user4.jpg" width="25" height="25"></span><span
								class="login_user_span2">在线购买商城任意商品</span></li>
							<li><span class="login_user_span"><img
									src="/images/user2.jpg" width="25" height="25"></span><span
								class="login_user_span2">收藏关注的商及品店铺</span></li>
						</ul>
						<h1 class="login_user_h">如果已经拥有账户</h1>
						<div class="login_sys">
							<span class="login_user_free"><a href="/index/login"><img
									src="/images/loginde.jpg" width="98" height="32" border="0"></a></span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
function refresh(element) {
	//加入随机数的目的为了避免因为缓存机制的原因，导致请求路径相同而页面不刷新的问题
	element.src = "imgcode?r=" + Math.random();
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
			style="width: 50px; height: 50px; position: fixed; bottom: 180px; right: 25px; display: block;">
			<div class="back_index">
				<a href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank" title="返回主页"></a>
			</div>
			<div class="back_top">
				<a id="toTop"
					href="http://192.168.1.233:11585/shopping/register.htm#"
					bosszone="hometop" style="display: block;"
					onclick="window.scrollTo(0,0);return false" title="返回顶部"
					target="_self"></a>
			</div>
		</div>
	</div>


</body>
</html>