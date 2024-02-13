window.addEventListener('load', function(){
    var bouton = document.getElementById('add7');
    bouton.addEventListener('click', function(){
        var contenu = document.getElementById('contenue');
        contenu.innerHTML = '';
        changeInner('input copy 6.html', contenu);
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
    /* var bouton = document.getElementById('upd7');
    bouton.addEventListener('click', function(){
        var contenu = document.getElementById('contenue');
        contenu.innerHTML = '';
        var parent=bouton.parentNode.parentNode;
        console.log(parent);
        var colum=parent.querySelector(".idCate");
        var nom = parent.querySelector(".nom");
        var text=colum.textContent;

        changeInner('updCate.php', contenu);
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
    function mameno(classes,contenu){
        var clas = document.querySelector(classes);
        clas.value = contenu;
    }*/
});
