<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.AdminBean,com.rain.bean.HistoryBean,com.rain.dao.AdminDao" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>公共物品借还系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css">
	<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
    <script src="static/jQuery/jquery-3.1.1.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript" src = "static/js/UpdateUserInfo.js"></script>    
</head>

<body class="bootstrap-admin-with-small-navbar" style="background: url(./static/images/background2.jpg);background-size:100% 100%;background-attachment: fixed;transform: scale(1.0);">
	<%
		AdminBean admin = new AdminBean();
		String aid = (String)session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		admin = admindao.get_AidInfo2(aid);
	%>
    <nav class="navbar navbar-default navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="collapse navbar-collapse main-navbar-collapse">
                        <a class="navbar-brand"><strong>欢迎使用公共物品借还系统</strong></a>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                           		<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="glyphicon glyphicon-user"></i> 欢迎您: 
                                <span><% out.write(admin.getName());%></span>  <i class="caret"></i></a>
								<ul class="dropdown-menu">
                                	<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                                 	<li role="presentation" class="divider"></li>
                                	<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                                	<li role="presentation" class="divider"></li>
                                	<li><a href="/objects/index.jsp">退出</a></li>
                            	</ul>
                        	</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-md-2 bootstrap-admin-col-left">
                <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
                    <li><a href="/objects/admin_object.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 物品管理</a></li>
                    <li><a href="/objects/admin_user.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 用户管理</a></li>
                    <li><a href="/objects/admin_objecttype.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 物品分类管理</a></li>
                    <li><a href="/objects/admin_borrow.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 物品借出信息</a></li>
                    <li><a href="/objects/admin_history.jsp"><i class="glyphicon glyphicon-chevron-right"></i> 物品归还信息</a></li>
                </ul>
            </div>
            <!-- content -->
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">物品管理</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据物品编号、物品名称查询物品基本信息</li>
                                    <li>添加、修改、删除物品</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">物品分类管理</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据分类名称查询物品分类信息</li>
                                    <li>添加、修改、删除物品分类</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">物品借出</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>展示所有正在借出物品的信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">物品归还</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>展示所有已归还物品的信息</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">用户管理</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <ul>
                                    <li>根据账号、姓名查询用户基本信息</li>
                                    <li>添加、修改、删除用户信息</li>
                                </ul>
                            </div>
                        </div>
                	</div>
            	</div>     
        	</div>
   	 	</div>
				<!--------------------------------------添加的模糊框------------------------>  
		<!-------------------------------------------------------------->                   
        <form class="form-horizontal">   <!--保证样式水平不混乱-->                  
	        <!-- 模态框（Modal） -->
			<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">修改密码</h4>
						</div>
						<div class="modal-body">
							<!--正文-->
							<input type="hidden" name="tip" id ="tip" value="1">
							<input type="hidden" name="url" id = "url" value="admin_user">
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">原密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="password" id="oldPwd"  placeholder="请输入原密码">
									<label class="control-label" for="oldPwd" style="display: none"></label>				
								</div>
							</div>	
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">新密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" name="password2" id="newPwd"  placeholder="请输入新密码">
									<label class="control-label" for="newPwd" style="display: none"></label>			
								</div>
							</div>	
							<!--正文-->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary" onclick="updatePassword('<%=admin.getAid() %>')">修改</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal -->
			</div>
		</form>	
    <!-------------------------------------------------------------->                                  
    <!-------------------------个人资料模糊框------------------------------------->                 
    <form class="form-horizontal">   <!--保证样式水平不混乱-->                  
    	<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>		
					<div class="modal-body">							 
					<!--正文-->
						<input type="hidden" name="tip" id="infoTip" value="2">
						<input type="hidden" name="url" id="infoUrl" value="admin_user">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名" value='<% out.write(admin.getName());%>'>
								<label class="control-label" for="name" style="display: none"></label>			
							</div>
						</div>								
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号" value='<% out.write(admin.getPhone());%>'>
								<label class="control-label" for="phone" style="display: none"></label>				
							</div>
						</div>		
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email"  placeholder="请输入您的邮箱" value='<% out.write(admin.getEmail());%>'>
								<label class="control-label" for="email" style="display: none"></label>				
							</div>
						</div>			
						<!--正文-->	
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="submit" class="btn btn-primary" onclick="updateInfo('<%=admin.getAid() %>')" >修改</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
	</form>	  
</body>
</html>