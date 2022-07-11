function addObjectType() {
	let name = document.getElementById("addObjectName").value;
	if (name == '') {
		alert("输入不能为空！");
	} else if (name.length > 20) {
		alert("类别长度不能超过20");
	} else {
		$.ajax({//把编号带到后台去
			type: 'post',
			url: "http://localhost:8080/objects/addObjectTypeServlet",
			async: false,
			data: { "name": name },
			success: function(message) {//成功的事件
				if (message == "true") {
					alert("分类添加成功！");
					window.location.href = "admin_objecttype.jsp";
				}
				else if (message == "false") {
					alert("分类添加失败！分类已存在！");
					window.location.href = "admin_objecttype.jsp";
				}
			}
		});
	}
}

