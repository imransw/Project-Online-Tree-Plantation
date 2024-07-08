<?php
session_start();
if(session_destroy()) // Destroying All Sessions
{
header("Location: sellerlogin.php"); // Redirecting To Home Page
}
?>