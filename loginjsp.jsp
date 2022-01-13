<%-- Document : loginjsp Created on : 28 Dec, 2021, 3:31:55 PM Author : LENOVO --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>

        <body>
            <% String uname=request.getParameter("txtName");String pass=request.getParameter("txtpass"); try{
                Class.forName("com.mysql.jdbc.Driver"); Connection
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","hemant"); PreparedStatement
                stmt=con.prepareStatement("select password from data1 where username=?"); stmt.setString(1,uname);
                ResultSet rs=stmt.executeQuery(); if(rs.next()){ if(pass.equals(rs.getString(1))) { out.println("<h1>
                ~~~LOGIN SUCCESSFULL~~~</h1>");
                }
                else{
                out.println("<h1>PASSWORD INCORRECT</h1>");
                }
                }
                else{ out.println("<h1>User Name not exist!!!!</h1>");
                %>
                <jsp:include page="login.html"></jsp:include>
                <% } }catch(Exception e){out.println(e);} %>
        </body>

        </html>