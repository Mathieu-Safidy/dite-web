<?php 
    
        function Connect(){
            $bdd = NULL;
            if ($bdd == NULL) {
                $bdd = mysqli_connect("172.20.0.167 ","ETU002533","mF4Jg6ve15gT","db_p16_ETU002533");
            }
            return $bdd;
        }

?>