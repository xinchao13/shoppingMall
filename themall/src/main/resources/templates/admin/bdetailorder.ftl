<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0066)http://192.168.1.233:11585/shopping/admin/order_view.htm?id=230305 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title></title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="cont">
		<div class="orderdetail">
			<div class="orderh">订单状态</div>
			<div class="orderul">
				<ul>
					<li><span class="ordertitle">订单号:</span><span>${orderDetail.ordernum}</span></li>
					<li><span class="ordertitle"> 订单状态:</span><span><#if
								orderDetail.orderstatus==0> 待付款&nbsp;&nbsp;&nbsp;&nbsp; <a
								style="color: #ff4f19; text-decoration: underline;"
								href="/admin/order/cancelorder?orderid=${orderDetail.id}">取消订单</a>
							<#elseif orderDetail.orderstatus==1>
							待发货&nbsp;&nbsp;&nbsp;&nbsp; <a
								style="color: #ff4f19; text-decoration: underline;"
								href="/admin/order/remind?orderid=${orderDetail.id}">发货</a> <#elseif
								orderDetail.orderstatus==2> 已发货 <#elseif
								orderDetail.orderstatus==3> 已收货 <#elseif
								orderDetail.orderstatus==4> 已完成 <#else> 已完成 </#if></span></li>
					<li><span class="ordertitle">运费:</span><span>¥0.0[平邮]</span></li>
					<li><span class="ordertitle">订单总额:</span><span><strong
							class="orange" style="padding-right: 10px;">¥${orderDetail.ordersum}</strong></span></li>
				</ul>
			</div>
			<div class="orderh">订单详情</div>
			<div class="orderhh">订单信息</div>
			<div class="orderul">
				<ul>
					<li><span class="ordertitle">买家名称:</span><span>${orderDetail.user.userName}</span></li>
					<li><span class="ordertitle"> 卖家名称:</span><span>电商平台自营店</span></li>
					<li><span class="ordertitle">支付方式:</span><span>未支付</span></li>
					<li><span class="ordertitle">下单时间:</span><span>${orderDetail.addtime?string("yyyy-MM-dd
							HH:mm:ss")}</span></li>
				</ul>
			</div>
			<div class="orderhhh">收货人及发货信息</div>
			<div class="orderul">
				<ul>
					<li><span class="ordertitle">收货人姓名:</span><span>${orderDetail.consigneename}</span></li>
					<li><span class="ordertitle">所在地区:</span><span>
							${orderDetail.procityarea} </span></li>
					<li><span class="ordertitle">邮政编码:</span><span>${orderDetail.postcodecode}</span></li>
					<li><span class="ordertitle">手机号码:</span><span>${orderDetail.phone}</span></li>
					<!--         <li><span class="ordertitle">手机号码:</span><span></span></li> -->
					<li><span class="ordertitle">详细地址:</span><span>${orderDetail.detailaddress}</span></li>
					<li><span class="ordertitle">配送方式:</span><span></span></li>
				</ul>
			</div>
			<div class="orderhhh">商品信息</div>
			<div class="ordetable">
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="orde_table">
					<tbody>
						<tr style="border-bottom: 1px dotted #CCEAF4">
							<td width="20%">&nbsp;</td>
							<td width="50%"><strong>商品信息</strong></td>
							<td width="10%"><strong>商品规格</strong></td>
							<td width="10%"><strong>单价</strong></td>
							<td width="10%"><strong>数量</strong></td>
						</tr>
						<#list orderDetail.listDetailOrder as detailOrder>
						<tr style="border-bottom: 1px dotted #CCEAF4">
							<td><img src="${detailOrder.goods.imgpath}" width="45"
								height="45"></td>
							<td><a href="/shopping/goods_98579.htm" target="_blank"
								class="blue">${detailOrder.goods.goodname}</a></td>
							<td></td>
							<td><strong class="orange">¥</strong><strong
								style="color: #F90"> #{detailOrder.goods.newprice;m2M2}</strong></td>
							<td>${detailOrder.count}</td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
			<div class="orderhhh">物流信息</div>
			<div class="orderul_record">
				<ul>
				</ul>
			</div>


			<div class="orderhhh">操作历史</div>
			<div class="orderul_record">
				<ul>
					<li><strong style="color: #F90">${orderDetail.user.userName}</strong>于<strong><em>${orderDetail.addtime?string("yyyy-MM-dd
								HH:mm:ss")} </em></strong>提交订单</li>
				</ul>
			</div>
		</div>
		<div class="submit">
			<input name="go" type="button" value="返回列表"
				onclick="window.location.href=&#39;/admin/order/toshoworderlist&#39;">
		</div>
	</div>


</body>
</html>