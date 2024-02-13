<?php
include "fonction.php";
// include "fonction.php";
    $name = $_POST["mail"];
    $type= $_POST['type'];

    if (checkuser($name)) {
         $result=checkuser($name);
    }
    else{
        $result=checkad($name);
    }
    $reponse=[];
    if ($result==true || $name==='') {
        $reponse=array(
            'success'=>true,
            'type'=>"erreurName",
            'message'=>" "
        );
        // $mdp=mijeryMotdePasse($name,$passwd);
        // if ($mdp==true || $passwd==='') {
        //     $reponse=array(
        //         // 'success'=>true,
        //         // 'type'=>"erreurMdp",
        //         // 'message'=>" "
        //     );
        // }else{
        //     // $reponse=array(
        //     //     'success'=>$mdp,
        //     //     'type'=>"erreurMdp",
        //     //     'message'=>"mot de passe invalide"
        //     // );
        // }
    }else{
        $reponse=array(
            'success'=>$result,
            'type'=>"erreurName",
            'message'=>"erreur d'identifiant ou idantifiant introuvable"
        );
    }
    echo json_encode($reponse);
?>