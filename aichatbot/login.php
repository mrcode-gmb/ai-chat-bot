<?php

require_once "Controller/AuthController.php";
$new = new AuthController;
$mess = "";
if(isset($_POST['login'])){
    $email = $_POST['email'];
    $password = $_POST['password'];
    
// 
    if(!empty($email) && !empty($password)){
        $result = $new->login($email, $password);   
        if($result){

            foreach($result as $user){
                $_SESSION['id'] = $user['id'];
                $_SESSION['name'] = $user['name'];
                $_SESSION['email'] = $user['email'];
            }
            
            header("location:chat.php");
        }
    }
    else{
        $mess = "All fields must not be empty";
    }  
    
}
if(isset($_GET['mess'])){
    $mess = $_GET['mess'];
}

if(!empty($mess)){
    echo "<script>alert('".$mess."')</script>";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ai chat bot login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div>
        <form action="" method="post">
            <div class="form-head">
                <h4>Login</h4>
                <p>Login to use our generative ai</p>
            </div>
            <div class="form-body">
                <div class="form-group">
                    <label for="">Email</label>
                    <input type="email" name="email">
                </div>
                <div class="form-group">
                    <label for="">Password</label>
                    <input type="password" name="password">
                </div>
                <div class="form-group">
                    <button name="login" type="submit">Login</button>
                </div>
                <div>
                    <p>Register <a href="regiser.php">Here</a></p>
                </div>
            </div>
        </form>
    </div>
</body>
</html>