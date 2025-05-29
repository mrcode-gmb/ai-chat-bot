<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$chat_id = $_GET['chat_id'] ?? null;

if (!$chat_id) {
    echo json_encode(["error" => "Chat ID is required"]);
    exit;
}

$conn = new mysqli('localhost', 'root', '', 'chat_generator');
if ($conn->connect_error) {
    echo json_encode(["error" => "Database connection failed"]);
    exit;
}

$stmt = $conn->prepare("SELECT user_message, bot_reply FROM chats WHERE chat_id = ? ORDER BY id ASC");
$stmt->bind_param("s", $chat_id);
$stmt->execute();
$result = $stmt->get_result();

$chats = [];
while ($row = $result->fetch_assoc()) {
    $chats[] = $row;
}

$stmt->close();
$conn->close();

echo json_encode($chats);
