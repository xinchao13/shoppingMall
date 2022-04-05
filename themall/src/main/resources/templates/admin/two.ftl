<#list listSort as sort>
<tr id="${sort.id}" parent="${sort.parentid}"
	level="child_${sort.parentid}">
	<td align="center"><input name="ids${sort.id}" id="ids"
		type="checkbox" value="${sort.id}"></td>
	<td colspan="2" align="center">

		<ul class="addclass">
			<li class="acc1"><img src="/images/jian.jpg" cls="jian"
				width="14" height="14" onclick="addorsubtract(this,${sort.id})"
				style="cursor: pointer;"></li>
			<li class="ac2"><span class="num"><input type="text"
					name="${sort.id}" id="${sort.id}" value="${sort.sort}"
					onblur="ajax_update('${sort.id}','sequence',this)" title="可编辑"></span></li>
			<li class="acc3"><span class="classies"><input
					type="text" name="${sort.sortName}" id="id${sort.id}"
					value="${sort.sortName}"
					onblur="ajax_update('${sort.id}','className',this)" title="可编辑"></span>
				<span class="newclass" style=""><a href="?pid=${sort.id}">新增下级</a></span></li>
		</ul>
	</td>
	<td align="center">${sort.addtime?string('yyyy-MM-dd HH:mm:ss')}</td>
	<td align="center"><img src="/images/true.png" width="21"
		height="23" onclick="ajax_update('${sort.id}','display',this)"
		style="cursor: pointer;" title="可编辑"></td>
	<td align="left" class="ac8"><a
		href="/admin/sort/toUpdateSort?id=${sort.id}&amp;currentPage=1">编辑</a>|
		<a href="javascript:void(0);"
		onclick="if(confirm('确定删除该分类嘛?'))window.location.href='/admin/sort/toDeleteSort2?id='+${sort.id}">删除</a></td>
</tr>
</#list>