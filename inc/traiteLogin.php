<?php
    include "fonction.php";
    session_start();
    $name = $_POST["mail"];
    $passwd = $_POST["mdp"];
    $type=$_POST["type"];
   confirm_login($name,$passwd);
?>