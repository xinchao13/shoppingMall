<form action="/address/toupdateAddress" method="post" id="theForm"
	novalidate="novalidate">
	<table style="float: left;" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="box_table">
		<tbody>
			<tr>
				<td width="100" align="right" valign="top"><span
					class="hui_table">收货人姓名</span>: <input name="id" type="hidden"
					id="id" value="${address.id}"></td>
				<td align="left"><span class="dia_txt"> <input
						name="trueName" type="text" id="trueName"
						value="${address.consigneename}" size="35" required="required">
				</span></td>
			</tr>
			<tr>
				<td align="right" valign="top"><span class="hui_table">所在区域:</span></td>
				<td align="left"><span id="area_area_info"> </span> <select
					name="area1" id="area1" level="2" style="width: 100px;"
					class="valid">
						<option value="" selected="selected">请选择地区</option>
						<option value="4522510">辽宁省</option>
						<option value="4522512">3213</option>
				</select> <input type="button" name="area_edit" id="area_edit" value="�޸�"
					style="display: none;"
					onclick="javascript:jQuery('#area1').show();jQuery('#area_area_info').empty();jQuery('#area_id').val('');jQuery(this).hide();">
					<select name="area2" id="area2" style="width: 60px;" level="3"><option
							value="">请选择</option>
						<option value="123">大连市</option></select> <select name="area3" id="area3"
					style="display: none; width: 60px;" level="4">
				</select> <input name="area_id" type="hidden" id="area_id" value="">

				</td>
			</tr>
			<tr>
				<td align="right" valign="top"><span class="hui_table">详细地址</span>:</td>
				<td align="left"><span class="dia_txt"> <input
						name="area_info" type="text" id="area_info"
						value="${address.detailaddress}" size="35" required="required">
				</span></td>
			</tr>
			<tr>
				<td align="right" valign="top"><span class="hui_table">邮政编码</span>:</td>
				<td align="left"><span class="dia_txt"> <input
						name="zip" type="text" id="zip" value="${address.postcodecode}"
						size="35" required="required">
				</span></td>
			</tr>
			<tr>
				<td align="right" valign="top"><span class="hui_table">手机号码</span>:</td>
				<td align="left"><span class="dia_txt"> <input
						name="telephone" type="text" id="telephone"
						value="${address.phone}" size="35" required="required">
				</span></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><span class="inputbtn"> <input
						name="" type="submit" value="提交" style="cursor: pointer;">
						<input name="currentPage" type="hidden" id="currentPage" value="1">
				</span></td>
			</tr>
		</tbody>
	</table>
</form>