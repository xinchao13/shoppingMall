<#list listSort as sort>
<tr id="${sort.id}" parent="${sort.parentid}" level="child_${pid}">
	<td align="center"><input name="ids${sort.id}" id="ids${sort.id}"
		type="checkbox" value="${sort.id}"></td>
	<td colspan="2" align="center">

		<ul class="addclass">
			<li class="accc1"><img src="/images/jian.jpg" cls="jian"
				width="14" height="14" onclick="addorsubtract(this,${sort.id})"
				style="cursor: pointer;"></li>
			<li class="ac2"><span class="num"><input type="text"
					name="${sort.id}n" id="${sort.id}id" value="${sort.sort}"
					onblur="ajax_update('${sort.id}','sequence',this)" title="可编辑"></span></li>
			<li class="accc3"><span class="classies"><input
					type="text" name="${sort.sortName}" id="${sort.sortName}"
					value="${sort.sortName}"
					onblur="ajax_update('${sort.id}','className',this)" title="可编辑"></span>
				<span class="newclass" style="display: none"><a
					href="?pid=${sort.id}">新增下级</a></span></li>
		</ul>
	</td>
	<td align="center">${sort.addtime?string('yyyy-MM-dd HH:mm:ss')}</td>
	<td align="center"><img src="/images/false.png" width="21"
		height="23" onclick="ajax_update('${sort.id}','display',this)"
		style="cursor: pointer;" title="可编辑"></td>
	<td align="left" class="ac8"><a
		href="/admin/sort/toUpdateSort?id=${sort.id}&amp;currentPage=1">编辑</a>|
		<a href="javascript:void(0);"
		onclick="if(confirm('确定删除分类?'))window.location.href='/admin/sort/toDeleteSort3?id=${sort.id}&amp;currentPage=1'">删除</a></td>
</tr>
</#list>