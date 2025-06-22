<%@ page import="java.sql.Connection, database.DatabaseManagement, java.io.PrintWriter" %>
<%@ page errorPage="" %>
<html>
  <head><meta charset="UTF-8"/><title>Test DB Connection</title></head>
  <body>
  <%
    try (Connection conn = DatabaseManagement.getConnection()) {
      out.println("<p style='color:green;'>✔️ Connected successfully!</p>");
    } catch (Exception e) {
      out.println("<p style='color:red;'>❌ Connection error:</p>");
      // Wrap the JspWriter in a PrintWriter so printStackTrace can write to it:
      PrintWriter pw = new PrintWriter(out);
      e.printStackTrace(pw);
      pw.flush();
    }
  %>
  </body>
</html>
