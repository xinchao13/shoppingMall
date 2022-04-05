<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0051)http://192.168.1.233:11585/shopping/admin/index.htm -->
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow: hidden;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>后台管理首页</title>
	<meta name="keywords" content="shopping1,shopping2">
		<meta name="description" content="shopping1,shopping2">
			<meta name="generator" content="shopping 1.3">
				<meta name="author" content="www.shopping.com">
					<meta name="copyright" content="shopping Inc. All Rights Reserved">
						<link href="/css/template.css" rel="stylesheet" type="text/css">
							<script src="/js/jquery-1.6.2.js"></script>
							<script src="/js/jquery.shop.base.js"></script>
							<script>
jQuery(document).ready(function(){
    pagestyle();
	jQuery(".webmap a").click(function(){
	    jQuery(".webmap_box").fadeIn('normal');
	 });
	jQuery(".close_map").click(function(){
	    jQuery(".webmap_box").fadeOut('normal');
	});
	jQuery("a[id^=complex_]").click(function(){
	  var suffix=jQuery(this).attr("suffix");
	  if(jQuery("#"+suffix+"info").css("display")=="block"){
	      jQuery("#"+suffix+"info").hide();
		  jQuery("#"+suffix+"img").attr("src","/images/spread.jpg");
	   }else{
	      jQuery("#"+suffix+"info").show();
		  jQuery("#"+suffix+"img").attr("src","/images/contract.jpg");	  
	   }
	});
	jQuery(".webskin em a img").click(function(){
	      var webcss = jQuery(this).attr("webcss");
			jQuery.post("http://192.168.1.233:11585/shopping/admin/set_websiteCss.htm",{
						"webcss":webcss
						},function(data){
						window.location.href="http://192.168.1.233:11585/shopping/admin/index.htm";	
							},"text");
		});
});	
</script>
</head>
<body scroll="yes">
	<div class="main">
		<div class="top">
			<div class="login">
				您登录的身份是：admin &nbsp;&nbsp;| <a
					href="http://192.168.1.233:11585/shopping/admin/logout.htm"
					target="_self">安全退出</a>|<a
					href="http://192.168.1.233:11585/shopping/admin/admin_pws.htm"
					target="main_workspace">修改密码</a>| <a
					href="http://192.168.1.233:11585/shopping/index.htm"
					target="_blank">商城首页</a>
			</div>
			<div class="logo"></div>
			<div class="nav">
				<ul>
					<li><a href="javascript:void(0);" class="home"
						id="common_operation_menu"
						onclick="openURL(&#39;show&#39;,&#39;common_operation&#39;)">首页</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="base_set_menu"
						onclick="openURL(&#39;show&#39;,&#39;base_set&#39;)">设置</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="about_goods_menu"
						onclick="openURL(&#39;show&#39;,&#39;about_goods&#39;)">商品</a></li>
					<!--         <li><a href="javascript:void(0);" class="active" id="about_sparegoods_menu" onclick="openURL('show','about_sparegoods')">闲置</a></li> -->
					<li><a href="javascript:void(0);" class="active"
						id="about_store_menu"
						onclick="openURL(&#39;show&#39;,&#39;about_store&#39;)">店铺</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="about_member_menu"
						onclick="openURL(&#39;show&#39;,&#39;about_member&#39;)">会员</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="about_trade_menu"
						onclick="openURL(&#39;show&#39;,&#39;about_trade&#39;)">交易</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="about_website_menu"
						onclick="openURL(&#39;show&#39;,&#39;about_website&#39;)">网站</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="business_operation_menu"
						onclick="openURL(&#39;show&#39;,&#39;business_operation&#39;)">运营</a></li>
					<li><a href="javascript:void(0);" class="active"
						id="sys_tool_menu"
						onclick="openURL(&#39;show&#39;,&#39;sys_tool&#39;)">工具</a></li>
				</ul>
			</div>
		</div>
		<div class="index" id="workspace">
			<div class="left" style="width: 10%;">
				<div class="lefttop"></div>
				<div class="left_ul">
					<ul class="ulleft" id="common_operation">
						<div class="leftone">常用操作</div>
						<li><a class="this" id="welcome_op"
							href="javascript:void(0);"
							onclick="openURL(&#39;url&#39;,&#39;/admin/index/welcome&#39;,&#39;main_workspace&#39;,&#39;welcome_op&#39;)">欢迎页面</a>
						</li>
						<li><a href="javascript:void(0);" id="set_site_op_q"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_site.htm&#39;,&#39;main_workspace&#39;,&#39;set_site_op_q&#39;)">站点设置</a></li>
						<li><a href="javascript:void(0);" id="user_list_op_q"
							onclick="openURL(&#39;url&#39;,&#39;/admin/index/touserlist&#39;,&#39;main_workspace&#39;,&#39;user_list_op_q&#39;)">会员管理</a></li>
						<li><a href="javascript:void(0);" id="store_list_op_q"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_list_op_q&#39;)">店铺管理</a></li>
						<li><a href="javascript:void(0);" id="goods_manage_op_q"
							onclick="openURL(&#39;url&#39;,&#39;/admin/goods/toshowgoodslist&#39;,&#39;main_workspace&#39;,&#39;goods_manage_op_q&#39;)">商品管理</a></li>
						<li><a href="javascript:void(0);" id="order_list_op_q"
							onclick="openURL(&#39;url&#39;,&#39;/admin/order/toshoworderlist&#39;,&#39;main_workspace&#39;,&#39;order_list_op_q&#39;)">订单管理</a></li>
					</ul>
					<ul class="ulleft" id="base_set" style="display: none;">
						<div class="leftone">基本设置</div>
						<li><a href="javascript:void(0);" id="set_site_op"
							class="this"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_site.htm&#39;,&#39;main_workspace&#39;,&#39;set_site_op&#39;)">站点设置</a></li>
						<li><a href="javascript:void(0);" id="set_image_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_image.htm&#39;,&#39;main_workspace&#39;,&#39;set_image_op&#39;)">上传设置</a></li>
						<li><a href="javascript:void(0);" id="set_seo_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_seo.htm&#39;,&#39;main_workspace&#39;,&#39;set_seo_op&#39;)">SEO设置</a></li>
						<li><a href="javascript:void(0);" id="set_email_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_email.htm&#39;,&#39;main_workspace&#39;,&#39;set_email_op&#39;)">Email设置</a></li>
						<!--           <li><a href="javascript:void(0);" id="set_second_domain_op" class="this" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_second_domain.htm','main_workspace','set_second_domain_op')">二级域名</a></li> -->
						<li><a href="javascript:void(0);" id="template_list_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/template_list.htm&#39;,&#39;main_workspace&#39;,&#39;template_list_op&#39;)">通知模板</a></li>
						<li><a href="javascript:void(0);" id="admin_list_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/admin_list.htm&#39;,&#39;main_workspace&#39;,&#39;admin_list_op&#39;)">管理员管理</a></li>
						<li><a href="javascript:void(0);" id="complex_trans"
							suffix="trans_"><img id="trans_img"
								src="/images/contract.jpg" width="13" height="13">地区管理</a>
							<ul id="trans_info">
								<li><a id="arealist_op" href="javascript:void(0);"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/area_list.htm&#39;,&#39;main_workspace&#39;,&#39;arealist_op&#39;)">常用地区</a></li>
								<li><a href="javascript:void(0);" id="trans_area_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/trans_area_list.htm&#39;,&#39;main_workspace&#39;,&#39;trans_area_op&#39;)">运费区域</a></li>
							</ul></li>
						<li><a href="javascript:void(0);" id="complex_payment"
							suffix="payment_"><img id="payment_img"
								src="/images/contract.jpg" width="13" height="13">支付管理</a>
							<ul id="payment_info">
								<li><a href="javascript:void(0);" id="payment_list_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/payment_list.htm&#39;,&#39;main_workspace&#39;,&#39;payment_list_op&#39;)">支付方式</a></li>
								<li><a href="javascript:void(0);" id="fenrun_list_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_fenrun.htm&#39;,&#39;main_workspace&#39;,&#39;fenrun_list_op&#39;)">分润管理</a></li>
							</ul></li>
						<li><a href="javascript:void(0);" id="complex_kuaidi"
							suffix="kuaidi_"><img id="kuaidi_img"
								src="/images/contract.jpg" width="13" height="13">快递设置</a>
							<ul id="kuaidi_info">
								<li><a href="javascript:void(0);" id="kaudi_set_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_kuaidi.htm&#39;,&#39;main_workspace&#39;,&#39;kaudi_set_op&#39;)">快递设置</a></li>
								<li><a href="javascript:void(0);" id="kaudi_company_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/express_company_list.htm&#39;,&#39;main_workspace&#39;,&#39;kaudi_company_op&#39;)">快递公司</a></li>
							</ul></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_goods">
						<div class="leftone">商品相关</div>
						<li><a href="javascript:void(0);" class="this"
							id="goods_class_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/sort/toclasslist?parentid=0&#39;,&#39;main_workspace&#39;,&#39;goods_class_op&#39;)">分类管理</a>
						</li>
						<li><a href="javascript:void(0);" id="goods_brand_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/brand/tobrandlist&#39;,&#39;main_workspace&#39;,&#39;goods_brand_op&#39;)">品牌管理</a></li>
						<li><a href="javascript:void(0);" id="goods_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/goods/toshowgoodslist&#39;,&#39;main_workspace&#39;,&#39;goods_manage_op&#39;)">商品管理</a></li>
						<li><a href="javascript:void(0);" id="goods_type_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_type_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_type_op&#39;)">类型管理</a></li>
						<li><a href="javascript:void(0);" id="goods_spec_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/spec/toShowSpec&#39;,&#39;main_workspace&#39;,&#39;goods_spec_op&#39;)">规格管理</a></li>
						<li><a href="javascript:void(0);" id="goods_guarantee_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_guarantee_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_guarantee_op&#39;)">保障管理</a></li>
						<li><a href="javascript:void(0);" id="goods_floor_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_floor_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_floor_op&#39;)">首页楼层</a></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_sparegoods">
						<div class="leftone">闲置相关</div>
						<li><a href="javascript:void(0);" class="this"
							id="sharegoodsclass_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoods_class_list.htm&#39;,&#39;main_workspace&#39;,&#39;sharegoodsclass_op&#39;)">闲置分类</a>
						</li>
						<li><a href="javascript:void(0);" class="this"
							id="share_goods_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoods_list.htm&#39;,&#39;main_workspace&#39;,&#39;share_goods_op&#39;)">闲置商品</a>
						</li>
						<li><a href="javascript:void(0);" class="this"
							id="sparegoodsfloor_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoodsfloor_list.htm&#39;,&#39;main_workspace&#39;,&#39;sparegoodsfloor_op&#39;)">闲置楼层</a>
						</li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_store">
						<div class="leftone">店铺相关</div>
						<li><a href="javascript:void(0);" class="this"
							id="store_base_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_base.htm&#39;,&#39;main_workspace&#39;,&#39;store_base_op&#39;)">卖家信用</a>
						</li>
						<li><a href="javascript:void(0);" id="store_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_manage_op&#39;)">店铺管理</a></li>
						<li><a href="javascript:void(0);" id="store_template_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_template.htm&#39;,&#39;main_workspace&#39;,&#39;store_template_op&#39;)">店铺模板</a></li>
						<li><a href="javascript:void(0);" id="store_grade_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/storegrade_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_grade_op&#39;)">店铺等级</a></li>
						<li><a href="javascript:void(0);" id="store_class_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/storeclass_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_class_op&#39;)">店铺分类</a></li>
						<li><a href="javascript:void(0);" id="sumOrder_list_op_q"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sumOrder_list.htm&#39;,&#39;main_workspace&#39;,&#39;sumOrder_list_op_q&#39;)">店铺订单统计</a></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_member">
						<div class="leftone">会员相关</div>
						<li><a href="javascript:void(0);" class="this"
							id="member_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/index/touserlist&#39;,&#39;main_workspace&#39;,&#39;member_manage_op&#39;)">会员管理</a>
						</li>
						<li><a href="javascript:void(0);" class="this"
							id="user_creditrule_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_creditrule.htm&#39;,&#39;main_workspace&#39;,&#39;user_creditrule_op&#39;)">会员信用</a>
						</li>
						<li><a href="javascript:void(0);" id="user_msg_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_msg.htm&#39;,&#39;main_workspace&#39;,&#39;user_msg_op&#39;)">会员通知</a></li>
						<!--           <li><a href="javascript:void(0);" id="user_integral_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/user_integral.htm','main_workspace','user_integral_op')">积分管理</a></li> -->
						<!--           <li><a href="javascript:void(0);" id="integrallog_list_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/integrallog_list.htm','main_workspace','integrallog_list_op')">积分明细</a></li> -->
						<li><a href="javascript:void(0);" id="predeposit_list_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/predeposit_list.htm&#39;,&#39;main_workspace&#39;,&#39;predeposit_list_op&#39;)">预存款管理</a></li>
						<li><a href="javascript:void(0);" id="predepositlog_list_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/predepositlog_list.htm&#39;,&#39;main_workspace&#39;,&#39;predepositlog_list_op&#39;)">预存款明细</a></li>
						<li><a href="javascript:void(0);" id="img_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_photo_list.htm&#39;,&#39;main_workspace&#39;,&#39;img_op&#39;)">图片管理</a></li>
						<li><a href="javascript:void(0);" id="complex_sns"
							suffix="sns_"><img id="sns_img" src="/images/contract.jpg"
								width="13" height="13">SNS管理</a>
							<ul id="sns_info">
								<li><a id="user_sns_op" href="javascript:void(0);"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sns_user.htm&#39;,&#39;main_workspace&#39;,&#39;user_sns_op&#39;)">会员动态</a></li>
								<li><a href="javascript:void(0);" id="store_sns_op"
									onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sns_store.htm&#39;,&#39;main_workspace&#39;,&#39;store_sns_op&#39;)">店铺动态</a></li>
							</ul></li>
						<li><a href="javascript:void(0);" id="user_weixin_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_weixin.htm&#39;,&#39;main_workspace&#39;,&#39;user_weixin_op&#39;)">微信会员</a></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_trade">
						<div class="leftone">交易管理</div>
						<li><a href="javascript:void(0);" id="order_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/order/toshoworderlist&#39;,&#39;main_workspace&#39;,&#39;order_manage_op&#39;)">订单管理</a>
						</li>
						<li><a href="javascript:void(0);" id="set_order_confirm_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_order_confirm.htm&#39;,&#39;main_workspace&#39;,&#39;set_order_confirm_op&#39;)">订单设置</a>
						</li>
						<li><a href="javascript:void(0);" id="consult_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/consult_list.htm&#39;,&#39;main_workspace&#39;,&#39;consult_manage_op&#39;)">咨询管理</a></li>
						<li><a href="javascript:void(0);" id="report_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/report_list.htm&#39;,&#39;main_workspace&#39;,&#39;report_manage_op&#39;)">举报管理</a></li>
						<li><a href="javascript:void(0);" id="evaluate_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/evaluate_list.htm&#39;,&#39;main_workspace&#39;,&#39;evaluate_manage_op&#39;)">商品评价</a></li>
						<li><a href="javascript:void(0);" id="complaint_manage_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/complaint_list.htm&#39;,&#39;main_workspace&#39;,&#39;complaint_manage_op&#39;)">投诉管理</a></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="about_website">
						<div class="leftone">网站相关</div>
						<li><a href="javascript:void(0);" class="this"
							id="articleClass_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/articleclass_list.htm&#39;,&#39;main_workspace&#39;,&#39;articleClass_op&#39;);">文章分类</a>
						</li>
						<li><a href="javascript:void(0);" id="article_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/article_list.htm&#39;,&#39;main_workspace&#39;,&#39;article_op&#39;);">文章管理</a></li>
						<li><a href="javascript:void(0);" id="document_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/document_list.htm&#39;,&#39;main_workspace&#39;,&#39;document_op&#39;);">系统文章</a></li>
						<li><a href="javascript:void(0);" id="partner_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/partner_list.htm&#39;,&#39;main_workspace&#39;,&#39;partner_op&#39;);">合作伙伴</a></li>
						<li><a href="javascript:void(0);" id="nav_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/navigation_list.htm&#39;,&#39;main_workspace&#39;,&#39;nav_op&#39;);">页面导航</a></li>
					</ul>
					<ul class="ulleft" style="display: none;" id="business_operation">
						<div class="leftone">运营管理</div>
						<li><a href="javascript:void(0);" class="this"
							id="operation_base_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/operation_base_set.htm&#39;,&#39;main_workspace&#39;,&#39;operation_base_op&#39;)">基本设置</a>
						</li>
						<li><a href="javascript:void(0);" id="gold_record_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/gold_record.htm&#39;,&#39;main_workspace&#39;,&#39;gold_record_op&#39;)">金币管理</a></li>
						<!--           <li><a href="javascript:void(0);" id="ztc_set" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/ztc_set.htm','main_workspace','ztc_set')">竞价直通车</a></li> -->
						<li><a href="javascript:void(0);" id="coupon_set_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/coupon_list.htm&#39;,&#39;main_workspace&#39;,&#39;coupon_set_op&#39;)">优惠券管理</a></li>
						<li><a href="javascript:void(0);" id="advert_set_op"
							onclick="openURL(&#39;url&#39;,&#39;/admin/ad/toshowadlist&#39;,&#39;main_workspace&#39;,&#39;advert_set_op&#39;)">广告管理</a></li>
						<!--           <li><a href="javascript:void(0);" id="group_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/group_list.htm','main_workspace','group_op')">团购管理</a></li> -->
						<li><a href="javascript:void(0);" id="send_message"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/activityMessage_list.htm&#39;,&#39;main_workspace&#39;,&#39;send_message&#39;)">发送消息</a></li>
						<!--         <li><a href="javascript:void(0);" id="love_show" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/show_list.htm','main_workspace','love_show')">秀秀秀秀</a></li>  -->
						<li><a href="javascript:void(0);" id="love_show"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/loveShow_list.htm&#39;,&#39;main_workspace&#39;,&#39;love_show&#39;)">爱心公益</a></li>
						<li><a href="javascript:void(0);" id="show"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/show_list.htm&#39;,&#39;main_workspace&#39;,&#39;show&#39;)">童臻秀场</a></li>
						<li><a href="javascript:void(0);" id="event"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/event_list.htm&#39;,&#39;main_workspace&#39;,&#39;event&#39;)">童臻活动</a></li>
						<li><a href="javascript:void(0);" id="apply"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/apply_list.htm&#39;,&#39;main_workspace&#39;,&#39;apply&#39;)">活动申请</a></li>
						<li><a href="javascript:void(0);" id="movie"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/movie_list.htm&#39;,&#39;main_workspace&#39;,&#39;movie&#39;)">影视综艺</a></li>
						<li><a href="javascript:void(0);" id="messagetz"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/messagetz_list.htm&#39;,&#39;main_workspace&#39;,&#39;messagetz&#39;)">童臻消息</a></li>
						<!--           <li><a href="javascript:void(0);" id="complex_integral" suffix="integral_center_"><img id="integral_center_img" src="/images/contract.jpg" width="13" height="13" />积分中心</a> -->
						<!--         <ul id="integral_center_info"> -->
						<!--                <li><a href="javascript:void(0);" id="integral_rule_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/operation_integral_rule.htm','main_workspace','integral_rule_op')">积分规则</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="integral_shop_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/integral_goods.htm','main_workspace','integral_shop_op')">积分商城</a></li> -->
						<!--             </ul> -->
						<!--           </li> -->
						<!--            <li><a href="javascript:void(0);"id="complex_sale" suffix="sale_promotion_"><img id="sale_promotion_img" src="/images/contract.jpg" width="13" height="13" />促销管理</a>  -->
						<!--            <ul id="sale_promotion_info"> -->
						<!--               <li><a href="javascript:void(0);" id="activity_set_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/activity_list.htm','main_workspace','activity_set_op')">活动管理</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="bargain_set_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_bargain.htm','main_workspace','bargain_set_op')">天天特价</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="delivery_set_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_delivery.htm','main_workspace','delivery_set_op')">买就送</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="combin_set_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_combin.htm','main_workspace','combin_set_op')">组合销售</a></li>            -->
						<!--             </ul> -->
						<!--           </li> -->
						<!-- 新增大转盘活动管理 -->
						<!--           <li><a href="javascript:void(0);"id="complex_activity" suffix="activity_manage_"><img id="activity_manage_img" src="/images/contract.jpg" width="13" height="13" />活动管理</a>  -->
						<!--            <ul id="activity_manage_info"> -->
						<!--               <li><a href="javascript:void(0);" id="activity_admin_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/activity_list2.htm','main_workspace','activity_admin_op')">活动管理</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="part_record_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/partRecord_list.htm','main_workspace','part_record_op')">参与记录</a></li> -->
						<!--               <li><a href="javascript:void(0);" id="claim_prize_op" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/claim_list.htm','main_workspace','claim_prize_op')">兑奖管理</a></li> -->
						<!--             </ul> -->
						<!--           </li> -->

					</ul>
					<ul class="ulleft" style="display: none;" id="sys_tool">
						<div class="leftone">系统工具</div>
						<li><a href="javascript:void(0);" id="cache_list_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/cache_list.htm&#39;,&#39;main_workspace&#39;,&#39;cache_list_op&#39;)">缓存管理</a></li>
						<li><a href="javascript:void(0);" id="database_add_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/database_add.htm&#39;,&#39;main_workspace&#39;,&#39;database_add_op&#39;)">数据库管理</a></li>
						<li><a href="javascript:void(0);" id="lucene_op"
							onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/lucene.htm&#39;,&#39;main_workspace&#39;,&#39;lucene_op&#39;)">全文检索</a></li>
					</ul>

					<!-- <div class="statement" style="font-size:12px; font-family:Arial, Helvetica, sans-serif;">Powered By<a href="#" target="_blank"> <strong><span style="color:#FD7C20;">Shopping</span></strong></a> <sup>V2.0</sup>©2015 shopping Inc.</div> -->
				</div>
			</div>
			<div class="content" style="width: 90%; height: 569px;">
				<div class="navbar">
					<span class="webmap"><a href="javascript:void(0);">管理地图</a></span>
					<span class="webskin"> <b>更换皮肤：</b> <em> <a
							href="javascript:void(0);" class="this"> <i><img
									src="/images/skin_blue.gif" width="15" height="16"
									webcss="blue"></i>
						</a> <a href="javascript:void(0);"> <i><img
									src="/images/skin_black.gif" width="15" height="16"
									webcss="black"></i>
						</a></em>
					</span>
					<div style="line-height: 36px;">
						您的位置：控制台&gt;<span id="top_nav_info">站点设置</span>
					</div>
				</div>
				<iframe id="main_workspace" name="main_workspace"
					src="/admin/index/welcome"
					style="overflow: auto; height: 467px; width: 1226px;"
					frameborder="0" width="100%" height="100%" scrolling="yes"
					onload="window.parent"></iframe>
			</div>
		</div>
	</div>
	<div class="webmap_box" style="display: none;">
		<h4>
			<a href="javascript:void(0);" class="close_map"></a>管理中心导航
		</h4>
		<div class="webmap_list">
			<span class="weblist_sp">
				<h5>设置</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_site.htm&#39;,&#39;main_workspace&#39;,&#39;set_site_op&#39;,&#39;base_set&#39;)">站点设置</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_image.htm&#39;,&#39;main_workspace&#39;,&#39;set_image_op&#39;,&#39;base_set&#39;)">上传设置</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_seo.htm&#39;,&#39;main_workspace&#39;,&#39;set_seo_op&#39;,&#39;base_set&#39;)">SEO设置</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_email.htm&#39;,&#39;main_workspace&#39;,&#39;set_email_op&#39;,&#39;base_set&#39;)">Email设置</a>
				<!--     <a href="javascript:void(0);" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_second_domain.htm','main_workspace','set_second_domain_op','base_set')">二级域名</a> -->
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/template_list.htm&#39;,&#39;main_workspace&#39;,&#39;template_list_op&#39;,&#39;base_set&#39;)">通知模板</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/admin_list.htm&#39;,&#39;main_workspace&#39;,&#39;admin_list_op&#39;,&#39;base_set&#39;)">管理员管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/area_list.htm&#39;,&#39;main_workspace&#39;,&#39;arealist_op&#39;,&#39;base_set&#39;)">常用地区</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/trans_area_list.htm&#39;,&#39;main_workspace&#39;,&#39;trans_area_op&#39;,&#39;base_set&#39;)">运费区域</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/payment_list.htm&#39;,&#39;main_workspace&#39;,&#39;payment_list_op&#39;,&#39;base_set&#39;)">支付方式</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_fenrun.htm&#39;,&#39;main_workspace&#39;,&#39;fenrun_list_op&#39;,&#39;base_set&#39;)">分润管理</a>
				<a href="javascript:void(0);" id="kaudi_set_op"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_kuaidi.htm&#39;,&#39;main_workspace&#39;,&#39;kaudi_set_op&#39;,&#39;base_set&#39;)">快递设置</a>
				<a href="javascript:void(0);" id="kaudi_company_op"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/express_company_list.htm&#39;,&#39;main_workspace&#39;,&#39;kaudi_company_op&#39;,&#39;base_set&#39;)">快递公司</a>
			</span> <span class="weblist_sp">
				<h5>商品</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/sort/toclasslist?parentid=0&#39;,&#39;main_workspace&#39;,&#39;goods_class_op&#39;,&#39;about_goods&#39;)">分类管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/brand/tobrandlist&#39;,&#39;main_workspace&#39;,&#39;goods_brand_op&#39;,&#39;about_goods&#39;)">品牌管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/goods/toshowgoodslist&#39;,&#39;main_workspace&#39;,&#39;goods_manage_op&#39;,&#39;about_goods&#39;)">商品管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_type_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_type_op&#39;,&#39;about_goods&#39;)">类型管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_spec_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_spec_op&#39;,&#39;about_goods&#39;)">规格管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/goods_floor_list.htm&#39;,&#39;main_workspace&#39;,&#39;goods_floor_op&#39;,&#39;about_goods&#39;)">首页楼层</a>
			</span> <span class="weblist_sp">
				<h5>闲置</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoods_class_list.htm&#39;,&#39;main_workspace&#39;,&#39;sharegoodsclass_op&#39;,&#39;about_sparegoods&#39;)">闲置分类</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoods_list.htm&#39;,&#39;main_workspace&#39;,&#39;share_goods_op&#39;,&#39;about_sparegoods&#39;)">闲置商品</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sparegoodsfloor_list.htm&#39;,&#39;main_workspace&#39;,&#39;sparegoodsfloor_op&#39;,&#39;about_sparegoods&#39;)">闲置楼层</a>
			</span> <span class="weblist_sp">
				<h5>店铺</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_base.htm&#39;,&#39;main_workspace&#39;,&#39;store_base_op&#39;,&#39;about_store&#39;)">卖家信用</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_manage_op&#39;,&#39;about_store&#39;)">店铺管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/store_template.htm&#39;,&#39;main_workspace&#39;,&#39;store_template_op&#39;,&#39;about_store&#39;)">店铺模板</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/storegrade_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_grade_op&#39;,&#39;about_store&#39;)">店铺等级</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/storeclass_list.htm&#39;,&#39;main_workspace&#39;,&#39;store_class_op&#39;,&#39;about_store&#39;)">店铺分类</a>
			</span> <span class="weblist_sp">
				<h5>会员</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/index/touserlist&#39;,&#39;main_workspace&#39;,&#39;member_manage_op&#39;,&#39;about_member&#39;)">会员管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_creditrule.htm&#39;,&#39;main_workspace&#39;,&#39;user_creditrule_op&#39;,&#39;about_member&#39;)">会员信用</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_msg.htm&#39;,&#39;main_workspace&#39;,&#39;user_msg_op&#39;,&#39;about_member&#39;)">会员通知</a>
				<!--     <a href="javascript:void(0);" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/user_integral.htm','main_workspace','user_integral_op','about_member')">积分管理</a> -->
				<!--     <a href="javascript:void(0);" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/integrallog_list.htm','main_workspace','integrallog_list_op','about_member')">积分明细</a> -->
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/predeposit_list.htm&#39;,&#39;main_workspace&#39;,&#39;predeposit_list_op&#39;,&#39;about_member&#39;)">预存款管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/predepositlog_list.htm&#39;,&#39;main_workspace&#39;,&#39;predepositlog_list_op&#39;,&#39;about_member&#39;)">预存款明细</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_photo_list.htm&#39;,&#39;main_workspace&#39;,&#39;img_op&#39;,&#39;about_member&#39;)">图片管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sns_user.htm&#39;,&#39;main_workspace&#39;,&#39;user_sns_op&#39;,&#39;about_member&#39;)">会员动态</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/sns_store.htm&#39;,&#39;main_workspace&#39;,&#39;store_sns_op&#39;,&#39;about_member&#39;)">店铺动态</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_weixin.htm&#39;,&#39;main_workspace&#39;,&#39;user_weixin_op&#39;,&#39;about_member&#39;)">微信会员</a>
			</span> <span class="weblist_sp">
				<h5>交易</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/order/toshoworderlist&#39;,&#39;main_workspace&#39;,&#39;order_manage_op&#39;,&#39;about_trade&#39;)">订单管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_order_confirm.htm&#39;,&#39;main_workspace&#39;,&#39;set_order_confirm_op&#39;,&#39;about_trade&#39;)">订单设置</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/consult_list.htm&#39;,&#39;main_workspace&#39;,&#39;consult_manage_op&#39;,&#39;about_trade&#39;)">咨询管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/report_list.htm&#39;,&#39;main_workspace&#39;,&#39;report_manage_op&#39;,&#39;about_trade&#39;)">举报管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/evaluate_list.htm&#39;,&#39;main_workspace&#39;,&#39;evaluate_manage_op&#39;,&#39;about_trade&#39;)">商品评价</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/complaint_list.htm&#39;,&#39;main_workspace&#39;,&#39;complaint_manage_op&#39;,&#39;about_trade&#39;)">投诉管理</a>
				<a href="javascript:void(0);" id="user_weixin_op"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/user_weixin.htm&#39;,&#39;main_workspace&#39;,&#39;user_weixin_op&#39;)">微信会员</a>
			</span> <span class="weblist_sp">
				<h5>网站</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/articleclass_list.htm&#39;,&#39;main_workspace&#39;,&#39;articleClass_op&#39;,&#39;about_website&#39;);">文章分类</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/article_list.htm&#39;,&#39;main_workspace&#39;,&#39;article_op&#39;,&#39;about_website&#39;);">文章管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/document_list.htm&#39;,&#39;main_workspace&#39;,&#39;document_op&#39;,&#39;about_website&#39;);">系统文章</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/partner_list.htm&#39;,&#39;main_workspace&#39;,&#39;partner_op&#39;,&#39;about_website&#39;);">合作伙伴</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/navigation_list.htm&#39;,&#39;main_workspace&#39;,&#39;nav_op&#39;,&#39;about_website&#39;);">页面导航</a>
			</span> <span class="weblist_sp">
				<h5>运营</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/operation_base_set.htm&#39;,&#39;main_workspace&#39;,&#39;operation_base_op&#39;,&#39;business_operation&#39;)">基本设置</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/gold_record.htm&#39;,&#39;main_workspace&#39;,&#39;gold_record_op&#39;,&#39;business_operation&#39;)">金币管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/ztc_set.htm&#39;,&#39;main_workspace&#39;,&#39;ztc_set&#39;,&#39;business_operation&#39;)">竞价直通车</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/coupon_list.htm&#39;,&#39;main_workspace&#39;,&#39;coupon_set_op&#39;,&#39;business_operation&#39;)">优惠券管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;/admin/ad/toshowadlist&#39;,&#39;main_workspace&#39;,&#39;advert_set_op&#39;,&#39;business_operation&#39;)">广告管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/group_list.htm&#39;,&#39;main_workspace&#39;,&#39;group_op&#39;,&#39;business_operation&#39;)">团购管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/operation_integral_rule.htm&#39;,&#39;main_workspace&#39;,&#39;integral_rule_op&#39;,&#39;business_operation&#39;)">积分规则</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/integral_goods.htm&#39;,&#39;main_workspace&#39;,&#39;integral_shop_op&#39;,&#39;business_operation&#39;)">积分商城</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/activity_list.htm&#39;,&#39;main_workspace&#39;,&#39;activity_set_op&#39;,&#39;business_operation&#39;)">活动管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/set_bargain.htm&#39;,&#39;main_workspace&#39;,&#39;bargain_set_op&#39;,&#39;business_operation&#39;)">天天特价</a>
				<!--     <a href="javascript:void(0);" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_delivery.htm','main_workspace','delivery_set_op','business_operation')">买就送</a> -->
				<!--     <a href="javascript:void(0);" onclick="openURL('url','http://192.168.1.233:11585/shopping/admin/set_combin.htm','main_workspace','combin_set_op','business_operation')">组合销售</a> -->
			</span> <span class="weblist_sp">
				<h5>工具</h5> <a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/cache_list.htm&#39;,&#39;main_workspace&#39;,&#39;cache_list_op&#39;,&#39;sys_tool&#39;);">缓存管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/database_add.htm&#39;,&#39;main_workspace&#39;,&#39;database_add_op&#39;,&#39;sys_tool&#39;);">数据库管理</a>
				<a href="javascript:void(0);"
				onclick="openURL(&#39;url&#39;,&#39;http://192.168.1.233:11585/shopping/admin/lucene.htm&#39;,&#39;main_workspace&#39;,&#39;lucene_op&#39;,&#39;sys_tool&#39;)">全文检索</a>
			</span>
		</div>
	</div>



</body>
</html>