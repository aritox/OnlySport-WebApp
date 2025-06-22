<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Chatbot - OnlySports</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

        .chat-container {

            width: 100%;

            max-width: 600px;

            margin: auto;

            background-color: #f8f9fa;

            padding: 20px;

            border-radius: 10px;

            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);

        }

        .chat-box {

            height: 400px;

            overflow-y: scroll;

            padding: 10px;

            background-color: #fff;

            border-radius: 10px;

            margin-bottom: 20px;

        }

        .chat-bubble {

            background-color: #e2e2e2;

            padding: 10px;

            border-radius: 20px;

            margin-bottom: 10px;

            max-width: 70%;

        }

        .chat-bubble.user {

            background-color: #007bff;

            color: white;

            margin-left: auto;

        }

        .chat-bubble.bot {

            background-color: #f1f1f1;

        }

        .input-group {

            margin-top: 20px;

        }

    </style>

</head>

<body>

    <jsp:include page="components/navbar.jsp" />



    <div class="container mt-5">

        <div class="chat-container">

            <h2>Chatbot Sport</h2>

            <div class="chat-box" id="chatBox">

                <!-- Dynamic messages will be inserted here -->

            </div>

            <form id="chatForm" onsubmit="return sendMessage();">

                <div class="input-group">

                    <input type="text" class="form-control" id="userMessage" placeholder="Posez une question..." required>

                    <button type="submit" class="btn btn-primary">Envoyer</button>

                </div>

            </form>

        </div>

    </div>



    <jsp:include page="components/footer.jsp" />



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



    <script>

  document.addEventListener('DOMContentLoaded', () => {

    const chatBox = document.getElementById('chatBox');

    const chatForm = document.getElementById('chatForm');

    const inputEl = document.getElementById('userMessage');



    function appendMessage(text, sender) {

      console.log('appendMessage', sender, text);

      const msg = document.createElement('div');

      msg.classList.add('chat-bubble', sender);

      msg.innerText = text;

      chatBox.appendChild(msg);

      chatBox.scrollTop = chatBox.scrollHeight;

    }



    async function sendMessage(evt) {

      evt.preventDefault();

      const text = inputEl.value.trim();

      console.log('sendMessage triggered, text=', text);

      if (!text) return;



      appendMessage(text, 'user');

      inputEl.value = '';



      try {

        const res = await fetch('http://localhost:8000/chat', {

          method: 'POST',

          headers: { 'Content-Type': 'application/json' },

          body: JSON.stringify({ message: text })

        });

        console.log('fetch response', res);

        const data = await res.json();

        console.log('response JSON', data);

        appendMessage(data.response || data.error || 'No data', 'bot');

      } catch (err) {

        console.error('Fetch error', err);

        appendMessage('Erreur du serveur: ' + err.message, 'bot');

      }

    }



    chatForm.addEventListener('submit', sendMessage);

  });

</script>



</body>

</html>