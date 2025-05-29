
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AI Chat Page</title>
    <link rel="stylesheet" href="bot.css" />
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<!-- Highlight.js CSS -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/styles/github-dark.min.css">
<!-- Highlight.js JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.7.0/highlight.min.js"></script>

</head>

<body>
    <div class="chat-containers">
        
        <header class="header">
            <div class="head-left">
                <h4>Nyvra</h4>
            </div>
            <div class="head-right">
                <a href="login.php">
                    Log in
                </a>
                <a href="regiser.php">Sign up</a>
            </div>
        </header>

        <main class="chat-main">
            <div class="chat-messages" id="chat-messages">
                
            </div>

            <form class="chat-form" id="chat-form">
                <input type="text" id="user-input" placeholder="Type your message..." autocomplete="off" required />
                <button type="submit">Send</button>
            </form>
        </main>
    </div>

    <script src="index.js"></script>
</body>

</html>