<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0056)http://192.168.1.233:11585/shopping/admin/goods_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>商品管理列表页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
//
function ajax_update(id,fieldName,obj,value){
   var val;
   if(value==undefined){
	 val=jQuery(obj).val();
   }else val=value; 
   jQuery.ajax({type:'POST',
	              url:'http://192.168.1.233:11585/shopping/admin/goods_ajax.htm',
				  data:{"id":id,"fieldName":fieldName,"value":val},
				beforeSend:function(){
				  
				},
			   success:function(data){
	             if(val==""){
				   jQuery(obj).attr("src","http://192.168.1.233:11585/shopping/resources/style/system/manage/blue/images/"+data+".png");
				 }else{
				   jQuery(obj).val(val);
				 }    
				 if(value!=undefined){
				   jQuery(obj.parentNode.parentNode).remove();
				 }
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
<body scroll="yes">
	<div class="cont">
		<h1 class="seth1">商品管理</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="/admin/goods/toshowgoodslist" class="this">所有商品</a> | <a
				href="/admin/goods/toinsertgoods">新增商品</a> | <a
				href="javascript:void(0)">违规下架商品</a></span> <span class="tab-two"></span>
		</div>
		<form name="queryForm" id="queryForm"
			action="/admin/goods/toshowgoodslist" method="post">
			<input name="currentPage" type="hidden" id="currentPage" value="">
				<div class="allmem_search">
					<ul>
						<li><span>商品名称</span> <span class="allmen size4"> <input
								name="goods_name" type="text" id="goods_name"></span> <span>品牌名称</span>
							<select name="goods_brandid" id="goods.goods_brand.id">
								<option value="">所有品牌</option>
								<#list listBrand as brand>
								<option value="${brand.id}">${brand.brandName}</option>
								</#list>
						</select> <span>类别</span> <select name="goods_gcid" id="goods.gc.id">
								<option value="">所有分类</option>
								<#list listSort as sort>
								<option value="${sort.id}">${sort.sortName}</option>
								<#list sort.listSort2 as sort2>
								<option value="${sort2.id}">&nbsp;&nbsp;&nbsp;${sort2.sortName}</option>
								<#list sort.listSort3 as sort3> <#if sort2.id==
									sort3.parentid>
								<option value="${sort3.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sort3.sortName}</option>
								</#if> </#list> </#list> </#list>
						</select> <span>特别推荐</span> <select name="store_recommend"
							id="store_recommend">
								<option value="">是否特别推荐</option>
								<option value="1">是</option>
								<option value="0">否</option>
						</select> <span class="btn_search"> <input name="" type="button"
								value="搜索" style="cursor: pointer;" onclick="query();"></span>
						</li>
					</ul>
				</div>
		</form>
		<div class="operation">
			<h3>友情提示</h3>
			<ul>
				<li>上架商品，在商城前台所有访客均可查看，管理员和卖家都可以设置商品上架状态</li>
				<li>违规商品，管理员根据商城访客举报结合实际情况设定违规，违规商品前台不可显示，只能管理员能取消违规</li>
			</ul>
		</div>
		<div class="brandtable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="brand_table">
				<tbody>
					<tr style="background: #2A7AD2; height: 30px; color: #FFF">
						<td width="3%">&nbsp;</td>
						<td width="25%">商品名称</td>
						<td width="10%">品牌</td>
						<td width="10%">分类名</td>
						<td width="10%"></td>
						<td width="6%">商品状态</td>
						<td width="6%" align="center">特别推荐</td>
						<td width="6%" align="center"></td>
						<td width="6%" align="center">查看次数</td>
						<td align="center">操作</td>
					</tr>
					<#list listGoods as goods> <#if !goods.deletestatus>
					<tr>
						<td align="center"><input name="checkbox" type="checkbox"
							id="checkbox" value="98805"></td>
						<td><label> <textarea name="textarea" cols="40"
									rows="3" title="可编辑"
									onblur="ajax_update(&#39;98805&#39;,&#39;goods_name&#39;,this)">${goods.goodname}</textarea>
						</label></td>
						<td>${goods.brand.brandName}</td>
						<td>${goods.sort.sortName}</td>
						<td></td>
						<td>${goods.statu?string('上架','下架')}</td>
						<td align="center"><img
							onclick="ajax_update(&#39;98805&#39;,&#39;store_recommend&#39;,this)"
							src="/images/${goods.recommend?string('true','false')}.png"
							width="25" height="21" border="0" style="cursor: pointer;"
							title="特别推荐后在首页显示"></td>
						<td align="center"></td>
						<td align="center">${goods.focus}</td>
						<td class="ac8" align="center"><a href="查看?id=98805"
							target="_blank">查看</a> <a
							href="/admin/goods/toupdategoods?id=${goods.id}">编辑</a> <a
							href="javascript:void(0);"
							onclick="if(confirm('确定删除该商品嘛?'))window.location.href='/admin/goods/toDeleteGoods?id='+${goods.id}">删除</a>
						</td>
					</tr>
					</#if> </#list>


					<tr>
						<td align="center"><input type="checkbox" name="all" id="all"
							value="" onclick="selectAll(this)"> <input name="mulitId"
								type="hidden" id="mulitId"></td>
						<td colspan="2" class="bdel"><span class="sp1">全部</span><span
							class="sp2">
								<div class="shop_btn_del shopbtn">
									<input name="" type="button" value="删除"
										onclick="cmd(&#39;http://192.168.1.233:11585/shopping/admin/goods_del.htm&#39;);"
										style="cursor: pointer;">
								</div>
						</span></td>
						<td colspan="7"></td>
					</tr>
				</tbody>
			</table>
			<div class="fenye" align="right">
				<span id="queryCondition" style="display: none"></span> <a
					class="${(page.pageNum == 1)?string('this','')}"
					href="javascript:void(0);" onclick="return gotoPage(1)">首页</a> 第
				<#list 1..page.pages as i> <a
					class="${(page.pageNum == i)?string('this','')}"
					href="javascript:void(0);" onclick="return gotoPage(${i})">${i}</a>
				</#list>
				页 <a class="${(page.pages == page.pageNum)?string('this','')}"
					href="javascript:void(0);" onclick="return gotoPage(${page.pages})">末页</a>
			</div>
		</div>
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