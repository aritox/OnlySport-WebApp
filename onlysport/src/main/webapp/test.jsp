<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.Arrays, java.net.URL, java.util.Enumeration" %>
<html>
<head>
  <title>PostgreSQL Driver Check</title>
  <style>
    body { font-family: sans-serif; padding: 2em; }
    pre { background: #f4f4f4; padding: 1em; border-radius: 4px; }
  </style>
</head>
<body>
  <h1>PostgreSQL Driver Class Lookup</h1>
  <%
    try {
      Enumeration<URL> resources = 
        Thread.currentThread()
              .getContextClassLoader()
              .getResources("org/postgresql/Driver.class");
      if (!resources.hasMoreElements()) {
  %>
      <p><strong>No driver resources found.</strong></p>
  <%
      } else {
        out.println("<p>Found the following resource locations:</p>");
        out.println("<pre>");
        while (resources.hasMoreElements()) {
          URL url = resources.nextElement();
          out.println(url);
        }
        out.println("</pre>");
      }
    } catch (Exception e) {
      out.println("<p><strong>Error:</strong> " + e + "</p>");
    }
  %>
</body>
</html>
