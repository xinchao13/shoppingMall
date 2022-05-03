<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>批量新增商品</title>
</head>
<body>
<form action="/admin/goods/excelUpload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" value="">
    <button>提交</button>
</form>

<a href="/admin/goods/downloadfile">Excel下载</a>
<hr>
<#--<form action="/theForm" method="post" >-->
    <#--<!-- 	<input type="text" name="goodsname" value=""> &ndash;&gt;-->
    <#--<!-- 	<input type="text" name="price" value=""> &ndash;&gt;-->
    <#--<!-- 	<input type="hidden" name="currpage" value="1"> &ndash;&gt;-->
    <#--<button>提交</button>-->
<#--</form>-->
</body>
</html>