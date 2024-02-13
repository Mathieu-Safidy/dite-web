<?php 
	include 'fonction.php';
	$tabName=$_GET['tabName'];
	$data=array();
	$inputNames=getFormInputNames($tabName);

	for ($i=1; $i <count($inputNames) ; $i++) { 
		$data[$inputNames[$i]]=$_GET[$inputNames[$i]];
	}
	$data['dateMove']=date("Y-m-d");
	insertInto($tabName,$data);
	header("Location:".$_SERVER['HTTP_REFERER']);
	exit();
?>
