<?php 
    include '../inc/fonction.php';
    $type=$_GET['type'];
    $def=defaultUser($type);
    $page = ($type == "user") ? "admin" : "user";
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/custom-log.css">
    <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <div class="no-scroll ">
    <nav class="navbar ">
        <div class="container-fluid">
          <a class="navbar-brand" >
            <!-- <img src="/docs/5.0/../assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top"> -->
            <a class="btn btn-outline-light" href="login.php?type=<?php echo($page);  ?>"><?php echo($page);  ?> log</a>
          </a>
        </div>
      </nav>
    <div class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
    <div class="col-md-12">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                   <div class="card mb-3">
                        <div class="card-body back-panel">
                            <!-- title login -->
                            <div class="pt-4 pb-2">
                                <!-- <h5 class="card-title text-center pb-4 fs-4">
                                    Login page
                                </h5> -->
                                <img id="profile-img" class="profile-img-card" src="../assets/img/avatar.png" />
                            </div>
                            <!-- // -->



                            <!-- formulaire -->
                            <form id="myForm" class=" row g-3 needs-validation form-signin " action="../inc/traiteLogin.php" method="post">
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" name="mail" id="login" placeholder="" required="" value="<?php echo($def['mail']); ?>">
                                        <label for="login" >Email</label>
                                    </div>
                                    <P id="errorMail" class=""></P>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" name="mdp" id="psw" placeholder="" required="" value="<?php echo($def['mdp']); ?>">
                                        <label for="psw">Mot de passe</label>
                                    </div>
                                </div>
                                 <P id="errorPass" class=""></P>
                                <input type="hidden" name="type" value="<?php echo($type); ?> ">
                                <div class="col-12 mb-4">
                                    <button class="btn btn-primary btn-block btn-signin" type="submit" id="valid" >Login</button>
                                </div>

                            </form>
                            <!-- // -->



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="../assets/js/fonction.js"></script>
    <script src="../assets/js/listener.js" ></script>
</div>
</body>
</html>
<!-- <h1>Login page</h1>
<form id="myForm">
    <table>
        <tr>
            <td><input type="email" name="user" id="login" placeholder="email"></td><td id="errorMail" ></td>
        </tr>
        <tr>
            <td><input type="text" name="pass" id="psw" placeholder="Mot de passe" ></td><td id="errorPass" ></td>
        </tr>
        <tr>
            <td><input type="button" value="Valider" id="valid"></td>
        </tr>
    </table>
</form> -->
        