<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0060)http://192.168.1.233:11585/shopping/admin/goods_spec_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>新增规格页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<link href="/css/overlay.css" type="text/css" rel="stylesheet">
			<script src="/js/jquery-1.6.2.js"></script>
			<script src="/js/jquery-ui-1.8.21.js"></script>
			<script src="/js/jquery.shop.common.js"></script>
			<script src="/js/jquery.validate.min.js"></script>
			<script src="/js/jquery.poshytip.min.js"></script>
			<script>
jQuery(document).ready(function(){
  jQuery("#theForm").validate({
    rules:{
	  name:{
	    required :true,
	     remote:{
		    url: "/admin/spec/findspecname",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "name": function(){return jQuery("#name").val();},
				  "id":function(){return jQuery("#id").val()}
		     }
			}
	  }
	 },
	messages:{
	  name:{required:"规格名称不能为空",remote:"该规格已经存在"}
	}
  });
  });
function saveForm(){
	jQuery("#count").val(count);
	jQuery("#theForm").submit();
}
function change_img(obj){
  var sequence=jQuery(obj).attr("id").substring(10);
  var path=jQuery(obj).val();
  var src=getFullPath(jQuery(obj)[0]);
  jQuery("#image_"+sequence).attr("src",src);
  jQuery("#textfield_"+sequence).val(path);
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
	<form action="/admin/spec/insertspec" method="post" name="theForm"
		id="theForm" novalidate="novalidate">
		<input name="id" id="id" type="hidden" value=""> <input
			name="add_url" type="hidden" id="add_url"
			value="http://192.168.1.233:11585/shopping/admin/goods_spec_add.htm">
				<input name="list_url" type="hidden" id="list_url"
				value="http://192.168.1.233:11585/shopping/admin/goods_spec_list.htm">
					<input name="count" type="hidden" id="count">
						<div class="cont">
							<h1 class="seth1">规格管理</h1>
							<div class="settab">
								<span class="tab-one"></span> <span class="tabs"> <a
									href="/admin/spec/toShowSpec">管理</a> | <a
									href="javascript:void(0)" class="this">新增</a>
								</span> <span class="tab-two"></span>
							</div>
							<div class="edit">
								<div class="editul ">
									<ul class="set3">
										<li><strong class="sred">*</strong>规格名称</li>
										<li><span class="pxnum"> <input name="name"
												type="text" id="name" value=""></span><span id="nothis"><strong
												class="q"></strong><strong class="w">请填写常用的商品规格的名称；例如：颜色；尺寸等。</strong><strong
												class="c"></strong></span></li>
									</ul>
									<ul class="set3">
										<li>排序</li>
										<li><span class="pxnum"> <input name="sequence"
												type="text" id="sequence" value=""></span><span id="nothis"><strong
												class="q"></strong><strong class="w">请填写整数。类型列表将会根据排序进行由小到大排列显示。</strong><strong
												class="c"></strong></span></li>
									</ul>
								</div>
								<script>
var count=1;
function img_spec(status){
  if(status=="1"){
    jQuery("span[id^=goods_spec_property_img_]").show();
  }
  if(status=="0"){
    jQuery("span[id^=goods_spec_property_img_]").hide();
  }
}
function remove_goods_spec_property(obj,id){
//    jQuery.post("http://192.168.1.233:11585/shopping/admin/goods_property_delete.htm",{"id":id},function(data){
//      if(data=="true"){
	    jQuery(obj).remove();
//          count--;
// 	 }else alert("规格值删除失败！");
//    },"text");
}
function add_goods_spec_property(){
count++;
  var goods_spec_property_text="<tr id='goods_spec_'><td width='82'><span class='pxnum size5'><input name='specvSeqs' id='sequence_count' value='' type='text'></span></td><td width='271'><span class='pxnum size7'><input name='specvnames' id='value_count' value='' type='text'></span></td><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode,\"\")'>删除</a></td></tr>";
  var type=jQuery(":radio:checked").val();
  if(type=="img"){
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_img.replace(/count/g,count));
  }else{
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_text.replace(/_count/g,""));
  }
}
</script>
								<div class="specification">
									<h2>新增规格值</h2>
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="addsx_table">
										<tbody>
											<tr id="goods_spec_">
												<td width="82"><strong>排序</strong></td>
												<td width="271"><strong>规格值</strong></td>
												<td align="center">操作</td>
											</tr>
											<tr id="goods_spec_property">
												<td width="82"><span class="pxnum size5"> <input
														name="specvSeqs" type="text" id="" value=""></span></td>
												<td width="271"><span class="pxnum size7"> <input
														name="specvnames" type="text" id="" value=""></span></td>
												<td width="116" align="center" class="ac8"><a
													href="javascript:void(0);"
													onclick="remove_goods_spec_property(this.parentNode.parentNode,&#39;&#39;)">删除</a>
												</td>
											</tr>
											<tr>
												<td colspan="3"><span class="newclass"><a
														href="javascript:void(0);"
														onclick="add_goods_spec_property();">新增规格值</a></span></td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>

							</div>
							<div class="submit">
								<input name="" type="button" value="提交" onclick="saveForm();">
									${msg!} 
							</div>
						</div>
	</form>


</body>
</html>