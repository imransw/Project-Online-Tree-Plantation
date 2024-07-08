<?php

include('session_s.php');

if(!isset($login_session)){
header('Location: sellerlogin.php'); 
}



$name = $conn->real_escape_string($_POST['name']);
$price = $conn->real_escape_string($_POST['price']);
$description = $conn->real_escape_string($_POST['description']);


// Storing Session
$user_check=$_SESSION['login_user1'];
$G_IDsql = "SELECT GARDENS.G_ID FROM GARDENS, SELLER WHERE GARDENS.S_ID='$user_check'";
$G_IDresult = mysqli_query($conn,$G_IDsql);
$G_IDrs = mysqli_fetch_array($G_IDresult, MYSQLI_BOTH);
$G_ID = $G_IDrs['G_ID'];

$images_path = $conn->real_escape_string($_POST['images_path']);

$query = "INSERT INTO TREE(name,price,description,G_ID,images_path) VALUES('" . $name . "','" . $price . "','" . $description . "','" . $G_ID ."','" . $images_path . "')";
$success = $conn->query($query);

if (!$success){

	?>

	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	<link rel="stylesheet" type = "text/css" href ="css/add_tree.css">
  <link rel="stylesheet" type = "text/css" href ="css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>
	<body>
	
    <button onclick="topFunction()" id="myBtn" title="Go to top">
      <span class="glyphicon glyphicon-chevron-up"></span>
    </button>
  
    <script type="text/javascript">
      window.onscroll = function()
      {
        scrollFunction()
      };

      function scrollFunction(){
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
          document.getElementById("myBtn").style.display = "block";
        } else {
          document.getElementById("myBtn").style.display = "none";
        }
      }

      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    </script>

    <nav class="navbar navbar-inverse navbar-fixed-top navigation-clean-search" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php">Tree Plantation</a>
        </div>

        <div class="collapse navbar-collapse " id="myNavbar">
          <ul class="nav navbar-nav">
            <li><a href="index.php">Home</a></li>
            <li><a href="aboutus.php">About</a></li>
            <li><a href="contactus.php">Contact Us</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <?php echo $login_session; ?> </a></li>
            <li class="active"> <a href="sellerlogin.php">SELLER CONTROL PANEL</a></li>
            <li><a href="logout_s.php"><span class="glyphicon glyphicon-log-out"></span> Log Out </a></li>
          </ul>
        </div>

      </div>
    </nav>


	<div class="container">
    <div class="jumbotron">
     <p>Kindly describe about your tree before adding tree</p>
     <p><a href="mygarden.php"> Click here </a></p>

    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
	
	</html>

	<?php
	
}
else {
	echo "SUCCESS";
	header('Location: add_tree.php');
}

$conn->close();


?>