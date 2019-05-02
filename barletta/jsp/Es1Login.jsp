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
			
			int utenti = 0;
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String sql = "SELECT COUNT(ID) as Cittadini FROM Cittadino WHERE username = ? AND password = ?";
            PreparedStatement prepStmt = connection.prepareStatement(sql);
            prepStmt.setString(1, username);
            prepStmt.setString(2, password);
            ResultSet rs = prepStmt.executeQuery();
            while(rs.next()){
                utenti = rs.getInt("utenti");
            } 
            rs.close();
            if(utenti == 0){ %>
            <h1>Username o password non corretti, ritenta</h1> <%
            } else { %>
            <h1>Benvenuto</h1>
            <% }
            Statement stmt = connection.createStatement();

			String sql2 = "SELECT * FROM Evento";
			
			ResultSet rs2 = stmt.executeQuery(sql2);
			
			out.print("<table>");
			
			out.print("<tr><th align=left>Nome</th><th align=left>Descrizione</th></tr>");
			
    		while(rs2.next()){

				String nome = rs2.getString("nome");
				String descrizione = rs2.getString("descrizione");
                
                out.print("<tr><td>" + nome + "</td><td>" + descrizione + "</td></tr>");

	        }
	        
	        out.print("</table>");
	        
	        rs2.close();
	        
	        connection.close();
	        
	        %>
    </body>
</html>