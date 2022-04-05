<div class="menu-bd-panel">
	<div class="gwc">
		<h1>
			购物车商品总价：¥<span id="cart_goods_price_top">${sum}</span>
		</h1>
		<#list listGoodCart as goodcart>
		<div class="shopp_ingtop" id="232517">
			<div class="shopimg">
				<a href="" target="_blank"><img src="${goodcart.goods.imgpath}"
					width="40" height="40"></a>
			</div>
			<div>
				<span class="shopl"><a href="" target="_blank">${goodcart.goods.goodname}</a></span><span
					style="color: #F60; padding-left: 15px;">¥${goodcart.goods.newprice}×${goodcart.count}</span>
			</div>
			<div>
				<span class="shopl_del"><a href="javascript:void(0);"
					onclick="cart_remove('232517','32848');">删除</a></span>
			</div>
		</div>
		</#list>
		<div class="shopbtn">
			<a href="/goods/toshowgoodcart">查看我的购物车</a>
		</div>
	</div>
</div>