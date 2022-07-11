
function loginTestify() {
	let username = document.getElementById('user-username').value;
	let password = document.getElementById('user-password').value;

	if (username.length == 0 || password.length == 0) {
		alert("输入不能为空");
	} else {
		$.ajax({
			url: "http://localhost:8080/objects/loginServlet",    //请求的url地址
			dataType: "text",   //返回格式为json
			async: false,//请求是否异步，默认为异步，这也是ajax重要特性
			// contentType:"application/json",
			data: { "username": username, "password": password }, //参数值
			type: "POST", //请求方式
			success: function(message) {//提示状态
				let status = message.split(",")[1];
				let result = message.split(",")[2];
				console.log(status);
				console.log(result);
				if (result == "true") {
					if (status == 1) {
						alert("登录成功！欢迎使用公共物品借还系统！");
						window.location.href = 'index2.jsp';
					}
					else if (status == 2) {
						alert("登录成功！您可以对系统进行管理了！");
						window.location.href = 'admin.jsp';
					}
				}
				if (result == "false") {
					alert("密码错误！请重新登录！");
					window.location.href = 'index.jsp';
				}
			}
		})
	}
}