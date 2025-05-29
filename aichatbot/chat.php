<?php

    require_once "Controller/AuthController.php";


    if(!isset($_SESSION['id'])){
        header("location:login.php?mess=Sorry you session was expired");
    }


    $new = new AuthController;

    $resendMessage = $new->getMessageID();

?>

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
    <div class="chat-container">
        <aside class="sidebar">
            <h2>AI ChatBot</h2>
            <div class="user-profile">
                <img src="img/images.jpeg" alt="User Profile" />
                <div class="user-info">
                    <strong><?=$_SESSION['name']?></strong>
                    <span>Online</span>
                </div>
            </div>

            <div class="recent-messages">
                <h3>Recent Messages</h3>
                <ul>
                    <li align="center"><a href="#!" class="new-chat" onclick="loadNewChat('<?php echo uniqid('chat_'.time()) ?>')">New chat</a></li>
                    <!-- $resendMessage -->
                    <?php if($resendMessage->rowCount() > 0):?>
                        <?php foreach($resendMessage as $link):?>
                            <?php  if($link['first_message'] == null):?>
                                <li><a href="#"  onclick="loadChat('<?=$link['chat_id']?>')">New chat</a></li>
                            <?php  else:?>
                                <li><a href="#"  onclick="loadChat('<?=$link['chat_id']?>')">
                                    <?php
                                        $maxLength = 45; // Set desired cutoff length
                                        $message = $link['first_message'];

                                        if (strlen($message) > $maxLength) {
                                            echo substr($message, 0, $maxLength) . '...';
                                        } else {
                                            echo $message;
                                        }
                                        ?>
                                </a></li>
                            <?php  endif;?>
                        <?php endforeach;?>
                    <?php else:?>
                        <li><a href="#!">Start New</a></li>
                    <?php endif;?>
                </ul>
            </div>

            <a href="logout.php" class="logout">
                <div>
                    Logout
                </div>
            </a>

        </aside>


        <main class="chat-main">
            <div class="chat-messages" id="chat-messages">
                
            </div>

            <form class="chat-form" id="chat-form">
                <input type="text" id="user-input" placeholder="Type your message..." autocomplete="off" required />
                <button type="submit">Send</button>
            </form>
        </main>
    </div>

    <script src="chat.js"></script>
</body>

</html>