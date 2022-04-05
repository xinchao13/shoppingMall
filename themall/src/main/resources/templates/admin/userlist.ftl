<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0055)http://192.168.1.233:11585/shopping/admin/user_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>会员列表页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="./jquery-1.6.2.js"></script>
		<script src="./jquery.shop.common.js.下载"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
jQuery(document).ready(function(){
  jQuery(".memimg").mouseover(function(){
     jQuery(this).css("cursor","pointer");
	 jQuery(".mem_detail[id^=user_detail_]").hide();
     var id=jQuery(this).attr("id");
	 jQuery("#user_detail_"+id).show();
  });
  jQuery(".mem_detail[id^=user_detail_]").mouseleave(function(){
    jQuery(this).hide();
  });
});
</script>
		<style id="poshytip-css-tip-skyblue" type="text/css">
div.tip-skyblue {
	visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
}

div.tip-skyblue table, div.tip-skyblue td {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	font-style: inherit;
	font-variant: inherit;
}

div.tip-skyblue td.tip-bg-image span {
	display: block;
	font: 1px/1px sans-serif;
	height: 10px;
	width: 10px;
	overflow: hidden;
}

div.tip-skyblue td.tip-right {
	background-position: 100% 0;
}

div.tip-skyblue td.tip-bottom {
	background-position: 100% 100%;
}

div.tip-skyblue td.tip-left {
	background-position: 0 100%;
}

div.tip-skyblue div.tip-inner {
	background-position: -10px -10px;
}

div.tip-skyblue div.tip-arrow {
	visibility: hidden;
	position: absolute;
	overflow: hidden;
	font: 1px/1px sans-serif;
}
</style>
</head>

<body>
	<div class="cont">
		<h1 class="seth1">会员管理</h1>
		<div class="operation">
			<h3>友情提示</h3>
			<ul>
				<li>可用金额，买家会员可以用来支付订单、提现，卖家可以用来支付商城收费服务</li>
				<!--         <li>冻结金额，当会员进行提现操作后，提现金额变为冻结金额等待管理员审核操作。当会员使用预存款支付购买时，在订单支付后且未收货之前， -->
				<!--           可用金额减少，支付的金额变为冻结金额，直到确认收货后，冻结金额减少，卖家可用金额增加。冻结金额不能用来支付或提现</li> -->
			</ul>
		</div>
		<form name="ListForm" id="ListForm" action="javascript:void(0)"
			method="post">
			<div class="allmem_table">
				<table width="98%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr style="background: #2A7AD2; height: 30px; color: #FFF">
							<td width="3%" align="left">&nbsp;</td>
							<td width="10%" align="left">头像</td>
							<td width="8%" align="left">用户名</td>
							<td width="7%" align="left">身份</td>
							<td width="6%" align="center">真实姓名</td>
							<td width="6%" align="center">性别</td>
							<td width="6%" align="center">电话</td>
							<td width="15%" align="center">邮箱</td>
							<td width="15%" align="center">注册时间</td>
							<td align="center">操作</td>
						</tr>
						<#list listUser as user>
						<tr>
							<td width="3%" align="left">&nbsp;</td>
							<td align="left"><span class="memimg"> <img
									src="${user.imgpath}" width="45" height="49"></span></td>
							<td>${user.userName}</td>
							<#if (user.power==true)>
							<td class="center">管理员</td>
							<#else>
							<td class="center">会员</td></#if>
							<td align="center">${user.trueName!}</td>
							<td class="lightred">${user.sex!}</td>
							<td class="lightred">${user.phone!}</td>
							<td class="lightred">${user.email!}</td>
							<td class="lightred">${user.addtime?string('yyyy-MM-dd
								HH:mm:ss')}</td>
							<td align="center">编辑</td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</form>
	</div>


	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
	<div class="tip-skyblue">
		<div class="tip-inner tip-bg-image"></div>
		<div class="tip-arrow"></div>
	</div>
</body>
</html>