<?php




include('session_s.php');

if(!isset($login_session)){
header('Location: sellerlogin.php'); 
}




$cheks = implode("','", $_POST['checkbox']);
$sql = "UPDATE FOOD SET `options` = 'DISABLE' WHERE F_ID in ('$cheks')";
$result = mysqli_query($conn,$sql) or die(mysqli_error($conn));

header('Location: delete_tree.php');
$conn->close();


?>