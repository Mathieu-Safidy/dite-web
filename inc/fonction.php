<?php

    include 'connect.php';

function defaultUser($type){
    $data=array();
    if ($type=="admin") {
        $data['mail']="admin";
        $data['mdp']="admin";
    }
    else{
        $data['mail']="user";
        $data['mdp']="user";
    }
    return $data;
}
function getNomCate($id)
{
     $sql = "select nom from v_categorie where idCate = '".$id."'";
    return mysqli_fetch_assoc(mysqli_query(Connect(),$sql))['nom'];
}
function getNomVar($id)
{
     $sql = "select nom from v_variete where idVar = '".$id."'";
    return mysqli_fetch_assoc(mysqli_query(Connect(),$sql))['nom'];
}
function getAllInputNames() {
    $inputNames = array();
    
    // Check if the form was submitted using POST method
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        foreach ($_POST as $key => $value) {
            $inputNames[] = $key;
        }
    } 
    // Check if the form was submitted using GET method
    elseif ($_SERVER["REQUEST_METHOD"] == "GET") {
        foreach ($_GET as $key => $value) {
            $inputNames[] = $key;
        }
    }

    return $inputNames;
}

function getTable($nomTable) {
    $sql = "select * from ".$nomTable;
    $res = mysqli_query(Connect(),$sql);
    $tab = array();
    while($donnees = mysqli_fetch_assoc($res)) {
        $tab[] = $donnees;
    }
    return $tab;
}
function getTableWhere($nomTable,$stringid,$id) {
    $sql = "select * from ".$nomTable." where ".$stringid."=".$id;
    $res = mysqli_query(Connect(),$sql);
    $tab;
    while($donnees = mysqli_fetch_assoc($res)) {
        $tab = $donnees;
    }
    return $tab;
}
function tradPass($mdp) {
    $sql = "SELECT sha1('".$mdp."') as pass";
    $res = mysqli_query(Connect(),$sql);
    $data = mysqli_fetch_assoc($res);
    return $data['pass'];
}

function checkMdpLog($mail,$mdp) {
    $sql = "select * from users where mail='".$mail."'";
    $res = mysqli_query(Connect(),$sql);
    if(tradPass($mdp) == mysqli_fetch_assoc($res)['mdp']) {
        return true;
    }
    return false;
}
function checkQuant($idparcell,$qtt) {
    $sql = "select Sum(total) as somme from v_total where idParcelle = ".$idparcell;
    $res = mysqli_query(Connect(),$sql);
    $somme = mysqli_fetch_assoc($res)['somme'];

    $sql2 = "select rendement from v_rendparcelle where idParcelle = ".$idparcell;
    $res2 = mysqli_query(Connect(),$sql2);
    $rendement = mysqli_fetch_assoc($res2)['rendement'];
    
    $reste = $rendement - $somme;

    if($qtt > $reste){
        return false;
    }
        return true;
}
function checkuser($mail) {
    $sql = "select count(*) as count from users where mail='".$mail."'";
    $res = mysqli_query(Connect(),$sql);
    if(mysqli_fetch_assoc($res)['count']!=0) {
        return true;
    }
    return false;
}
function checkad($mail) {
    $sql = "select count(*) as count from admin where mail='".$mail."'";
    $res = mysqli_query(Connect(),$sql);
    if(mysqli_fetch_assoc($res)['count']!=0) {
        return true;
    }
    return false;
}
function getId($mail) {
    $sql = "select idUser from users where mail = '".$mail."'";
    return mysqli_fetch_assoc(mysqli_query(Connect(),$sql))['idUser'];
}
function checkAdmin($mail,$mdp) {
    $sql = "select * from admin where mail='".$mail."'";
    $res = mysqli_query(Connect(),$sql);
    if(tradPass($mdp) == mysqli_fetch_assoc($res)['mdp']) {
        return true;
    }
    return false;
}
function confirm_login($mail,$mdp) {
   
    if (checkAdmin($mail,$mdp)) {
        $_SESSION['id']=0;
        header("Location:../pages/admin.php");
    }
    else if(checkMdpLog($mail,$mdp)) {
        $val = getId($mail);
        $_SESSION['id']=$val;
        header("Location:../pages/acceuil.php");
    }
    else{
       header("Location:".$_SERVER['HTTP_REFERER']."&&erreur=mot de passe incorrect");
    }
}
function insertInto($tabName,$value)
{
    $values="default,'".implode("','",$value)."'";
    echo($values);
    $sql="insert into ".$tabName." values (".$values.")";
    echo($sql);
    $res = mysqli_query(Connect(),$sql);
}
function deleteFrom($tabName,$id,$date){
    $sql="insert into ".$tabName." values (default,'".$id."','".$date."')";
    $res = mysqli_query(Connect(),$sql);
}
?>