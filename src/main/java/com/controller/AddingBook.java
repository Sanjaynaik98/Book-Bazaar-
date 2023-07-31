package com.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.model.MySql;

/**
 * Servlet implementation class AddingBook
 */
@WebServlet("/add")
@MultipartConfig
public class AddingBook extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		try {
			String bookname=req.getParameter("bookname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");			
			String status=req.getParameter("status");	
			Part part=req.getPart("bimg");
			String filename=part.getSubmittedFileName();
			MySql sql=new MySql();
			sql.info(bookname, author, price, categories, status, filename, "admin");
			
			String path=getServletContext().getRealPath("")+"book";
			File f=new File(path);
			part.write(path+File.separator+filename);
			System.out.println(path);
			res.sendRedirect("booksucess.jsp");
			System.out.println(bookname+" "+author+" "+price+" "+categories+" "+status+" "+filename+" "+"admin");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
