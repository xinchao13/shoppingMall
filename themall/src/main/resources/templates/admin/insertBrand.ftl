<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://192.168.1.233:11585/shopping/admin/goods_brand_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>新增品牌页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script>
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
	  name:{
	    required :true,
	     remote:{
		    url: "/admin/brand/findbrandname",     //后台处理程序
            type: "post",               //数据发送方式
            dataType: "json",           //接受数据格式   
            data: {                     //要传递的数据
                  "name": function(){return jQuery("#name").val();}
		     }
			}
	  }  ,
	  brandLogo:{
	   required :true,
	    accept:"gif|jpg|png"
	  }	 },
	messages:{
	  name:{required:"品牌名称不能为空",remote:"该品牌已经存在"}  ,
	  brandLogo:{required :"品牌图片不能为空",accept:"系统不允许的文件类型"}	}
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
//品牌保存
function saveBrand(method){
	jQuery("#cmd").val(method);
	jQuery("#theForm").submit();
}
//图片立显
function show(file){    
    var reader = new FileReader();    // 实例化一个FileReader对象，用于读取文件
    var img = document.getElementById('img');     // 获取要显示图片的标签
    
    //读取File对象的数据
    reader.onload = function(evt){
        img.width  =  "80";
        img.height =  "80";
        img.src = evt.target.result;
        console.log(evt.target.result)
    }
    reader.readAsDataURL(file.files[0]);
} 
</script>
</head>
<body>
	<form action="/admin/brand/toInsertBrand" method="post"
		enctype="multipart/form-data" name="theForm" id="theForm"
		novalidate="novalidate">
		<div class="cont">
			<h1 class="seth1">品牌管理</h1>
			<div class="settab">
				<span class="tab-one"></span> <span class="tabs"> <a
					href="/admin/brand/tobrandlist">管理</a> | <a class="this"
					href="javascript:void(0)">新增</a> | <a href="#">申请列表</a>
				</span> <span class="tab-two"></span>
			</div>
			<div class="setcont" id="base">
				<!--鼠标经过样式-->
				<ul class="set1">
					<li><strong class="orange fontsize20">*</strong>品牌名称</li>
					<li><span class="webname"> <input name="name"
							type="text" id="name" value=""></span></li>
				</ul>

				<ul class="set1">
					<li><strong class="orange fontsize20"></strong>首字母</li>
					<li><span class="webname"> <input name="firstword"
							type="text" id="first_word" value=""></span><span id="nothis"><strong
							class="q"></strong><strong class="w">输入品牌首字母，在品牌列表页通过首字母查询</strong><strong
							class="c"></strong></span></li>
				</ul>

				<ul class="set1">
					<li>品牌图片</li>
					<li><span class="size13"><input name="textfield"
							type="text" id="textfield1"></span> <span class="filebtn"><input
							name="button" type="button" id="button1" value=""></span> <span
						style="float: left;" class="file"> <input name="brandLogo"
							type="file" id="brandLogo" size="30" onchange="show(this)">
								<img id="img" src="" /></span> <span class="preview"></span> <span
						id="nothis"><strong class="q"></strong><strong class="w">最佳尺寸93*33，支持格式gif,jpg,jpeg,png</strong><strong
							class="c"></strong></span>
						<div class="bigimgpre" id="brandImg" style="display: none;">
							<img src="/images/saved_resource">
						</div></li>
				</ul>

				<ul class="set1">
					<li>是否推荐</li>
					<li><span class="webSwitch"> <input name="recommend"
							id="recommend" type="hidden" value="true"> <img
								src="/images/on.jpg" width="61" height="23" id="stateOn"
								onclick="recommendState();"
								style="cursor: pointer; display: none;"> <img
									src="/images/off.jpg" width="61" height="23" id="stateOff"
									onclick="recommendState();" style="cursor: pointer"></span><span
						id="nothis"><strong class="q"></strong><strong class="w">推荐品牌将在首页轮换显示</strong><strong
							class="c"></strong></span></li>
				</ul>
				<ul class="set1">
					<li>排序</li>
					<li><span class="webname"> <input name="sequence"
							type="text" id="sequence" value=""></span><span id="nothis"><strong
							class="q"></strong><strong class="w">序号越小显示越靠前</strong><strong
							class="c"></strong></span></li>

				</ul>
			</div>
		</div>
		<div class="submit">
			<input name="" type="button" value="提交"
				onclick="saveBrand(&#39;save&#39;);"> ${msg!} 
		</div>
	</form>



</body>
</html>