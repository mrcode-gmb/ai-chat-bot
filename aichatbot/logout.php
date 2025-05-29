<?php
session_start();

if(isset($_SESSION['id'])){
    session_destroy();
    header("location:login.php?mess=Logout was successfull");
}else{

    header("location:index.php");
}