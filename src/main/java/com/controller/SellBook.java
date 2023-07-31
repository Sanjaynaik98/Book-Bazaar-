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
 * Servlet implementation class SellBook
 */
@WebServlet("/sell")
@MultipartConfig
public class SellBook extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) {
		try {
			String user_email=req.getParameter("email");
			String bookname=req.getParameter("bookname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories="Old"	;		
			String status="Active";	
			Part part=req.getPart("bimg");
			String filename=part.getSubmittedFileName();
			MySql sql=new MySql();
			sql.info(bookname, author, price, categories, status, filename, user_email);
			
			String path=getServletContext().getRealPath("")+"book";
			File f=new File(path);
			part.write(path+File.separator+filename);
			System.out.println(path);
			res.sendRedirect("sellsucess.jsp");
			System.out.println(bookname+" "+author+" "+price+" "+categories+" "+status+" "+filename+" "+user_email);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
