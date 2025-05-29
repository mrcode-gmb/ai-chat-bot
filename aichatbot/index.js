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


