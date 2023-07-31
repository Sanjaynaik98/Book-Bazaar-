package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MySql;

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/edit")
public class EditProfile extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res){
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String pnumber=req.getParameter("phone");
			String password=req.getParameter("password");
			MySql editProfile=new MySql();
			editProfile.updateProfile(id, name, email, pnumber, password);
			res.sendRedirect("editprofilesucess.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
