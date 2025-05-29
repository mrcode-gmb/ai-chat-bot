<?php
session_start();
trait Controller{
    public function __construct()
    {
        return $this->conn = new PDO("mysql:host=localhost; dbname=chat_generator", "root","");
    }
}
?>