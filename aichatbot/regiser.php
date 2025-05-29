<?php
require_once "Controller/AuthController.php";
$new = new AuthController;
$mess = "";
if(isset($_POST['submit'])){
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    

    if(!empty($name) && !empty($email) && !empty($password)){
        $result = $new->store($name, $email, $password);   
        if($result){
            header("location:login.php?mess=Congratulaion your account have being successfull");
        }
    }
    else{
        $mess = "All fields must not be empty";
    }  
    
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
                <h4>Sign Up</h4>
                <p>Sign-up to use our generative ai</p>
            </div>
            <div class="form-body">
                <div class="form-group">
                    <label for="">Name</label>
                    <input type="text" name="name">
                </div>
                <div class="form-group">
                    <label for="">Email</label>
                    <input type="email" name="email">
                </div>
                <div class="form-group">
                    <label for="">Password</label>
                    <input type="password" name="password">
                </div>
                <div class="form-group">
                    <button name="submit" type="submit">Register</button>
                </div>
                <div>
                    <p>Register <a href="login.php">Here</a></p>
                </div>
            </div>
        </form>
    </div>
</body>
</html>