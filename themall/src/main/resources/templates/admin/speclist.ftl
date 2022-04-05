<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://192.168.1.233:11585/shopping/admin/goods_spec_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>规格列表页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
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
		<h1 class="seth1">规格管理</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="javascript:void(0)" class="this">管理</a> | <a
				href="/admin/spec/toInsertSpec">新增</a></span> <span class="tab-two"></span>
		</div>
		<form name="ListForm" id="ListForm" action="#" method="post">
			<div id="list">
				<div class="typemanager">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="specific_table">
						<tbody>
							<tr style="background: #2A7AD2; height: 30px; color: #FFF">
								<td width="5%">&nbsp;</td>
								<td width="10%">排序</td>
								<td width="20%">规格名称</td>
								<td width="40%">规格值</td>
								<td align="center">操作</td>
							</tr>
							<#list listSpec as spec>
							<tr>
								<td align="center"></td>
								<td><span class="pxnum size5"> ${spec.seq} </span></td>
								<td><span class="pxnum size7"><span
										class="pxnum size5"> ${spec.specname} </span></span></td>
								<td><#list spec.listSpecv as specv>
									${specv.specvname} <#if specv_has_next> , </#if> </#list></td>
								<td align="center" class="ac8"><a
									href="/admin/spec/toUpdateSpec?id=${spec.id}">编辑</a>| <a
									href="javascript:voud(0);"
									onclick="if(confirm(&#39;删除后不可恢复，是否继续?&#39;))window.location.href=&#39;/admin/spec/toDeleteSpec?id=${spec.id}&amp;currentPage=1&#39;">删除</a></td>
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
</body>
</html>