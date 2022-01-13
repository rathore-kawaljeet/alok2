<%-- Document : registrationjsp Created on : 28 Dec, 2021, 3:00:14 PM Author : LENOVO --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body>
            <% String fname=request.getParameter("txtFname"); String uname=request.getParameter("txtName"); String
                pass1=request.getParameter("pass"); String pass2=request.getParameter("repass"); String
                email=request.getParameter("eid"); if(pass1.equals(pass2)) { Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","hemant");
                PreparedStatement stmt=con.prepareStatement("insert into data1 values (?,?,?,?)");
                stmt.setString(1,fname); stmt.setString(2,uname); stmt.setString(3,pass1); stmt.setString(4,email); int
                row=stmt.executeUpdate(); if(row==1){ out.println("Registration Successfull"); %>
                <jsp:include page="login.html" />
                <% } %>
        </body>

        </html>