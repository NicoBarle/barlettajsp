<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <% 
            
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=barletta.nicolas;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			String nome = request.getParameter("nome");
			String sql = "DELETE FROM Evento WHERE nome = ?";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, nome);
            ResultSet rs = prepStmt.executeQuery();
            rs.close();
	        %>
    </body>
</html>