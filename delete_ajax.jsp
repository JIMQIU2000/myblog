<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/myblog";
        String dbname = "root";
        String password = "86125007";
        Connection conn = DriverManager.getConnection(url, dbname, password);
        //connect to the database

        if(conn != null)
        {
            Statement stmt = null;
            String idnow = request.getParameter("id");
            String sql = "DELETE FROM article WHERE id="+idnow;
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            out.println("111");
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
