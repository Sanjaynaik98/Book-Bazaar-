package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MySql;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/delete")
public class Delete extends HttpServlet {
public void doGet(HttpServletRequest req,HttpServletResponse res) {
	int id=Integer.parseInt(req.getParameter("id"));
	MySql sq=new MySql();
	try {
		sq.delete(id);
		res.sendRedirect("deleted.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
}

}
