window.addEventListener("load",function(){
	var input_quant = document.getElementById("quantite");
	console.log(input_quant);
	var formul = document.getElementById("ceuil_form");
	input_quant.addEventListener("input",function(){
		clearTimeout(500);
		if (input_quant ==='') {

		}
		console.log(input_quant.value);
			sendQuant();
	});
	function sendQuant() {
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
    var formData = new FormData(formul);
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
      if(response.type == "quantCheck"){
        document.getElementById("errorquant").textContent = text;
        if(response.success === true){
          document.getElementById("errorquant").textContent = '';
        }
  
      }
    });

    // Definissez ce qui se passe en cas d'erreur
    xhr.addEventListener("error", function(event) {
      alert('Oups! Quelque chose s\'est mal passé.');
    });

    // Configurez la requête
    xhr.open("POST", "../inc/traite_quant.php");
    console.log("traite_quant");
    // Les données envoyées sont ce que l'utilisateur a mis dans le formulaire
    xhr.send(formData);
  }
  
})