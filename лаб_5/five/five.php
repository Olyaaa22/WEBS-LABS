<?php

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "uhuidt";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$ar_result = [];
$as_clean = 0;
$as_masik ;

$id_search = isset($_POST['id_search']) ? trim($_POST['id_search']) : '';
$name_search = isset($_POST['name_search']) ? trim($_POST['name_search']) : '';

if (!empty($id_search) && !empty($name_search)) {
    
    echo ".";
} else {
   
    $ar_result = [];
    
    if (empty($id_search) && empty($name_search)) {
        
        $sql = "SELECT id, название, описание FROM болезнь";
    } elseif (!empty($id_search)) {
       
        $sql = "SELECT id, название, описание FROM болезнь WHERE id = ?";
    } else {
        
        $sql = "SELECT id, название, описание FROM болезнь WHERE название LIKE ?";
    }

    $stmt = $conn->prepare($sql);

    if (!empty($id_search)) {
        $stmt->bind_param("i", $id_search); 
    } elseif (!empty($name_search)) {
        $name_search = '%' . $name_search . '%'; 
        $stmt->bind_param("s", $name_search); 
    }

    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $ar_result[] = $row;
        }
		$as_clean = 0;
    } else {
        echo ".";
		$as_clean = 1;
    }

    $stmt->close();
}

$conn->close();

?>



<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Первое полное обследование</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  
  <body>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
  
 <div class="container-sm">
 
 
 
 
 
 
 
 
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="http://localhost">Аверия</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
	
      <ul class="navbar-nav">
	  
	  
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Записаться</a>
        </li>
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           О нас
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">О компании</a></li>
            <li><a class="dropdown-item" href="#">Принципы</a></li>
            <li><a class="dropdown-item" href="#">Вакансии</a></li>
			 <li><a class="dropdown-item" href="#">Коллектив</a></li>
			  <li><a class="dropdown-item" href="#">Новости</a></li>
			   <li><a class="dropdown-item" href="#">Сложные пациенты</a></li>
			    <li><a class="dropdown-item" href="#">Эвтаназия</a></li>
				 <li><a class="dropdown-item" href="#">Детские экскурсии</a></li>
          </ul>
        </li>
		
		
		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Услуги
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Все услуги</a></li>
            <li><a class="dropdown-item" href="#">Check-up</a></li>
            <li><a class="dropdown-item" href="#">Консультации</a></li>
          </ul>
        </li>
		
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Маркет</a>
        </li>
		
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Консультации</a>
        </li>
		
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="http://localhost/file/five.php">База знаний</a>
        </li>
		
		
		
	
		
		
		
		
		

		
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Ещё
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Доноры</a></li>
            <li><a class="dropdown-item" href="#">Аверия Курсы</a></li>
            <li><a class="dropdown-item" href="#">Аверия Поиск</a></li>
			<li><a class="dropdown-item" href="#">Конкурсы</a></li>
		    <li><a class="dropdown-item" href="#">ЛОхматая уборка</a></li>
          </ul>
        </li>
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Отзывы</a>
        </li>
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Контакты</a>
        </li>
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">8(937)081-08-50</a>
        </li>
		
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Личный кабинет</a>
        </li>
		
		 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Онлайн оплата</a>
        </li>
		
		
		
      </ul>
    </div>
  </div>
</nav>



<form method="POST">
  <div class="container text-center"> 
    <div class="row align-items-center">
      <div class="col">
        <input class="form-control form-control-sm" type="text" name="id_search" placeholder="Поиск по ID" aria-label=".form-control-sm example">
      </div>
      <div class="col">
        <input class="form-control form-control-sm" type="text" name="name_search" placeholder="Поиск по имени" aria-label=".form-control-sm example">
      </div>
      <div class="col">
        <button type="submit" class="btn btn-warning">Найти</button>
      </div>
    </div>
  </div>
</form>


  <form method="POST">
		    <div class="col">
        <button type="submit" class="btn btn-warning">Сбросить</button>
      </div>
  
	<div type="text" name="id_search"  > </div>
	<div type="text" name="name_search"  > </div>
  
   </form>







<table border="1">
        <tr>
            <th>ID</th>
            <th>Болезнь</th>
			<th>Описание</th>
        </tr>
  
  
       <?php
 //print_r($as_masik);
 ?>
    <table border="1">
        <tr>
            <th>
			<?php
			if($as_clean ==0 )
	{ 
		echo	'id';
	}
			?>
			</th>
            <th>
						<?php
			if($as_clean ==0 )
	{ 
		echo	'название';
	}
			?>
			
			
			</th>
        </tr>
	
	
        <?php
 
	if($as_clean ==0 )
	{ 

	//	var_dump($ar_result);
//
			foreach ($ar_result as $value){
			echo '<tr>';
			echo '<td>' . $value['id'] . '</td>';
			echo '<td>' . $value['название'] . '</td>';
			echo '<td>' . $value['описание'] . '</td>';
			echo '<tr>';
			}
	}
	if($as_clean ==1)
	{
		echo '<h1>' . 'Упс. Таких значений нет ' . '</h1>';
	}
        ?>
    </table>












 <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Ветеринарная клиника</a></li>
    <li class="breadcrumb-item active" aria-current="page">Check-up</li>
  </ol>
</nav>
 

 
 
 
 <div class="container text-center">
  <div class="row align-items-start">
    <div class="col">
     <div class="container text-center">
  <div class="row align-items-start">
    <div class="col">
	
	
     <a class="icon-link icon-link-hover" href="#">
 О нас
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>
	  
	     <a class="icon-link icon-link-hover" href="#">
 Личный кабинет
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>	 
	  
	  
	       <a class="icon-link icon-link-hover" href="#">
 Аверия Маркет
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>

 <a class="icon-link icon-link-hover" href="#">
 Новости
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>

 <a class="icon-link icon-link-hover" href="#">
 Консультации
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>
	  
	  
    </div>
    <div class="col">
	
	
    <a class="icon-link icon-link-hover" href="#">
 Коллектив
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>

 <a class="icon-link icon-link-hover" href="#">
 База знаний
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


 <a class="icon-link icon-link-hover" href="#">
 Аверия курсы
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


 <a class="icon-link icon-link-hover" href="#">
 Договоры
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


 <a class="icon-link icon-link-hover" href="#">
 Контакты
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


    </div>
	
	
    <div class="col">
	
	
     <a class="icon-link icon-link-hover" href="#">
 Наши принципы
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


<a class="icon-link icon-link-hover" href="#">
 ㅤㅤㅤУслугиㅤㅤㅤ
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


<a class="icon-link icon-link-hover" href="#">
 Отзывы
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


<a class="icon-link icon-link-hover" href="#">
 Партнеркая программа
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>


    </div>
  </div>
</div>
    </div>
    <div class="col">
      <a class="icon-link icon-link-hover" href="#">
 ㅤ
  <svg class="bi" aria-hidden="true"><use xlink:href="#arrow-right"></use></svg>
</a>
    </div>

  </div>
</div>
 
 
  <h3>ㅤ</h3>
 
 
 <div class="container text-center">
  <div class="row align-items-start">
    <div class="col">
      © Ветеринарная клиника «Аверия» 2024.
    </div>
    <div class="col">
      Конфиденциальность
    </div>

  </div>
</div>
 
 
 
 
 </div>
  
  
  </body>
</html>