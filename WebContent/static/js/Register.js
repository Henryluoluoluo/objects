var number = 0;

function registerTestify() {
	number++;
	let username = document.getElementById('user-username').value;
	let password = document.getElementById('user-password').value;
	let name = document.getElementById('user-name').value;
	let email = document.getElementById('user-email').value;
	let phone = document.getElementById('user-phone').value;
	let reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	let myreg = /^[0-9]{1,20}$/;
	console.log(typeof phone);

	if (username.length < 3 || username.length > 18) {
		alert("请输入长度在3～18到用户名");
	} else if (password.length < 3 || password.lenght > 18) {
		alert("请输入长度在3～18到密码");
	} else if (name.length < 3 || name.length > 18) {
		alert("请输入长度在3～18到姓名");
	} else if (email.length < 1 || email.length > 18) {
		alert("邮箱长度不符合规范");
	} else if (!myreg.exec(phone) || phone.length != 11) {
		alert("请输入正确的手机号");
	} else if (!reg.test(email)) {
		alert("邮箱格式不正确");
	} else {
		$.ajax({
			url: "http://localhost:8080/objects/registerServlet",    //请求的url地址
			dataType: "text",   //返回格式为json
			async: false,//请求是否异步，默认为异步，这也是ajax重要特性
			// contentType:"application/json",
			data: { "username": username, "password": password, "name": name, "email": email, "phone": phone }, //参数值
			type: "POST", //请求方式
			success: function(message) {
				if (message == "0") {
					alert("用户名已被注册！换一个试试吧！");
					window.location.href = "register.jsp";
				}
				else if (message == "1") {
					alert("恭喜你！注册成功！");
					window.location.href = "index.jsp";
				}
			}
		})
	}


}