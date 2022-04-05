<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://192.168.1.233:11585/shopping/admin/goods_brand_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>修改商品页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script>
var delids = "";
function delids2(obj,id){
	delids += id + ",";
 	$("#delids").val(delids);
	jQuery(obj).remove();
}
jQuery(document).ready(function(){
 	//改变系统提示的样式
  jQuery("span .w").mousemove(function(){
	var id=jQuery(this.parentNode).attr("id");
	if(id="nothis"){
	   jQuery(this.parentNode).attr("id","this")
	}
  }).mouseout(function(){
     var id=jQuery(this.parentNode).attr("id");
	 if(id="this"){
	   jQuery(this.parentNode).attr("id","nothis")
	 }
  });
//设置推荐的默认装态
var rec = jQuery("#recommend").val();
	if(rec=="true"){
		jQuery("#stateOn").show();
		jQuery("#stateOff").hide();
	}else{
		jQuery("#stateOn").hide();
		jQuery("#stateOff").show();
	}
//设置上下架的默认装态
var rec = jQuery("#statu").val();
	if(rec=="true"){
		jQuery("#stateOn2").show();
		jQuery("#stateOff2").hide();
	}else{
		jQuery("#stateOn2").hide();
		jQuery("#stateOff2").show();
	}
//标志图片鼠标经过显示
jQuery("#brandImgShow").mouseover(function(){
	jQuery("#brandImg").show();
})
jQuery("#brandImgShow").mouseout(function(){
	jQuery("#brandImg").hide();
})
jQuery("#brandLogo").change(function(){
	jQuery("#textfield1").val(jQuery("#brandLogo").val());
})


//表单格式校验
jQuery("#theForm").validate({
    rules:{
	  goodname:{
	    required :true
// 	    remote:{
// 		    url: "/admin/brand/findbrandname",     //后台处理程序
//             type: "post",               //数据发送方式
//             dataType: "json",           //接受数据格式   
//             data: {                     //要传递的数据
//                   "name": function(){return jQuery("#name").val();}
// 		    }
// 		}
	  },
	  productid:{
		required :true
	  },
	  goodImg0:{
		   	required :false,
		    accept:"gif|jpg|png"
		  }
	  },
	messages:{
	  goodname:{required:"商品名称不能为空",remote:"该商品已经存在"},
	  productid:{required:"产品号不能为空",remote:"该产品号已经存在"},
	  goodImg0:{required :"商品图片不能为空",accept:"系统不允许的文件类型"}	
	}
  });
//编辑
jQuery("#cid").val('');
//结束
});
//修改推荐状态
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
//修改上下架状态
function recommendState2(){
	var state = jQuery("#statu").val();
	if(state=="true"){
		jQuery("#statu").val("false");
		jQuery("#stateOff2").show();
		jQuery("#stateOn2").hide();
	}else{
		jQuery("#statu").val("true");
		jQuery("#stateOff2").hide();
		jQuery("#stateOn2").show();
	}
}
//商品保存
function saveBrand(method){
	jQuery("#cmd").val(method);
	jQuery("#theForm").submit();
}
//规格规格值联动
$(function(){
	$("#spec1").change(function(){ 
		var specid = $("#spec1 option:selected").val();
		$.ajax({
			url:"/admin/goods/findspecv",
			type:"post",
			data:{
				specid:specid,
			},
			success:function(data){
				//回调函数
				var listSpecv = data.listSpecv;
				console.log(listSpecv);
				console.log(listSpecv.length);
				console.log(listSpecv[0].id);
				console.log(listSpecv[0].specvname);
				var res = "<option>--请选择规格相对应的规格值--</option>"; 
				for(var i = 0;i<listSpecv.length;i++){ 
					res += "<option value='"+listSpecv[i].id+"'>"+listSpecv[i].specvname+"</option>"; 
				}
				$("#specv1").text("");
				$("#specv1").append(res);
			},
			dataType:"json",
			async:true
		});
		       
	});
})
//第二个规格与规格值联动
$(function(){
	$("#spec2").change(function(){ 
		var specid = $("#spec2 option:selected").val();
		$.ajax({
			url:"/admin/goods/findspecv",
			type:"post",
			data:{
				specid:specid,
			},
			success:function(data){
				//回调函数
				var listSpecv = data.listSpecv;
				console.log(listSpecv);
				console.log(listSpecv.length);
				console.log(listSpecv[0].id);
				console.log(listSpecv[0].specvname);
				var res = "<option>--请选择规格相对应的规格值--</option>"; 
				for(var i = 0;i<listSpecv.length;i++){ 
					res += "<option value='"+listSpecv[i].id+"'>"+listSpecv[i].specvname+"</option>"; 
				}
				$("#specv2").text("");
				$("#specv2").append(res);
			},
			dataType:"json",
			async:true
		});
		       
	});
})

</script>
</head>
<body>
	<form action="/admin/goods/updateGoods" method="post"
		enctype="multipart/form-data" name="theForm" id="theForm"
		novalidate="novalidate">
		<div class="cont">
			<h1 class="seth1">商品管理</h1>
			<div class="settab">
				<span class="tab-one"></span> <span class="tabs"> <a
					href="/admin/goods/toshowgoodslist">所有商品</a> | <a
					href="/admin/goods/toInsertGoods">新增商品</a> | <a class="this"
					href="javascript:void(0)">编辑商品</a>
				</span> <span class="tab-two"></span>
			</div>
			<div class="setcont" id="base">
				<!--鼠标经过样式-->
				<ul class="set1">
					<li><strong class="orange fontsize20">*</strong>商品名称</li>
					<li><span class="webname"> <input name="goodname"
							type="text" id="name" value="${goods.goodname}"> <input
								name="goodsid" type="hidden" id="name" value="${goods.id}">
									<input name="delids" type="hidden" id="delids" value=""></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>产品号(货号)</li>
					<li><span class="webname"> <input name="productid"
							type="text" id="name" value="${goods.productid?c}"></span></li>
				</ul>

				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品原价</li>
					<li><span class="webname"> <input name="oldprice"
							type="text" id="first_word" value="${goods.oldprice}"></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品现价</li>
					<li><span class="webname"> <input name="newprice"
							type="text" id="first_word" value="${goods.newprice}"></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品重量</li>
					<li><span class="webname"> <input name="weight"
							type="text" id="first_word" value="${goods.weight}"></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品体积</li>
					<li><span class="webname"> <input name="volume"
							type="text" id="first_word" value="${goods.volume}"></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>所属品牌</li>
					<li><span class="webnamesec sizese"> <select
							name="brandid" id="brandid">
								<option value="">所有品牌</option>
								<#list listBrand as brand>
								<option value="${brand.id}">${brand.brandName}</option>
								</#list>
						</select>
					</span></li>
				</ul>

				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品分类</li>
					<li><span class="webnamesec sizese"> <select
							name="sortid" id="sortid">
								<option value="">所有分类</option>
								<#list listSort as sort>
								<option value="${sort.id}">${sort.sortName}</option>
								<#list sort.listSort2 as sort2>
								<option value="${sort2.id}">&nbsp;&nbsp;&nbsp;${sort2.sortName}</option>
								<#list sort.listSort3 as sort3> <#if sort2.id==
									sort3.parentid>
								<option value="${sort3.id}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sort3.sortName}</option>
								</#if> </#list> </#list> </#list>
						</select>
					</span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>规格
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong class="orange fontsize20"></strong>规格值</li>
					<li><span class="webnamesec sizese"> <select
							name="spec" id="spec1">
								<option value="">所有规格</option>
								<#iflistSpec??>
          <#list listSpec as spec>
                <option value="${spec.id}" ${(specid1?? && spec.id == specid1)?string('selected="select"','')}>${spec.specname}</option>
          </#list>
          </#if>
          </select>
					</span> <span class="webnamesec sizese">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
							name="specv" id="specv1">
								<option>--请选择规格相对应的规格值--</option>
								<#iflistSpecv1??>
          	<#list listSpecv1 as specv>
                <option value="${specv.id}" ${(specid1?? && specv.id == specvid1)?string('selected="select"','')}>${specv.specvname}</option>
          	</#list>
          	</#if>
          </select>
					</span></li>
					<li><strong class="orange fontsize20"></strong>规格
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong class="orange fontsize20"></strong>规格值</li>
					<li><span class="webnamesec sizese"> <select
							name="spec" id="spec2">
								<option value="">所有规格</option>
								<#iflistSpec??>
          <#list listSpec as spec>
                <option value="${spec.id}" ${(specid2?? && spec.id == specid2)?string('selected="select"','')}>${spec.specname}</option>
          </#list>
          </#if>
          </select>
					</span> <span class="webnamesec sizese">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
							name="specv" id="specv2">
								<option>--请选择规格相对应的规格值--</option>
								<#iflistSpecv2??>
          	<#list listSpecv2 as specv>
                <option value="${specv.id}" ${(specid2?? && specv.id == specvid2)?string('selected="select"','')}>${specv.specvname}</option>
          	</#list>
          	</#if>
          </select>
					</span></li>
				</ul>

				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>库存</li>
					<li><span class="webname"> <input name="stock"
							type="text" id="first_word" value="${goods.stock}"></span></li>
				</ul>
				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>商品详情</li>
					<li><span class="description"> <textarea
								name="description" rows="10" cols="30">${goods.description}</textarea>
					</span></li>
				</ul>

				<ul class="set1">
					<li>是否推荐</li>
					<li><span class="webSwitch"> <input name="recommend"
							id="recommend" type="hidden"
							value="${goods.recommend?string('true','false')}"> <img
								src="/images/on.jpg" width="61" height="23" id="stateOn"
								onclick="recommendState();"
								style="cursor: pointer; display: none;"> <img
									src="/images/off.jpg" width="61" height="23" id="stateOff"
									onclick="recommendState();" style="cursor: pointer"></span><span
						id="nothis"><strong class="q"></strong><strong class="w">推荐商品将在首页轮换显示</strong><strong
							class="c"></strong></span></li>
				</ul>
				<ul class="set1">
					<li>上下架状态</li>
					<li><span class="webSwitch"> <input name="statu"
							id="statu" type="hidden"
							value="${goods.statu?string('true','false')}"> <img
								src="/images/on.jpg" width="61" height="23" id="stateOn2"
								onclick="recommendState2();"
								style="cursor: pointer; display: none;"> <img
									src="/images/off.jpg" width="61" height="23" id="stateOff2"
									onclick="recommendState2();" style="cursor: pointer"></span></li>
				</ul>

				<ul class="set1">
					<li>商品图片</li>
					<li><span class="size13"><input name="textfield0"
							type="text" id="textfield1"></span> <span class="filebtn"><input
							name="button0" type="button" id="button1" value=""></span> <span
						style="float: left;" class="file"> <input name="goodImg0"
							type="file" id="brandLogo" size="30" onchange="show(this,0)">
								<img id="img0" src="${goods.imgpath}" width="80" height="90" /></span>
						<span class="preview"></span> <span id="nothis"><strong
							class="q"></strong><strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong><strong
							class="c"></strong></span>
						<div class="bigimgpre" id="brandImg" style="display: none;">
							<img src="/images/saved_resource">
						</div></li>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="addsx_table">
						<tbody>
							<tr id="goods_spec_">
								<td colspan="3"><span class="newclass"><a
										href="javascript:void(0);" onclick="addImg();">添加更多图片</a></span></td>
								<td>&nbsp;</td>
							</tr>
							<#iflistImg??>
      <#list listImg as img>
      <tr id="goods_spec_">
      	<td width="782">
      		<ul class="set1"><li>
      		<span class="size13">
      		<input name="${img.id}" type="text" id="${img.id}"></span>
      			<span class="filebtn"><input name="button" type="button" id="button" value=""></span>
      			<span style="float:left;" class="file"><input name="${img.id}" type="file" id="${img.id}" size="30" onchange="show(this,${img.id})">
      			<img id="img${img.id}" src="${img.imgpath}" width="60" height="60"/>
      			<input type="hidden" name="imgids" value="${img.id}"/></span>
      			<span class="preview"></span>
      			<span id="nothis"><strong class="q"></strong></span>
      			</li>
      	</td>
      	<td width="271"><span class="pxnum size7">
      	<td class="ac8" align="center" width="116">
      		<a href="javascript:void(0);" onclick="delids2(this.parentNode.parentNode,${img.id})">删除</a>
      	</td>
      </tr>
      </#list>
      </#if>
      </tbody>
					</table>
				</ul>

			</div>
		</div>
		<div class="submit">
			<input name="" type="button" value="提交"
				onclick="saveBrand(&#39;save&#39;);"> ${msg2!} 
		</div>
	</form>
	<script>
//添加附加图片
function addImg(){
count++;
  var goods_spec_property_text="<tr id='goods_spec_'><td width='782'><ul class='set1'><li><span class='size13'><input name='textfield"+count+"' type='text' id='textfield"+(count+1)+"'></span><span class='filebtn'><input name='button"+count+"' type='button' id='button"+(count+1)+"' value=''></span><span style='float:left;' class='file'><input name='goodImg"+count+"' type='file' id='brandLogo' size='30' onchange='show(this,"+count+")'><img id='img"+count+"' src='' /></span><span class='preview'></span><span id='nothis'><strong class='q'></strong><strong class='w'>最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong><strong class='c'></strong></span><div class='bigimgpre' id='brandImg' style='display:none;''><img src='/images/saved_resource'></div></li></td><td width='271'><span class='pxnum size7'><td class='ac8' align='center' width='116'><a href='javascript:void(0);' onclick='remove_goods_spec_property(this.parentNode.parentNode,\"\")'>删除</a></td></tr>";
  var type=jQuery(":radio:checked").val();
  if(type=="img"){
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_img.replace(/count/g,count));
  }else{
    jQuery(".addsx_table tr[id^=goods_spec_]").last().after(goods_spec_property_text.replace(/_count/g,""));
  }
}

var count=0;
function img_spec(status){
  if(status=="1"){
    jQuery("span[id^=goods_spec_property_img_]").show();
  }
  if(status=="0"){
    jQuery("span[id^=goods_spec_property_img_]").hide();
  }
}
//删除整行函数

//图片立显
function show(file,i){    
    var reader = new FileReader();    // 实例化一个FileReader对象，用于读取文件
    var img = document.getElementById('img'+i);     // 获取要显示图片的标签
    
    //读取File对象的数据
    reader.onload = function(evt){
        img.width  =  "80";
        img.height =  "80";
        img.src = evt.target.result;
        console.log(evt.target.result)
    }
    reader.readAsDataURL(file.files[0]);
    var name = file.files[0].name;
    console.log(name);

}
jQuery("#brandid").val("${goods.brandid}");
jQuery("#sortid").val("${goods.sortid}");
</script>


</body>
</html>