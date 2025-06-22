<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Conversation" %>
<%@ page import="models.Message" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat - OnlySports</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
</head>

<body>

<jsp:include page="components/navbar.jsp"/>

<% 
    int convId = Integer.parseInt(request.getParameter("convId"));
    List<Message> messages = Message.getMessages(convId);  // Récupère les messages de la conversation
%>

<div class="container my-5">
    <h2 class="text-center mb-4">Conversation avec le Coach</h2>

    <div class="chat-box">
        <%-- Affichage des messages --%>
        <c:forEach var="message" items="${messages}">
            <div class="message">
                <p class="sender">${message.senderName}</p>
                <p class="text">${message.text}</p>
                <p class="time">${message.timestamp}</p>
            </div>
        </c:forEach>
    </div>

    <form action="${pageContext.request.contextPath}/sendMessage" method="POST">
        <input type="hidden" name="convId" value="${convId}" />
        <div class="mb-3">
            <textarea class="form-control" name="messageText" rows="3" placeholder="Écrivez votre message..."></textarea>
        </div>
        <button type="submit" class="btn btn-primary w-100">Envoyer</button>
    </form>
</div>

<jsp:include page="components/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
