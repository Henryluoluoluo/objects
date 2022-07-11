package com.rain.servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.rain.bean.AdminBean;
import com.rain.dao.AdminDao;
import com.rain.dao.ObjectDao;

@WebServlet("/borrowServlet")
public class borrowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public borrowServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ObjectDao objectdao = new ObjectDao();
		int tip = Integer.parseInt(request.getParameter("tip"));
		try{
			if(tip==1){
				int oid = Integer.parseInt(request.getParameter("oid"));
				HttpSession session = request.getSession();
				AdminBean admin = new AdminBean();
				String aid = (String)session.getAttribute("aid");
				AdminDao admindao = new AdminDao();
				admin = admindao.get_AidInfo2(aid);
				objectdao.borrowObject(oid,admin);
				response.sendRedirect("/objects/select.jsp");
			}
			else{
				int hid = Integer.parseInt(request.getParameter("hid"));
				int oid = Integer.parseInt(request.getParameter("oid"));
				int show = Integer.parseInt(request.getParameter("show"));
				objectdao.returnObject2(hid,oid);
				if(show==1){
					response.sendRedirect("/objects/borrow.jsp");
				}
				else{
					response.sendRedirect("/objects/admin_borrow.jsp");
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
