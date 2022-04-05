<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0062)http://192.168.1.233:11585/shopping/admin/goods_class_list.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>商品分类页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.shop.common.js"></script>
		<script src="/js/jquery.poshytip.min.js"></script>
		<script>
function addorsubtract(obj,id){
 var cls=jQuery(obj).attr("cls");
 var level=jQuery(obj).attr("level");
  if(cls=="jian"){
  jQuery.ajax({type:'POST',
		       url:'/admin/sort/showLevel',
		        data:{"pid":id},
				success:function(data){
	                jQuery("#"+id).after(data);
					jQuery(obj).attr("src","/images/add.jpg");
					jQuery(obj).attr("cls","add");
					tipStyle();
              }
  });
  }else{
       if(level=="0_"+id){
	    jQuery("tr[level=child_"+id+"]").remove();
	   }else
	   jQuery("tr[parent="+id+"]").remove();
	   jQuery(obj).attr("src","/images/jian.jpg");
	   jQuery(obj).attr("cls","jian");
  }
  //
}
function ajax_update(id,fieldName,obj){
   var val=jQuery(obj).val();
    jQuery.ajax({type:'POST',
	              url:'/admin/sort/ajaxupdate',
				  data:{"id":id,"fieldName":fieldName,"value":val},
				beforeSend:function(){
				  
				},
			   success:function(data){
	            if(data.STATUS == "FAIL"){
	     			alert(data.Message);
	     			$(obj).val(data.sort.sortName);
	     		}
	     		if(fieldName == "display"){
	     			$(obj).attr("src","/images/"+data.sort.display+".png")

	     		}
              }
	    });
}
jQuery(document).ready(function(){
 
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
		<h1 class="seth1">商品分类</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="javascript:void" class="this">管理</a> | <a
				href="/admin/sort/toInsertSort">新增</a></span> <span class="tab-two"></span>
		</div>
		<div class="operation">
			<h3>友情提示</h3>
			<ul>
				<li>通过商品分类管理，你可以进行查看、编辑、删除系统商品分类</li>
				<li>你可以根据需要控制商品分类是否显示</li>
			</ul>
		</div>
		<div class="classtable">
			<form name="ListForm" id="ListForm" action="javascript:void(0)"
				method="post">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="class_table">
					<tbody>
						<tr style="background: #2A7AD2; height: 30px; color: #FFF">
							<td width="38">&nbsp;</td>
							<td width="70">排序</td>
							<td width="450" align="left">分类名称</td>
							<td width="99" align="center">添加时间</td>
							<td width="52" align="center">显示</td>
							<td width="126" align="left">操作</td>
						</tr>
						<#list listSort as sort>
						<tr id="${sort.id}">
							<td align="center"><input name="ids" id="ids"
								type="checkbox" value="${sort.id}"></td>
							<td colspan="2" align="center">
								<ul class="addclass">
									<li class="ac1"><input name="addorsubtract_${sort.id}"
										id="addorsubtract_${sort.id}" type="hidden" value="true">
											<img src="/images/jian.jpg" cls="jian" level="0_${sort.id}"
											width="14" height="14" id="jian_${sort.id}"
											onclick="addorsubtract(this,${sort.id});"
											style="cursor: pointer;"></li>
									<li class="ac2"><span class="num"> <input
											type="text" name="paixu" id="${sort.id}" value="${sort.sort}"
											onblur="ajax_update(${sort.id},'sequence',this)" title="可编辑"></span>
									</li>
									<li class="ac3"><span class="classies"> <input
											type="text" name="${sort.id}" id="${sort.id}"
											value="${sort.sortName}"
											onblur="ajax_update(&#39;${sort.id}&#39;,&#39;className&#39;,this)"
											title="可编辑"></span> <span class="newclass"><a
											href="http://192.168.1.233:11585/shopping/admin/goods_class_add.htm?pid=${sort.id}">新增下级</a></span></li>
								</ul>
							</td>
							<td align="center">${sort.addtime?string('yyyy-MM-dd
								HH:mm:ss')}</td>
							<td align="center"><img
								src="/images/${sort.display?string('true','false')}.png"
								width="21" height="23"
								onclick="ajax_update(&#39;${sort.id}&#39;,&#39;display&#39;,this)"
								style="cursor: pointer;" title="可编辑"></td>
							<td align="left" class="ac8"><a
								href="/admin/sort/toUpdateSort?id=${sort.id}&amp;currentPage=1">编辑</a>|
								<a href="javascript:void(0);"
								onclick="if(confirm('确定删除该分类嘛?'))window.location.href='/admin/sort/toDeleteSort?id='+${sort.id}">删除</a>
							</td>
						</tr>
						</#list>
					</tbody>
				</table>
				<input type="hidden" name="currentPage" id="currentPage" value="1">
					<input name="mulitId" type="hidden" id="mulitId">
						<div class="fenye">
							<a
								href="http://192.168.1.233:11585/shopping/admin/goods_class_list.htm?currentPage=1">首页</a>
							第 <a class="this"
								href="http://192.168.1.233:11585/shopping/admin/goods_class_list.htm?currentPage=1">1</a>
							页 <a
								href="http://192.168.1.233:11585/shopping/admin/goods_class_list.htm?currentPage=1">末页</a>
						</div>
			</form>
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
</body>
</html>