/**
 * 
 */

function updatePassword(adminId) {
	let tip = document.getElementById("tip").value;
	let password = document.getElementById("oldPwd").value;
	let password2 = document.getElementById("newPwd").value;
	let aid = adminId;
	if (password == "" || password2 == "") {
		alert("输入不能为空！请重新输入！")
	} else if (password2.length < 3 || password2.lenght > 18) {
		alert("请输入长度在3～18到密码");
	} else {
		$.ajax({//把编号带到后台去
			type: 'post',
			url: "http://localhost:8080/objects/adminServlet",
			async: false,
			data: { "tip": tip, "password": password, "password2": password2, "aid": aid },
			success: function(message) {//成功的事件
				if (message == "true") {
					alert("密码修改成功！");
				}
				else if (message == "false") {
					alert("旧密码错误修改失败！");
				}
			}
		});
	}

}

function updateInfo(adminId) {
	let name = document.getElementById("name").value;
	let email = document.getElementById("email").value;
	let phone = document.getElementById("phone").value;
	let aid = adminId;
	let tip = document.getElementById("infoTip").value;
	let reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;

	if(name.length < 3 || name.length > 18) {
		alert("请输入长度在3～18到姓名");
	} else if (email.length < 1 || email.length > 18) {
		alert("邮箱长度不符合规范");
	} else if (phone.length == 0 || phone.length != 11) {
		alert("请输入正确到手机号");
	} else {
		$.ajax({
			type: 'post',
			url: "http://localhost:8080/objects/adminServlet",
			async: false,
			data: { "tip": tip, "name": name, "email": email, "phone": phone, "aid": aid },
			success: function() {//成功的事件
				alert("信息修改成功！");
			}
		})
	}
}