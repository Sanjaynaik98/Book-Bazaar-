package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MySql;

/**
 * Servlet implementation class CartDelete
 */
public class CartDelete extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		  int id = Integer.parseInt(req.getParameter("bid"));
		  MySql sq = new MySql();
		  try {
		    sq.deleteBook(id);
		  } catch (Exception e) {
		    e.printStackTrace();
		  }
		  // Redirect back to the same page
		  res.sendRedirect(req.getHeader("referer"));
		}


}
