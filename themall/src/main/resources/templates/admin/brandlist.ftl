<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0062)http://192.168.1.233:11585/shopping/admin/goods_brand_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>品牌列表页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
jQuery(document).ready(function(){
  tipStyle();
//设置推荐的默认装态
	function recommendState(){
	var state = jQuery("#recommend").val();
	if(state=="true"){
		jQuery("#recommend").val("false");
		jQuery("#stateOff").show();
		jQuery("#stateOn").hide();
	}else{
		jQuery("#recommend").val("true");
		jQuery("#stateOff").hide();
		jQuery("#stateOn").show();
	}
}
});
//网站logo file样式
jQuery(function(){
    var textButton="<input type='text' name='textfield' id='textfield1' class='size13' /><input type='button' name='button' id='button1' value='' class='filebtn' />"
	jQuery(textButton).insertBefore("#brandLogo");
	jQuery("#brandLogo").change(function(){
	jQuery("#textfield1").val(jQuery("#brandLogo").val());
	})
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
		<h1 class="seth1">品牌管理</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="javascript:void(0)" class="this">管理</a> | <a
				href="/admin/brand/toInsertBrand">新增</a> | <a href="#">申请列表</a>
			</span> <span class="tab-two"></span>
		</div>

		<div class="operation">
			<h3>友情提示</h3>
			<ul>
				<li>通过商品品牌管理，你可以进行查看、编辑、删除系统商品品牌</li>
				<li>设置推荐的品牌会在商城首页根据序号从小到大的顺利轮换显示</li>
				<li>设置品牌首字母，在品牌列表页通过首字母搜索品牌</li>
			</ul>
		</div>
		<div class="brandtable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="brand_table">
				<tbody>
					<tr style="background: #2A7AD2; height: 30px; color: #FFF">
						<td width="45">&nbsp;</td>
						<td width="60">排序</td>
						<td width="80">首字母</td>
						<td width="203">品牌名称</td>
						<td width="194">添加时间</td>
						<td width="183">品牌图片标识</td>
						<td width="121" align="center">推荐</td>
						<td width="217" align="left">操作</td>
					</tr>
					<#list listBrand as brand>
					<tr>
						<td align="center"><input name="checkbox" type="checkbox"
							id="checkbox" value="93"></td>
						<td><span class="pxnum size5">${brand.req}</span></td>
						<td><span class="pxnum size5">${brand.initial}</span></td>
						<td><span class="pxnum size8">${brand.brandName}</span></td>
						<td><span class="pxnum size8">${brand.addtime?string("yyyy-MM-dd
								HH:mm:ss")}</span></td>
						<td><img src="${brand.imgpath}" width="88px" height="44px"></td>
						<td align="center"><img
							src="/images/${brand.recommend?string('true','false')}.png"
							width="25" height="21" border="0" style="cursor: pointer;"
							title="可编辑"></td>
						<td class="ac8" align="left"><a
							href="/admin/brand/toupdatebrand?id=${brand.id}">编辑</a>| <a
							href="javascript:void(0);"
							onclick="if(confirm('确定删除品牌嘛?'))window.location.href='/admin/brand/todeletebrand?id='+${brand.id}"
							&amp;currentPage=1">删除</a></td>
					</tr>
					</#list>
				</tbody>
			</table>
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