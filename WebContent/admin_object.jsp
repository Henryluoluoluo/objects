<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "com.rain.bean.TypeBean,com.rain.dao.AdminDao,com.rain.dao.TypeDao,com.rain.bean.ObjectBean,com.rain.dao.ObjectDao,com.rain.bean.AdminBean" %>
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
    <script type="text/javascript" src = "static/js/AdminAddObject.js"></script>
    <script type="text/javascript" src = "static/js/AdminUpdateObject.js"></script>
    <script type="text/javascript" src = "static/js/UpdateUserInfo.js"></script>
</head>

<body class="bootstrap-admin-with-small-navbar" style="background: url(./static/images/background1.jpg);background-size:100% 100%;background-attachment: fixed;transform: scale(1.0);">
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
                           	<span><%
 out.write(admin.getName());
 %></span>  <i class="caret"></i></a>
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
                    <div class="col-lg-12">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">查询</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form class="form-horizontal" action="/objects/selectServlet" method="post">
                                	<input type="hidden" name="tip" value="1">
                        			<div class="col-lg-7 form-group">
                                        <label class="col-lg-4 control-label" for="query_bname">物品名称</label>
                                        <div class="col-lg-8">
                                            <input class="form-control" id="objectName" name="name" type="text" value="">
                                            <label class="control-label" for="query_bname" style="display: none;"></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="submit" class="btn btn-primary" id="btn_query" onclick="">查询</button>
                                    </div>
                                    <div class="col-lg-2 form-group">
                                        <button type="button" class="btn btn-primary" id="btn_add" data-toggle="modal" data-target="#addModal">添加物品</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                    
                <div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-hover table-bordered" cellspacing="0" width="100%">
                            <thead>
                            	<tr>
                                	<th>物品号</th>
                                	<th>物品类型</th>
                                	<th>物品名称</th>
                                	<th>总数量</th>
                                	<th>操作</th>               
                            	</tr>
                            </thead>

                            <!---在此插入信息-->
                            <%
                            ArrayList<ObjectBean> objectdata = new ArrayList<ObjectBean>();
                                                         	objectdata = (ArrayList<ObjectBean>)request.getAttribute("data");
                                                       		if(objectdata==null){
                                                    	   		ObjectDao objectdao = new ObjectDao();
                                                    	   		objectdata = (ArrayList<ObjectBean>)objectdao.get_ListInfo();
                                                       		}
                              								for (ObjectBean bean : objectdata){
                            %>                 
							<tbody>
		                        <td><%= bean.getCard() %></td>
		                        <td><%= bean.getType() %></td>
		                        <td><%= bean.getName() %></td>
		                        <td><%= bean.getNum() %></td>
								<td><button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#updateModal" 
								id="btn_update" onclick="showInfo2('<%= bean.getOid() %>','<%= bean.getCard() %>','<%= bean.getType() %>','<%= bean.getName() %>'
								,'<%= bean.getNum() %>')">修改</button>
									<button type="button" class="btn btn-danger btn-xs" onclick="deleteobject(<%=  bean.getOid() %>)">删除</button>
								</td>                                            
                            </tbody>
                       		<%} %> 
                        </table>
                    </div>
                </div>
        	</div>
    	</div>
    <script type="text/javascript">
    function showInfo2(oid,card,type,name,num) {
        document.getElementById("updateCard").value = card;
        document.getElementById("updateObjectName").value = name;
        document.getElementById("updateObjectType").value = type;
        document.getElementById("updateNum").value = num;
        document.getElementById("updateObjectId").value = oid;
    }
    function deleteobject(oid) {
    	con=confirm("是否删除?"); 
    	if(con==true){
    		location.href = "/objects/deleteServlet?oid="+oid;
    	}
    }
    </script>
    
                                
    <!-- 修改模态框（Modal） -->
    <form class="form-horizontal" method="post">   <!--保证样式水平不混乱-->   
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="updateModalLabel">修改物品信息</h4>
					</div>
					<div class="modal-body">										
					<!---------------------表单-------------------->
					<div class="form-group">
						<label for="firstname" class="col-sm-3 control-label">物品号</label>
						<div class="col-sm-7">
							<input type="hidden" id="updateObjectId" name="updatebid">
							<input type="text" class="form-control" id="updateCard" name="card"  placeholder="请输入书号">
							<label class="control-label" for="updateCard" style="display: none;"></label>
						</div>
					</div>																	
					<div class="form-group">
						<label for="firstname" class="col-sm-3 control-label">物品名称</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="updateObjectName" name="name"  placeholder="请输入物品名称">
							<label class="control-label" for="updateObjectName" style="display: none;"></label>
						</div>
					</div>									
					<div class="form-group">	
						<label for="firstname" class="col-sm-3 control-label">物品类型</label>
							<div class="col-sm-7">
								<select class="form-control" id="updateObjectType" name="type" onPropertyChange="showValue(this.value)">
                               		<option value="-1">请选择</option> 
                                    <%
                                    	TypeDao typedao = new TypeDao();
										ArrayList<TypeBean> data = (ArrayList<TypeBean>)typedao.get_ListInfo();
  										data = (ArrayList<TypeBean>)typedao.get_ListInfo();
  										for (TypeBean bean : data){
  									%>                 
  									<option value="<%= bean.getName() %>"><%= bean.getName() %></option>                        <%} %>                                        
                                </select>
								<label class="control-label" for="updateObjectType" style="display: none;"></label>
							</div>
					</div>													
					<div class="form-group">	
						<label for="firstname" class="col-sm-3 control-label">总数量</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="updateNum" name="num"  placeholder="请输入总数量">
							<label class="control-label" for="updateNum" style="display: none;"></label>
						</div>
					</div>	
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="updateObject()">修改</button>
						</div>
					</div><!-- /.modal-content -->
			</div><!-- /.modal -->
		</div>
    </form>
    <!-------------------------------------------------------------->
     
    <!--------------------------------------添加的模糊框------------------------>  
    <form class="form-horizontal" method="post">   <!--保证样式水平不混乱-->   
    <!-- 模态框（Modal） -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加新物品</h4>
				</div>
				<div class="modal-body">			
				<!---------------------表单-------------------->									
				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">物品号</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="addCard" required="required" name="card" placeholder="请输入书号">
						<label class="control-label" for="addCard" style="display: none;"></label>	
					</div>
				</div>									
				<div class="form-group">
					<label for="firstname" class="col-sm-3 control-label">物品名称</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="addObjectName" required="required" name="name"  placeholder="请输入物品名称">
						<label class="control-label" for="addObjectName" style="display: none;"></label>	
					</div>
				</div>										
				<div class="form-group">	
					<label for="firstname" class="col-sm-3 control-label">物品类型</label>
					<div class="col-sm-7">
						<select class="form-control" id="addObjectType" name="type">
                        	<option value="无分类">请选择</option>
                            <%
                            	data = (ArrayList<TypeBean>)typedao.get_ListInfo();
  								for (TypeBean bean : data){
  							%>                 
  							<option value="<%= bean.getName() %>"><%= bean.getName() %></option>                        <%} %>
                        </select>
						<label class="control-label" for="addObjectType" style="display: none;"></label>	
					</div>
				</div>											
				<div class="form-group">	
					<label for="firstname" class="col-sm-3 control-label">总数量</label>
					<div class="col-sm-7">
						<input type="num" class="form-control" id="addNum" required="required" name="num" placeholder="请输入物品总数量">
						<label class="control-label" for="addNum" style="display: none;"></label>	
					</div>
				</div>
				<!---------------------表单-------------------->
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" onclick="addObject()">添加</button>
					</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
   	</form>	
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