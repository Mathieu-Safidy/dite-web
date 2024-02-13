<?php 
	include('fonction.php');
	$quant = $_POST['quantite'];
	$id = $_POST['idParcelle'];
	$reponse=[];
	if (checkQuant($id,$quant)) {
		$reponse=array(
            'success'=>true,
            'type'=>"quantCheck",
            'message'=>" "
        );
	}else{
		$reponse=array(
            'success'=>false,
            'type'=>"quantCheck",
            'message'=>"Quantite insufisant"
        );
	}
	echo json_encode($reponse);

 ?>