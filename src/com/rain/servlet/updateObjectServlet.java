package com.rain.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rain.dao.ObjectDao;

@WebServlet("/updateObjectServlet")
public class updateObjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateObjectServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//修改物品信息
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			String card = request.getParameter("card");
			String name = request.getParameter("name");
			String type = request.getParameter("type");
			int num = Integer.parseInt(request.getParameter("num"));
			int oid = Integer.parseInt(request.getParameter("oid"));
			ObjectDao objectdao = new ObjectDao();
			boolean flag = objectdao.updateObject(oid,card,name,type,num);
			if(flag) {
				response.getWriter().print("true");
			}
			else {
				response.getWriter().print("false");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
