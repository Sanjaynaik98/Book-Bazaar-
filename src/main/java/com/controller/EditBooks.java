package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MySql;

/**
 * Servlet implementation class EditBooks
 */
public class EditBooks extends HttpServlet {
public void doPost(HttpServletRequest req,HttpServletResponse res) {
	try {
	int id=Integer.parseInt(req.getParameter("id"));
	String bookname=req.getParameter("bookname");
	String author=req.getParameter("author");
	String price=req.getParameter("price");			
	String status=req.getParameter("status");
	MySql edit=new MySql();
	edit.updateBook(id, bookname, author, price, status);
	res.sendRedirect("allbooksupdated.jsp");
}
catch (Exception e) {
	e.printStackTrace();
}
}

}
