const chatForm = document.getElementById('chat-form');
const userInput = document.getElementById('user-input');
const chatMessages = document.getElementById('chat-messages');

// Replace this with your actual OpenRouter API key
const API_KEY = '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';

let chatId = "";
chatForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const message = userInput.value.trim();
    if (!message) return;

    addMessage('user', message);
    userInput.value = '';

    addMessage('bot', 'Typing...');

    try {
        const response = await fetch('https://openrouter.ai/api/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${API_KEY}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                model: "openai/gpt-3.5-turbo", // or any other model available to you
                messages: [{ role: 'user', content: message }]
            })
        });
        const data = await response.json();
        const reply = data.choices[0]?.message?.content || "Sorry, no response.";


        const postToDataBase = await fetch('http://localhost/aichatbot/Controller/ChatController.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                chat_id: chatId,
                user_message: message,
                bot_reply: reply
            })
        });

        const result = await postToDataBase.json();
        console.log("Chat store result:", result);
        updateLastBotMessage(reply);
    } catch (error) {
        updateLastBotMessage("An error occurred. Please try again.");
        console.error(error);
    }
});

function addMessage(sender, content) {
    const msgDiv = document.createElement('div');
    msgDiv.classList.add('message', sender);
    msgDiv.innerHTML = `<div class="content">${marked.parse(content)}</div>`;
     
    hljs.highlightAll(); 
    chatMessages.appendChild(msgDiv);
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

function updateLastBotMessage(newContent) {
    const botMessages = document.querySelectorAll('.message.bot .content');
    const lastBot = botMessages[botMessages.length - 1];
    if (lastBot) {
        lastBot.innerHTML = marked.parse(newContent); // Convert Markdown to HTML
        hljs.highlightAll(); // Apply syntax highlighting to code blocks
    }
}


function fillInput(text) {
    userInput.value = text;
}


async function loadChat(chat_id) {
    try {
        const response = await fetch(`http://localhost/aichatbot/Controller/GetChatsController.php?chat_id=${chat_id}`);
        const chats = await response.json();

        chatMessages.innerHTML = ''; // clear previous chats

        chatId = chat_id;
        chats.forEach(chat => {
            addMessage('user', chat.user_message);
            addMessage('bot', chat.bot_reply);
        });
        
    } catch (error) {
        console.error("Failed to load chat:", error);
    }
}

function generateUniqueId() {
  return Date.now().toString(36) + Math.random().toString(36).substring(2);
}


async function loadNewChat(new_chat_id){

    try{
        chatId = generateUniqueId();
        const response = await fetch(`http://localhost/aichatbot/Controller/CreaeNewChatsController.php?chat_id=${chatId}`);
        const chats = await response.json();
        chats.forEach(chat => {
            addMessage('user', chat.user_message);
            addMessage('bot', chat.bot_reply);
        });
        console.log(response)
        alert("You have registered the new chat now start the message")
    }catch(err){
        console.log(err)
    }
}