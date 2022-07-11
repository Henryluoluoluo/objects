function updateObject() {
	let oid = document.getElementById("updateObjectId").value;
	let card = document.getElementById("updateCard").value;
	let name = document.getElementById("updateObjectName").value;
	let type = document.getElementById("updateObjectType").value;
	let num = document.getElementById("updateNum").value;
	let myreg = /^[0-9]{1,20}$/;
	console.log(oid, card, name, type, num);
	if(card.length <= 0 || card.length > 20) {
		alert("物品号长度必须位于 0～20");
	} else if (name.length <= 0 || name.length > 20) {
		alert("物品名称长度必须位于 0～20");
	} else if (type == "无分类") {
		alert("请选择物品类别");
	} else if (!myreg.exec(num) || num.length >3 || num.length <=0) {
		alert("请输入正确的物品数量");	
	} else {
		$.ajax({//把编号带到后台去
			type: 'post',
			url: "http://localhost:8080/objects/updateObjectServlet",
			async: false,
			data: { "oid": oid, "card": card, "name": name, "type": type, "num": num },
			success: function(message) {//成功的事件
				if (message == "true") {
					alert("物品修改成功！");
					window.location.href = "admin_object.jsp";
				}
				else if (message == "false") {
					alert("修改失败！物品号已存在！");
					window.location.href = "admin_object.jsp";
				}
			}
		});
	}
}

