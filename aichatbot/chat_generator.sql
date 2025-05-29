-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 12:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_generator`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id` text NOT NULL,
  `user_message` text NOT NULL,
  `bot_reply` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `chat_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id`, `user_message`, `bot_reply`, `created_at`, `chat_id`) VALUES
(1, '2', 'hi', 'Hello! How can I help you today?', '2025-05-27 11:41:47', 'qwshxsdghjas'),
(2, '2', 'const chatForm = document.getElementById(\'chat-form\'); const userInput = document.getElementById(\'user-input\'); const chatMessages = document.getElementById(\'chat-messages\');  // Replace this with your actual OpenRouter API key const API_KEY = \'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\';  chatForm.addEventListener(\'submit\', async (e) => {     e.preventDefault();     const message = userInput.value.trim();     if (!message) return;      addMessage(\'user\', message);     userInput.value = \'\';      addMessage(\'bot\', \'Typing...\');      try {         const response = await fetch(\'https://openrouter.ai/api/v1/chat/completions\', {             method: \'POST\',             headers: {                 \'Authorization\': `Bearer ${API_KEY}`,                 \'Content-Type\': \'application/json\'             },             body: JSON.stringify({                 model: \"openai/gpt-3.5-turbo\", // or any other model available to you                 messages: [{ role: \'user\', content: message }]             })         });         const data = await response.json();         const reply = data.choices[0]?.message?.content || \"Sorry, no response.\";           const postToDataBase = await fetch(\'http://localhost/aichatbot/Controller/ChatController.php\', {             method: \'POST\',             headers: {                 \'Content-Type\': \'application/json\'             },             body: JSON.stringify({                 chat_id: \"qwshxsdghjas\",                 user_message: message,                 bot_reply: reply             })         });          const result = await postToDataBase.json();         console.log(\"Chat store result:\", result);         updateLastBotMessage(reply);     } catch (error) {         updateLastBotMessage(\"An error occurred. Please try again.\");         console.error(error);     } });  function addMessage(sender, content) {     const msgDiv = document.createElement(\'div\');     msgDiv.classList.add(\'message\', sender);     msgDiv.innerHTML = `<div class=\"content\">${content}</div>`;     chatMessages.appendChild(msgDiv);     chatMessages.scrollTop = chatMessages.scrollHeight; }  function updateLastBotMessage(newContent) {     const botMessages = document.querySelectorAll(\'.message.bot .content\');     const lastBot = botMessages[botMessages.length - 1];     if (lastBot) {         lastBot.innerHTML = marked.parse(newContent); // Convert Markdown to HTML         hljs.highlightAll(); // Apply syntax highlighting to code blocks     } }   function fillInput(text) {     userInput.value = text; }', 'In this JavaScript code snippet, we have an event listener attached to the chat form which listens for the submit event. When the form is submitted, it prevents the default behavior, gets the user input message, adds it to the chat messages as a user message, and then sends a request to the OpenRouter API to get a response from a chatbot model.\n\nIf a response is received successfully, it adds the bot\'s reply to the chat messages and also saves the conversation in a local database using a POST request to a PHP file. The last bot message is updated with the new content and any errors are handled accordingly.\n\nThere are three additional functions in the code:\n1. `addMessage(sender, content)`: This function creates a new message div element with the sender and content specified and appends it to the chat messages container.\n2. `updateLastBotMessage(newContent)`: This function updates the last bot message with the new content, parses Markdown content to HTML, and applies syntax highlighting to code blocks using highlight.js.\n3. `fillInput(text)`: This function is not used in the code snippet provided but could potentially be used to fill the input field with a specific text.\n\nOverall, this code handles user input, chatbot responses, and updates the chat interface with messages while also saving the conversation in a local database.', '2025-05-27 11:44:18', 'qwshxsdghjas'),
(3, '2', 'hi', 'Hello! How can I assist you today?', '2025-05-27 11:57:38', 'qwshxsdghjas'),
(4, '1', 'qwshxsdghjas', 'Hello! How can I assist you today?', '2025-05-27 11:59:07', 'qwshxsdghjas'),
(5, '1', 'hello', 'Hello! How can I assist you today?', '2025-05-27 12:03:26', 'qwshxsdghjas'),
(6, '1', 'how about html my sir', 'HTML, or Hypertext Markup Language, is the standard markup language for creating web pages. It allows developers to structure content on a webpage using a variety of tags and attributes. HTML is essential for building websites and is commonly used alongside CSS and JavaScript to create visually appealing and interactive web pages. It is the foundation of the web and is a key skill for anyone looking to pursue a career in web development.', '2025-05-27 12:04:32', 'qwshxsdghjas'),
(7, '1', 'hi', 'Hello! How can I assist you today?', '2025-05-28 11:51:05', 'mb7vw1olzkvw7o8uhh'),
(8, '1', 'How are you', 'I\'m just a computer program, so I don\'t have emotions or feelings like humans do. But I\'m here and ready to assist you with anything you need. How can I help you today?', '2025-05-28 11:51:13', 'mb7vw1olzkvw7o8uhh'),
(9, '1', 'give a sample html code for learning', 'Sure, here is a simple HTML code for learning:\n\n```html\n<!DOCTYPE html>\n<html>\n<head>\n    <title>Sample HTML Page</title>\n</head>\n<body>\n    <h1>Welcome to my website!</h1>\n    \n    <p>This is a sample HTML page. Here is some more text to demonstrate the use of paragraphs in HTML.</p>\n    \n    <h2>Lists</h2>\n    <ul>\n        <li>Item 1</li>\n        <li>Item 2</li>\n        <li>Item 3</li>\n    </ul>\n    \n    <h2>Links</h2>\n    <p>Click <a href=\"https://www.example.com\">here</a> to visit Example.com</p>\n    \n    <h2>Images</h2>\n    <img src=\"https://www.example.com/image.jpg\" alt=\"Example Image\">\n</body>\n</html>\n```\n\nYou can save this code in a file with a `.html` extension and open it in your web browser to see the output. This code includes headings, paragraphs, lists, links, and images which are some of the basic elements in HTML.', '2025-05-28 11:57:49', 'qwshxsdghjas'),
(10, '1', '<?php session_start(); header(\'Content-Type: application/json\'); header(\'Access-Control-Allow-Origin: *\'); header(\'Access-Control-Allow-Methods: POST\');  // Decode incoming JSON $data = json_decode(file_get_contents(\"php://input\"), true);  // Fallback logic for chat_id $chat_id = $data[\'chat_id\'] ?? $_SESSION[\'chat_id\'] ?? uniqid(\'chat_\'); $_SESSION[\'chat_id\'] = $chat_id;  $user_message = $data[\'user_message\'] ?? \'\'; $bot_reply = $data[\'bot_reply\'] ?? \'\'; $user_id = $_SESSION[\'id\'] ?? null;  // DB connection $conn = new mysqli(\'localhost\', \'root\', \'\', \'chat_generator\'); if ($conn->connect_error) {     echo json_encode([\"error\" => \"Database connection failed\"]);     exit; }  if (!$user_id || !$user_message || !$bot_reply) {     echo json_encode([\"error\" => \"Missing required data\"]);     exit; }  // Prepare and execute insert $stmt = $conn->prepare(\"INSERT INTO chats (user_id, chat_id, user_message, bot_reply) VALUES (?, ?, ?, ?)\"); $stmt->bind_param(\"ssss\", $user_id, $chat_id, $user_message, $bot_reply); $success = $stmt->execute(); $stmt->close(); $conn->close();  if ($success) {     echo json_encode([\"success\" => true, \"chat_id\" => $chat_id]); } else {     echo json_encode([\"error\" => \"Failed to insert chat\"]); } ?> i want to add if send message check if is the first message create a title that can update the chat_group table base on the chat_id', 'To achieve this, you can modify the existing code to include logic that checks if the user_message is the first message in the chat. If it is the first message, you can update the chat_group table with a title based on the chat_id. Here\'s the modified code:\n\n```php\n<?php\n\nsession_start();\nheader(\'Content-Type: application/json\');\nheader(\'Access-Control-Allow-Origin: *\');\nheader(\'Access-Control-Allow-Methods: POST\');\n\n// Decode incoming JSON\n$data = json_decode(file_get_contents(\"php://input\"), true);\n\n// Fallback logic for chat_id\n$chat_id = $data[\'chat_id\'] ?? $_SESSION[\'chat_id\'] ?? uniqid(\'chat_\');\n$_SESSION[\'chat_id\'] = $chat_id;\n\n$user_message = $data[\'user_message\'] ?? \'\';\n$bot_reply = $data[\'bot_reply\'] ?? \'\';\n$user_id = $_SESSION[\'id\'] ?? null;\n\n// DB connection\n$conn = new mysqli(\'localhost\', \'root\', \'\', \'chat_generator\');\nif ($conn->connect_error) {\n    echo json_encode([\"error\" => \"Database connection failed\"]);\n    exit;\n}\n\nif (!$user_id || !$user_message || !$bot_reply) {\n    echo json_encode([\"error\" => \"Missing required data\"]);\n    exit;\n}\n\n// Check if it\'s the first message in the chat\n$stmt = $conn->prepare(\"SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?\");\n$stmt->bind_param(\"s\", $chat_id);\n$stmt->execute();\n$result = $stmt->get_result();\n$message_count = $result->fetch_assoc()[\'message_count\'];\n$stmt->close();\n\nif ($message_count === 0) {\n    // Update chat_group table with a title\n    $title = \"Chat Group \" . $chat_id;\n    $stmt = $conn->prepare(\"UPDATE chat_group SET title = ? WHERE chat_id = ?\");\n    $stmt->bind_param(\"ss\", $title, $chat_id);\n    $stmt->execute();\n    $stmt->close();\n}\n\n// Prepare and execute insert\n$stmt = $conn->prepare(\"INSERT INTO chats (user_id, chat_id, user_message, bot_reply) VALUES (?, ?, ?, ?)\");\n$stmt->bind_param(\"ssss\", $user_id, $chat_id, $user_message, $bot_reply);\n$success = $stmt->execute();\n$stmt->close();\n$conn->close();\n\nif ($success) {\n    echo json_encode([\"success\" => true, \"chat_id\" => $chat_id]);\n} else {\n    echo json_encode([\"error\" => \"Failed to insert chat\"]);\n}\n?>\n```\n\nIn this updated code, we added a query to count the number of messages in the chat with the given chat_id. If the count is 0, indicating it\'s the first message in that chat, we update the chat_group table with a title based on the chat_id.', '2025-05-28 12:02:41', 'qwshxsdghjas'),
(11, '1', 'hi', 'Hello! How can I assist you today?', '2025-05-28 12:06:36', 'mb7wdvy6hi86n7ljx9k'),
(12, '1', 'hi', 'Hello! How can I assist you today?', '2025-05-28 12:07:25', 'mb7wgv9lt3x3z80go1o'),
(13, '1', 'hi', 'Hello! How can I assist you today?', '2025-05-28 12:09:33', 'mb7wk4pyah2db7b20c'),
(14, '1', 'To achieve this, you can modify the existing code to include logic that checks if the user_message is the first message in the chat. If it is the first message, you can update the chat_group table with a title based on the chat_id. Here\'s the modified code: connect_error) { echo json_encode([\"error\" => \"Database connection failed\"]); exit; } if (!$user_id || !$user_message || !$bot_reply) { echo json_encode([\"error\" => \"Missing required data\"]); exit; } // Check if it\'s the first message in the chat $stmt = $conn->prepare(\"SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?\"); $stmt->bind_param(\"s\", $chat_id); $stmt->execute(); $result = $stmt->get_result(); $message_count = $result->fetch_assoc()[\'message_count\']; $stmt->close(); if ($message_count === 0) { // Update chat_group table with a title $title = \"Chat Group \" . $chat_id; $stmt = $conn->prepare(\"UPDATE chat_group SET title = ? WHERE chat_id = ?\"); $stmt->bind_param(\"ss\", $title, $chat_id); $stmt->execute(); $stmt->close(); } // Prepare and execute insert $stmt = $conn->prepare(\"INSERT INTO chats (user_id, chat_id, user_message, bot_reply) VALUES (?, ?, ?, ?)\"); $stmt->bind_param(\"ssss\", $user_id, $chat_id, $user_message, $bot_reply); $success = $stmt->execute(); $stmt->close(); $conn->close(); if ($success) { echo json_encode([\"success\" => true, \"chat_id\" => $chat_id]); } else { echo json_encode([\"error\" => \"Failed to insert chat\"]); } ?> In this updated code, we added a query to count the number of messages in the chat with the given chat_id. If the count is 0, indicating it\'s the first message in that chat, we update the chat_group table with a title based on the chat_id. re-update tis', 'Thank you for providing the code. I noticed that there may be a small error in the query to check if it\'s the first message in the chat. The query should be checking the count of messages in the chats table, not in the chat_group table. Here\'s the corrected code snippet:\n\n```php\n// Check if it\'s the first message in the chat\n$stmt = $conn->prepare(\"SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?\");\n$stmt->bind_param(\"s\", $chat_id);\n$stmt->execute();\n$result = $stmt->get_result();\n$message_count = $result->fetch_assoc()[\'message_count\'];\n$stmt->close();\n\nif ($message_count === 0) {\n    // Update chat_group table with a title\n    $title = \"Chat Group \" . $chat_id;\n    $stmt = $conn->prepare(\"UPDATE chat_group SET title = ? WHERE chat_id = ?\");\n    $stmt->bind_param(\"ss\", $title, $chat_id);\n    $stmt->execute();\n    $stmt->close();\n}\n\n// Continue with the rest of the code for inserting the message\n```\n\nBy making this change, the code will now correctly check if it\'s the first message in the chat based on the count of messages in the chats table and update the chat_group table accordingly.', '2025-05-28 12:22:20', 'qwshxsdghjas'),
(15, '1', 'Thank you for providing the code. I noticed that there may be a small error in the query to check if it\'s the first message in the chat. The query should be checking the count of messages in the chats table, not in the chat_group table. Here\'s the corrected code snippet:  // Check if it\'s the first message in the chat $stmt = $conn->prepare(\"SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?\"); $stmt->bind_param(\"s\", $chat_id); $stmt->execute(); $result = $stmt->get_result(); $message_count = $result->fetch_assoc()[\'message_count\']; $stmt->close();  if ($message_count === 0) {     // Update chat_group table with a title     $title = \"Chat Group \" . $chat_id;     $stmt = $conn->prepare(\"UPDATE chat_group SET title = ? WHERE chat_id = ?\");     $stmt->bind_param(\"ss\", $title, $chat_id);     $stmt->execute();     $stmt->close(); }  // Continue with the rest of the code for inserting the message By making this change, the code will now correctly check if it\'s the first message in the chat based on the count of messages in the chats table and update the chat_group table accordingly. again update it now', 'Thank you for pointing that out. Here is the updated code snippet with the correction you mentioned: \n\n```php\n// Check if it\'s the first message in the chat\n$stmt = $conn->prepare(\"SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?\");\n$stmt->bind_param(\"s\", $chat_id);\n$stmt->execute();\n$result = $stmt->get_result();\n$message_count = $result->fetch_assoc()[\'message_count\'];\n$stmt->close();\n\nif ($message_count === 0) {\n   // Update chat_group table with a title\n   $title = \"Chat Group \" . $chat_id;\n   $stmt = $conn->prepare(\"UPDATE chat_group SET title = ? WHERE chat_id = ?\");\n   $stmt->bind_param(\"ss\", $title, $chat_id);\n   $stmt->execute();\n   $stmt->close();\n}\n\n// Continue with the rest of the code for inserting the message\n```\n\nThis corrected code will now accurately check if it\'s the first message in the chat based on the count of messages in the `chats` table, and update the `chat_group` table as needed. Let me know if you need any further assistance.', '2025-05-28 12:23:42', 'qwshxsdghjas'),
(16, '1', 'hi', 'Hello! How can I assist you today?', '2025-05-28 12:28:34', 'mb7x64j3s0px4nqz4u'),
(17, '1', 'What is ai', 'AI stands for artificial intelligence, which is a branch of computer science that focuses on creating machines or systems that can perform tasks that typically require human intelligence, such as visual perception, speech recognition, decision-making, and language translation. AI technologies include machine learning, neural networks, deep learning, natural language processing, and computer vision. AI is used in a wide range of applications, including self-driving cars, virtual assistants, recommendation systems, and medical diagnoses.', '2025-05-28 12:31:59', 'mb7xcqxgtilso66tet8');

-- --------------------------------------------------------

--
-- Table structure for table `chat_group`
--

CREATE TABLE `chat_group` (
  `id` int(11) NOT NULL,
  `chat_id` varchar(100) NOT NULL,
  `user_id` text NOT NULL,
  `first_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_group`
--

INSERT INTO `chat_group` (`id`, `chat_id`, `user_id`, `first_message`) VALUES
(1, 'qwshxsdghjas', '1', 'Hello world'),
(6, 'mb7vw1olzkvw7o8uhh', '1', NULL),
(7, 'mb7wdvy6hi86n7ljx9k', '1', 'Chat Group mb7wdvy6hi86n7ljx9k'),
(8, 'mb7wgv9lt3x3z80go1o', '1', 'Chat Group mb7wgv9lt3x3z80go1o'),
(9, 'mb7wk4pyah2db7b20c', '1', 'Hello! How can I assist you today?'),
(10, 'mb7x64j3s0px4nqz4u', '1', 'Hello! How can I assist you today?'),
(11, 'mb7xcqxgtilso66tet8', '1', 'AI stands for artificial intelligence, which is a branch of computer science that focuses on creating machines or systems that can perform tasks that typically require human intelligence, such as visual perception, speech recognition, decision-making, and language translation. AI technologies include machine learning, neural networks, deep learning, natural language processing, and computer vision. AI is used in a wide range of applications, including self-driving cars, virtual assistants, recommendation systems, and medical diagnoses.'),
(12, 'mb8by5kkc6vlb3kyl7', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(199) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `pass`) VALUES
(1, 'Abubakar', 'abubakaribrahim30012@gmail.com', '1111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_group`
--
ALTER TABLE `chat_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `chat_group`
--
ALTER TABLE `chat_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(199) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
