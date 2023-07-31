package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			Validator vd = new Validator();
			boolean val = vd.isValid(email, password);
			if (val == true && email.equals("admin@gmail.com")) {
				res.sendRedirect("homeAdmin.jsp");
			} else if (val == true) {
				// Create a session and set an attribute to indicate that the user is logged in
				session.setAttribute("userId", true);

				session.setAttribute("loggedIn", true);

				// Redirect the user to the cart servlet
				res.sendRedirect("home.jsp");
			}
			else if(val==false) {
				session.invalidate();
				res.sendRedirect("login.jsp");
			}
			else {
				res.sendRedirect("invalid.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
}
