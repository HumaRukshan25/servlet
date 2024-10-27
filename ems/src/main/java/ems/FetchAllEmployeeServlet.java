package ems;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/allemp")
public class FetchAllEmployeeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","root");
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select * from emp");
			
			req.setAttribute("rs", rs);
			
			RequestDispatcher rd=req.getRequestDispatcher("allemp.jsp");
			rd.forward(req,resp);
			
			
//			while(rs.next()) {
//				System.out.println(rs.getInt(1));
//				System.out.println(rs.getString(2));
//				System.out.println(rs.getString(3));
//				System.out.println(rs.getDouble(4));
//				System.out.println(rs.getInt(5));
//				System.out.println(rs.getString(6));
//				
//			}
			
			// <%     %> to execute java code
			// <%=   %> print content
			// <%!   %> declare the variables
				
		rs.close();
			s.close();
			con.close();
	
			
		} catch (ClassNotFoundException |SQLException e) {
			
			e.printStackTrace();
		}
	}

}
