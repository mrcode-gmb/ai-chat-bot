<?php

// use Controller\Controller;

require_once "Controller.php";



class AuthController{

    use Controller;
    public function store($name, $email, $password)
    {
        $insert = "INSERT INTO user(name, email,pass) VALUE(?,?,?)";
        $query = $this->conn->prepare($insert);
        $query->execute([$name, $email, $password]);
        return true;
    }

    public function login($email, $password)
    {
        $select = "SELECT * FROM user WHERE email = ? AND pass =?";
        $query = $this->conn->prepare($select);
        $query->execute([$email, $password]);
        return $query;
    }

    public function getMessageID()
    {
        $select = "SELECT * FROM chat_group WHERE user_id = ? ORDER BY id DESC";
        $query = $this->conn->prepare($select);
        $query->execute([$_SESSION['id']]);
        return $query;
    }
}