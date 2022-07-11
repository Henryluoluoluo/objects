function updateObjectType() {
	let tid = document.getElementById("updatetid").value;
	let name = document.getElementById("updatename").value;
	if (name == '') {
		alert("输入不能为空！");
	} else if (name.length > 20) {
		alert("类别长度不能超过20");
	} else {
		$.ajax({//把编号带到后台去
			type: 'post',
			url: "http://localhost:8080/objects/updateObjectTypeServlet",
			async: false,
			data: { "tid": tid, "name": name },
			success: function(message) {//成功的事件
				if (message == "true") {
					alert("分类修改成功！");
					window.location.href = "admin_objecttype.jsp";
				}
				else if (message == "false") {
					alert("分类修改失败！分类名已存在！");
					window.location.href = "admin_objecttype.jsp";
				}
			}
		});
	}
}

