function addUser() {
	let name = document.getElementById("addname").value;
	let username = document.getElementById("addusername").value;
	let email = document.getElementById("addemail").value;
	let phone = document.getElementById("addphone").value;
	let password = document.getElementById("addpassword").value;
	let lend_num = document.getElementById("addlend_num").value;
	let max_num = document.getElementById("addmax_num").value;
	let reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	let myreg = /^[0-9]{1,20}$/;
	
	if (lend_num < 0 || lend_num > 30) {
		alert("每个用户可借天数为 0～30 天");
	} else if (max_num < 0 || max_num > 10) {
		alert("每个用户可借物品数为 0～10 件");
	} else if (username.length < 3 || username.length > 18) {
		alert("请输入长度为 3～18 的用户名");
	} else if (password.length < 3 || password.lenght > 18) {
		alert("请输入长度为 3～18 的密码");
	} else if (name.length < 3 || name.length > 18) {
		alert("请输入长度为 3～18 的姓名");
	} else if (email.length < 1 || email.length > 18) {
		alert("邮箱长度不符合规范");
	} else if (!myreg.exec(phone) || phone.length != 11) {
		alert("请输入正确到手机号");
	} else if (!reg.test(email)) {
		alert("邮箱格式不正确");
	} else {
		$.ajax({//把编号带到后台去
			type: 'post',
			url: "http://localhost:8080/objects/addUserServlet",
			async: false,
			data: {
				"name": name, "username": username, "email": email,
				"phone": phone, "password": password, "lend_num": lend_num, "max_num": max_num
			},
			success: function(message) {//成功的事件
				if (message == "1") {
					alert("添加成功！");
					window.location.href = "admin_user.jsp";
				}
				else if (message == "0") {
					alert("该用户名已存在！");
					window.location.href = "admin_user.jsp";
				}
			}
		});
	}

}

