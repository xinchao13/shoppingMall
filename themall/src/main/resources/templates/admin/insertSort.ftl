<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0061)http://192.168.1.233:11585/shopping/admin/goods_class_add.htm -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>新增分类页</title>
	<link href="/css/template.css" rel="stylesheet" type="text/css">
		<script src="/js/jquery-1.6.2.js"></script>
		<script src="/js/jquery.validate.min.js"></script>
		<script>
jQuery(document).ready(function(){
//设置默认状态以及判断初始显示状态
	var state = jQuery("#display").val();
	if(state==""){
		jQuery("#display").val("true");
		jQuery("#displayOff").hide();
	}else{
		 if(state=="true"){
			jQuery("#displayOff").hide();
		}else{
			jQuery("#displayOn").hide();
		}
	}
//
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
jQuery("#pid").val("");
jQuery("#goodsTypeId").val("");
//
jQuery("#theForm").validate({
    rules:{
	  sortName:{
	    required :true,
	  }
	 },
	messages:{
	  sortName:{required:"分类名称不能为空"}
	}
  });
  //图标
  jQuery("#pid").change(function(){
	 var val = jQuery(this).val();
	  if(val==""){
		 jQuery("#icon").show(); 
		 jQuery("#icon_sys_ul").show();
		  }else{
		 jQuery("#icon").hide();	
		 jQuery("#icon_sys_ul").hide();  
		 jQuery("#icon_acc_ul").hide(); 
			  }
	  });
  jQuery("input[type='radio']").click(function(){
	 var val = jQuery(this).attr("value");
	  if(val==1){
	  jQuery("#icon_sys_ul").hide();
	  jQuery("#icon_acc_ul").show();	  
	  }else{
	  jQuery("#icon_sys_ul").show();
	  jQuery("#icon_acc_ul").hide();		  
	  }
  });
  jQuery(".icon_sys a").click(function(){
	  jQuery("#icon_sys").val(jQuery(this).attr("icon"));
	  jQuery(this).parent().find("a").removeClass("this");
	  jQuery(this).addClass("this");
	  });
   jQuery("#icon_acc").change(function(){
	 jQuery("#textfield1").val(jQuery("#icon_acc").val());
   })
     jQuery("#logoShow").mouseover(function(){
	    jQuery("#logoImg").css('display','block');
   }).mouseout(function(){
		jQuery("#logoImg").css('display','none');
	});
});


function saveForm(method){
	var id = $("#id").val();
    var pid = $("#pid").val(); 
    
       if(id==pid && (id!="")){
         
          $("#tishi").css("display","");
                  
     
          return false;
       }
   jQuery("#theForm").submit();
}

//设置显示开关
function displayState(){
	var state = jQuery("#display").val();
	if(state=="true"){
		jQuery("#display").val("false");
		jQuery("#displayOff").show();
		jQuery("#displayOn").hide();
	}else{
		jQuery("#display").val("true");
		jQuery("#displayOff").hide();
		jQuery("#displayOn").show();
	}
}
</script>
</head>
<body>
	<div class="cont">
		<h1 class="seth1">商品分类</h1>
		<div class="settab">
			<span class="tab-one"></span> <span class="tabs"> <a
				href="/admin/sort/toclasslist?parentid=0">管理</a> | <a
				href="javascript:void(0)" class="this">新增</a>
			</span> <span class="tab-two"></span>
		</div>
		<form name="theForm" id="theForm" action="/admin/sort/insertSort"
			method="post" enctype="multipart/form-data" novalidate="novalidate">
			<input name="id" type="hidden" id="id" value=""> <input
				name="currentPage" type="hidden" id="currentPage" value="">
					<input name="list_url" type="hidden" id="list_url"
					value="http://192.168.1.233:11585/shopping/admin/goods_class_list.htm">
						<input name="add_url" type="hidden" id="add_url"
						value="http://192.168.1.233:11585/shopping/admin/goods_class_add.htm">
							<div class="setcont">
								<ul class="set1">
									<li><strong class="orange fontsize20">*</strong>分类名称</li>
									<li><span class="webname"> <input name="sortName"
											type="text" id="sortName" value="" size="40"></span></li>
								</ul>
								<!--鼠标未经过样式-->
								<ul class="set1">
									<li>上级分类<label class="error" style="display: none"
										id="tishi">不能选择当前分类作为上级</label></li>
									<li><span class="webnamesec sizese"> <select
											name="pid" id="pid">
												<option value="0">请选择上级商品分类...</option>
												<#list listSort as sort>
												<option value="${sort.id}">${sort.sortName}</option>
												<#list sort.listSort2 as sort2>
												<option value="${sort2.id}">&nbsp;&nbsp;&nbsp;${sort2.sortName}</option>
												</#list> </#list>
										</select>
									</span><span id="nothis"><strong class="q"></strong><strong
											class="w">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</strong><strong
											class="c"></strong></span></li>
								</ul>
								<ul class="set1">
									<li>显示</li>
									<input name="display" id="display" type="hidden" value="true">
										<img src="/images/on.jpg" width="61" height="23"
										id="displayOn" onclick="displayState();"
										style="cursor: pointer"> <img src="/images/off.jpg"
											width="61" height="23" id="displayOff"
											onclick="displayState();"
											style="cursor: pointer; display: none;">
								</ul>
								<ul class="set1">
									<li>排序</li>
									<li><span class="webname"> <input name="sort"
											type="text" id="sort" value=""></span><span id="nothis"><strong
											class="q"></strong><strong class="w">序号越小，分类显示越靠前</strong><strong
											class="c"></strong></span></li>
								</ul>
		</form>
		<div class="submit">
			<input name="save" type="button" value="提交" onclick="saveForm()">
				${msg!} 
		</div>
	</div>

</body>
</html>