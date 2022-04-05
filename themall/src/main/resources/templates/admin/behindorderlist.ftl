<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0056)http://192.168.1.233:11585/shopping/admin/order_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title></title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<link href="/css/jquery-ui-1.8.22.custom.css" type="text/css"
			rel="stylesheet">
			<script src="/js/jquery-1.6.2.js"></script>
			<script src="/js/jquery.validate.min.js"></script>
			<script src="/js/jquery.shop.common.js"></script>
			<script src="/js/jquery.poshytip.min.js"></script>
			<script src="/js/jquery-ui-1.8.21.js"></script>
			<script src="/js/jquery.zh.cn.js"></script>
			<script>
jQuery(document).ready(function(){
  jQuery('#beginTime').datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  jQuery('#endTime').datepicker({
	  dateFormat:"yy-mm-dd",
	  changeMonth: true,
	  changeYear: true
  });
  //
});

//修改退款金额
var refund_id=0;
function refund(refund_id,obj){
 	var refundment = $(obj).val();
	jQuery.ajax({
			type:'POST',
	        url:'http://192.168.1.233:11585/shopping/admin/order_refund.htm',
	        data:{"refundment":refundment,"refund_id":refund_id},
			success:function(){
             		alert("退款金额保存成功");           
       		}
	});	
}
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
		<h1 class="seth1">订单管理</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="javascript:void(0);" class="this">所有订单</a></span> <span
				class="tab-two"></span>
		</div>
		<form action="/admin/order/toshoworderlist" method="post"
			id="queryForm">
			<div class="orders">
				<ul>
					<li><span>订单状态</span><span class="ordersel"> <select
							name="order_status" id="order_status">
								<option value="">所有订单</option>
								<option value="0">待付款</option>
								<option value="1">待发货</option>
								<option value="2">已发货</option>
								<option value="3">已收货</option>
								<option value="4">已完成</option>
						</select>
					</span><span>类型</span><span> <select name="type" id="type">
								<option value="buyer">买家名称</option>
								<option value="order">订单号</option>
						</select>
					</span> <span class="order_input size1"> <input name="type_data"
							type="text" id="type_data"></span> <!--       <span>支付方式</span><span> -->
						<!--         <select name="payment" id="payment"> --> <!--           <option value="">所有支付方式</option> -->
						<!--           <option value="alipay">支付宝</option> --> <!--           <option value="chinabank">网银在线</option> -->
						<!--           <option value="bill">快钱</option> --> <!--           <option value="tenpay">财付通</option> -->
						<!--           <option value="outline">线下支付</option> --> <!--           <option value="balance">预付款支付</option> -->
						<!--         </select> --> <!--         </span> --></li>
					<li><span>下单时间</span><span class="order_input size2"> <input
							name="beginTime" type="date"></span><span>—</span><span
						class="order_input size2"> <input name="endTime"
							type="date"></span> <span>订单金额</span><span
						class="order_input size2"> <input name="begin_price"
							type="text" id="begin_price"></span><span>—</span><span
						class="order_input size2"> <input name="end_price"
							type="text" id="end_price"></span> <span class="btn_search">
							<input name="" type="submit" value="搜索" style="cursor: pointer;">
					</span></li>
				</ul>
			</div>
		</form>
		<form action="/admin/order/toshoworderlist" method="post"
			id="ListForm">
			<div class="allshop_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr style="background: #2A7AD2; height: 30px; color: #FFF">
							<td width="15%">店铺名称</td>
							<td width="15%">订单号</td>
							<td width="10%">买家名称</td>
							<td width="15%">下单时间</td>
							<td width="8%">订单总额</td>
							<td width="10%">支付方式</td>
							<td width="8%">订单状态</td>
							<!--         <td width="8%">退款金额</td> -->
							<td align="center">操作</td>
						</tr>
						<#list listOrder as order>
						<tr>
							<td>电商平台自营店</td>
							<td>${order.ordernum}</td>
							<td>${order.user.userName}</td>
							<td>${order.addtime?string("yyyy-MM-dd HH:mm:ss")}</td>
							<td>#{order.ordersum;m2M2}</td>
							<td>未支付</td>
							<td><#if order.orderstatus==0> 待付款 <#elseif
									order.orderstatus==1> 待发货 <#elseif
									order.orderstatus==2> 已发货 <#elseif
									order.orderstatus==3> 已收货 <#elseif
									order.orderstatus==4> 已完成 <#else> 已完成 </#if></td>
							<!--         <td><input type="text" id="refundment"  name="refundment" onkeyup="this.value=/^\d+\.?\d{0,8}$/.test(this.value) ? this.value : ''" size="6"  onblur="refund(230301,this)" value=" 0.00 " /></td>        -->
							<td align="center" class="blue xiahua"><a
								href="/admin/order/toshowdetailorder?ordernum=${order.id}">查看</a></td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
			<div class="fenye">

				<input name="end_price" type="hidden" id="end_price" value="">
					<input name="begin_price" type="hidden" id="begin_price" value="">
						<input name="endTime" type="hidden" id="endTime" value="">
							<input name="beginTime" type="hidden" id="beginTime" value="">
								<input name="type_data" type="hidden" id="type_data" value="">
									<input name="type" type="hidden" id="type" value=""> <input
										name="order_status" type="hidden" id="order_status" value="">

											<input name="currentPage" type="hidden" id="currentPage"
											value="1"> <a href="javascript:void(0);"
												onclick="return gotoPage(1)">首页</a> 第 <a class="this"
												href="javascript:void(0);" onclick="return gotoPage(1)">1</a>
												<a href="javascript:void(0);" onclick="return gotoPage(2)">2</a>
												<a href="javascript:void(0);" onclick="return gotoPage(3)">3</a>
												<a href="javascript:void(0);" onclick="return gotoPage(4)">4</a>
												<a href="javascript:void(0);" onclick="return gotoPage(5)">5</a>
												<a href="javascript:void(0);" onclick="return gotoPage(6)">6</a>
												页 <a href="javascript:void(0);" onclick="return gotoPage(2)">下一页</a>
												<a href="javascript:void(0);" onclick="return gotoPage(26)">末页</a>
			</div>
		</form>
	</div>


	<div id="ui-datepicker-div"
		class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
</body>
</html>