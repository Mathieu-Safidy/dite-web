// window.addEventListener("load", function () {
  var form = document.getElementById("myForm");
  ////////////////////////////////////////////////


 /* function sendData() {
    var xhr; 
    try {  xhr = new ActiveXObject('Msxml2.XMLHTTP');   }
    catch (e) 
    {
        try {   xhr = new ActiveXObject('Microsoft.XMLHTTP'); }
        catch (e2) 
        {
           try {  xhr = new XMLHttpRequest();  }
           catch (e3) {  xhr = false;   }
         }
    }
  

    // Liez l'objet FormData et l'élément form
    var formData = new FormData(form);

    // Définissez ce qui se passe si la soumission s'est opérée avec succès
    var response = {
      'success':'false'
    };
    xhr.addEventListener("load", function(event) {
      $msg=(event.target.responseText!="")?event.target.responseText:"OK";
      response = JSON.parse($msg);
      var text = response.message;
      document.getElementById("errorPass").textContent = text;
    });
    xhr.onreadystatechange  = function() 
    { 
      if(xhr.readyState !== 4){
        if(document.getElementById("loading")===null){
          var gify = document.createElement('img');
          gify.src='../assests/module/icons8-spinner.gif';
          gify.id='loading';
          document.body.appendChild(gify);
        }
      }else{
        if(xhr.status  == 200) {
          console.log(response.success);
          if (response.success) {
            if (response.type=="admin") {window.location.href = "../pages/admin.php";}
            else{
              window.location.href = "../pages/acceuil.php?id="+response.id;
            }
          }
        }
        if(document.getElementById("loading")!==null){
          document.body.removeChild(document.getElementById("loading"));
        }
      }
    }
    // Definissez ce qui se passe en cas d'erreur
    xhr.addEventListener("error", function(event) {
      alert('Oups! Quelque chose s\'est mal passé.');
    });
    
    // Configurez la requête
    xhr.open("POST", "../inc/traiteLogin.php");
    console.log("traiteLogin");
    
    // Les données envoyées sont ce que l'utilisateur a mis dans le formulaire
    xhr.send(formData);
  }
*/

  
///////////////////////////////////////////////////////////////////////////////////////

  function sendDataPageLog() {
    var xhr; 
    try {  xhr = new ActiveXObject('Msxml2.XMLHTTP');   }
    catch (e) 
    {
        try {   xhr = new ActiveXObject('Microsoft.XMLHTTP'); }
        catch (e2) 
        {
           try {  xhr = new XMLHttpRequest();  }
           catch (e3) {  xhr = false;   }
         }
    }
  

    // Liez l'objet FormData et l'élément form
    var formData = new FormData(form);
    xhr.addEventListener("load", function(event) {
      $msg=(event.target.responseText!="")?event.target.responseText:"OK";
      var response = JSON.parse($msg);
      var text = response.message;
      var script = "";
      if(document.getElementById("error")!==null){
        script = document.getElementById("error");
      }else{
        script = document.createElement('script');
        script.id = 'error';
      }
      
      if(response.success===false){
        script.textContent = text;
        
      }
      // document.head.appendChild(script);
      if(response.type == "erreurName"){
        document.getElementById("errorMail").textContent = text;
        if(response.success === true){
          document.getElementById("errorMail").textContent = '';
        }
  
      // }else if(response.type == "erreurMdp"){
      //   document.getElementById("errorMail").textContent = '';
      //   document.getElementById("errorPass").textContent = text;
      //   if(response.success === true){
      //     document.getElementById("errorPass").textContent = '';
      //   }
      }
    });

    // Definissez ce qui se passe en cas d'erreur
    xhr.addEventListener("error", function(event) {
      alert('Oups! Quelque chose s\'est mal passé.');
    });

    // Configurez la requête
    xhr.open("POST", "../inc/login2.php");
    console.log("login2");
    // Les données envoyées sont ce que l'utilisateur a mis dans le formulaire
    xhr.send(formData);
  }

  


// }
// );