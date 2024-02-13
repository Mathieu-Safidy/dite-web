<?php
    include "fonction.php";
	$tabName=$_GET['tabName'];
	$id=$_GET['id'];
	$currentDate = date("Y-m-d");
	deleteFrom($tabName,$id,$currentDate);
	header("Location:".$_SERVER['HTTP_REFERER']);
	exit();
  ?>