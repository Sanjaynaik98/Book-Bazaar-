package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MySql;


/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
public void doPost(HttpServletRequest req,HttpServletResponse res) {
	try {
		String name=req.getParameter("fname");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		MySql md=new MySql();
		md.register(name, email, phone, password);
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
}
