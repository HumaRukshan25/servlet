package ems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns="/login")

public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","root");
			PreparedStatement ps=con.prepareStatement("select * from emp where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			
			PrintWriter pw=resp.getWriter();
			
			
			if(rs.next()){
				//http is stateless protocol to make to statefull we are using httpsession
				//it is an inteface we need to store data of http
				// getSession is helper method
				
				HttpSession session=req.getSession();
				
				session.setAttribute("name",rs.getString(2));
				session.setAttribute("email",rs.getString(3));
				session.setAttribute("password",rs.getString(6));
				
				
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","root");
					Statement s=con.createStatement();
					ResultSet rs1=s.executeQuery("select * from emp");
					
					
					pw.write("<html><body><h1 id='msg'> Login successful </h1></body></html>");
					
					req.setAttribute("rs", rs1);
					RequestDispatcher rd=req.getRequestDispatcher("allemp.jsp");
					rd.include(req,resp);
					
						
				rs1.close();
					s.close();
					con1.close();
			
					
				} catch (ClassNotFoundException |SQLException e) {
					
					e.printStackTrace();
				}
				RequestDispatcher rd=req.getRequestDispatcher("/allemp");
				rd.include(req, resp);

				
			}
			
			else {
				pw.write("<html><body><h1 id='msg'> Invalid credientials </h1></body></html>");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
				
				
			}
					
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
	}

}
