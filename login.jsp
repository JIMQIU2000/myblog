<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./css/loading.css">
</head>
<body>
    <div class="loading">
        <h1>Loading</h1>
        <div class="wrapper">
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
            <div class="item"></div>
        </div>
    </div>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/myblog";
        String dbname = "root";
        String password = "86125007";
        Connection conn = DriverManager.getConnection(url, dbname, password);
        //connect to the database

        String name = request.getParameter("username");
        String pass = request.getParameter("password");
        boolean flag = false;

        if(conn != null)
        {
            //out.println("The database is connected!");
            Statement stmt = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM login where username='"+name+"';";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            if(rs.next())
            {
                if(rs.getString("password").equals(pass))
                {   
                    flag = true;
                }
                else
                {
                    flag = false;
                }

                if(flag == true)
                {
                    //response.sendRedirect("home.jsp");
                    session.setAttribute("username", name);
                    response.setHeader("refresh", "2;URL=home.jsp");
                }
                else{
                    out.println("<div class='res'>");
                    out.println("password went wrong!");
                    out.println("</div>");
                    response.setHeader("refresh", "3;URL=login.html");
                }
            }
            else
            {
                out.println("<div class='res'>");
                out.println("User not exist");
                out.println("</div>");
                response.setHeader("refresh", "3;URL=regist.html");
            }
            
        }
        else
        {
            out.println("Fail to conect!");
        } 

    }
    catch(Exception e)
    {
        out.println(e);
    }
%>
</body>
</html>