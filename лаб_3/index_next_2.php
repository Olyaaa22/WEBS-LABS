<?php
$my_email = "ooooolka@vk.com";
$my_pass = "2003";

$user_email = "";
 $user_pass ="" ;
 session_start();
 
 
if(isset($_GET["logout"]) && $_GET['logout']== "yes")
{
	$status=1;
	
	//unset($_SESSION['username']);
	//unset($_SESSION['userpass']);
	//session_destroy();
		$_SESSION['username']=" " ;
	$_SESSION['userpass']=" ";
}



if(isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"] != "")
{
	
	
	$user_email = $_POST["email"];
	$user_pass = $_POST["pass"];
	
	$_SESSION['username']=$user_email ;
	$_SESSION['userpass']=$user_pass;


}
	print($user_pass);
	var_dump($_SESSION);

?>





<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
  
  
  <div class="container text-center">
  <div class="row">
  
 
  <?php if($_SESSION['userpass']!=$my_pass): ?>
  <?php if($my_pass!=$user_pass && $user_email !=""): ?>
  <p>Неверный пароль</p>
   <?php endif; ?>
   
  <form class="row g-3" action="" method="POST">
  
<div class="col-auto">
  
  <input name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
</div>
  
  <div class="col-auto">
    <label for="inputPassword2" class="visually-hidden">Password</label>
    <input name="pass" type="password" class="form-control" id="inputPassword2" placeholder="Password">
  </div>
  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3">Confirm identity</button>
  </div>
</form>
  
    </div>
</div>
<?php endif; ?>

 
 
 
<?php if($my_pass==$_SESSION['userpass']): ?>
 
	<p>Вы успешно авторизировались</p>
  <div class="col-auto">
    <a	href="?logout=yes" class="btn btn-outline-primary"	> Выход</a>
  </div>
	





 <?php endif; ?>
 

 


  </body>
</html>