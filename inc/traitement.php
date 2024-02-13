<?php 
	include 'fonction.php';
	$tabName=$_GET['tabName'];
	$data=array();
	$inputNames=getAllInputNames();
	var_dump($inputNames);
	for ($i=1; $i <count($inputNames) ; $i++) { 
		$data[$inputNames[$i]]=$_GET[$inputNames[$i]];
	}
	insertInto($tabName,$data);
	header("Location:".$_SERVER['HTTP_REFERER']);
	exit();
?>
