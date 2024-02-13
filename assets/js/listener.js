window.addEventListener("load", function () {
    var nom = document.getElementById("login");
    var pswd = document.getElementById("psw");
   
    nom.addEventListener('input', function () {
        clearTimeout(500);
        if(nom.value === ''){
           document.getElementById("errorMail").textContent='';
        }
        sendDataPageLog();
    });

    pswd.addEventListener('input', function () {
        clearTimeout(500);
    if(pswd.value === ''){
       document.getElementById("errorPass").textContent='';
    }
    // sendDataPageLog();
    });

});
var button = document.getElementById("valid");
button.addEventListener("click", function(){
    sendData();
});
