window.addEventListener('load', function(){
    var bouton = document.getElementById('add4');
    bouton.addEventListener('click', function(){
        var contenu = document.getElementById('contenue');
        contenu.innerHTML = '';
        changeInner('input copy 4.html', contenu);
        // document.getElementsByClassName('lab-add').textContent = "Retour";
        // bouton.setAttribute('href', '');
        // var form = contenu.querySelector('form');
        
    });
    function changeInner(fichier,contenu){
        fetch(fichier)
        .then(response => response.text())
        .then(data => {
            contenu.innerHTML = data;
        })
        .catch(error => {
            console.error('Une erreur s\'est produite lors du chargement du formulaire :', error);
        });
    }
});