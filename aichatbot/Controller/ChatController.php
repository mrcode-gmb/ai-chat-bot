<?php

session_start();
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');

// Decode incoming JSON
$data = json_decode(file_get_contents("php://input"), true);

// Fallback logic for chat_id
$chat_id = $data['chat_id'] ?? $_SESSION['chat_id'] ?? uniqid('chat_');
$_SESSION['chat_id'] = $chat_id;

$user_message = $data['user_message'] ?? '';
$bot_reply = $data['bot_reply'] ?? '';
$user_id = $_SESSION['id'] ?? null;

// DB connection
$conn = new mysqli('localhost', 'root', '', 'chat_generator');
if ($conn->connect_error) {
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}

if (!$user_id || !$user_message || !$bot_reply) {
    echo json_encode(["error" => "Missing required data"]);
    exit;
}

// Check if it's the first message in the chat
$stmt = $conn->prepare("SELECT COUNT(id) as message_count FROM chats WHERE chat_id = ?");
$stmt->bind_param("s", $chat_id);
$stmt->execute();
$result = $stmt->get_result();
$message_count = $result->fetch_assoc()['message_count'];
$stmt->close();

if ($message_count === 0) {
    // Update chat_group table with a title
    $title = $bot_reply;
    $stmt = $conn->prepare("UPDATE chat_group SET first_message = ? WHERE chat_id = ?");
    $stmt->bind_param("ss", $title, $chat_id);
    $stmt->execute();
    $stmt->close();
}

// Prepare and execute insert
$stmt = $conn->prepare("INSERT INTO chats (user_id, chat_id, user_message, bot_reply) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $user_id, $chat_id, $user_message, $bot_reply);
$success = $stmt->execute();
$stmt->close();
$conn->close();

if ($success) {
    echo json_encode(["success" => true, "chat_id" => $chat_id]);
} else {
    echo json_encode(["error" => "Failed to insert chat"]);
}
?>