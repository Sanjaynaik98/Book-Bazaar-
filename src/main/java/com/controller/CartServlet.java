package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MySql;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  int bid = Integer.parseInt(req.getParameter("bid"));
		  int uid = Integer.parseInt(req.getParameter("id"));
		  String book_name = req.getParameter("book_name");
		  String author = req.getParameter("author");
		  String price = req.getParameter("price");
		  String total_price = req.getParameter("total_price");

		  HttpSession session = req.getSession();
		  MySql md = new MySql();
		  int f = md.addCart(bid, uid, book_name, author, price, total_price);

		  if (f == 1) {
		    System.out.println("add cart success");
		  } else {
		    System.out.println("not added to cart");
		  }

		  // Redirect back to the same page
		  String referer = req.getHeader("Referer");
		  resp.sendRedirect(referer);
		}



	}
	


