/* global jQuery */
/*global location */
/*global $ */
$(document).ready(function() {
    // Lorsque je soumets le formulaire
    $('#signup').on('submit', function(e) {
        e.preventDefault(); // J'empêche le comportement par défaut du navigateur, c-à-d de soumettre le formulaire

        var $this = $(this);
 
        // Je récupère les valeurs
        var username = $('#username').val();
        var password = $('#password').val();
        var password2 = $('#password2').val();
        var address = $('#address').val();
        var country = $('#country').val();
        var email = $('#email').val();
 
        if(username === '' || password === '' || password2 === '' || address === '' || country === '' || email === '') {
            alert('Les champs doivent êtres remplis');
        } else {
            // Envoi de la requête HTTP en mode asynchrone
            $.ajax({
                url: $this.attr('action'),
                type: $this.attr('method'),
                data: {
                    username : username,
                    password : password,
                    password2 : password2,
                    address : address,
                    country : country,
                    email : email
                },
                dataType: 'json', //JSON
                success: function(json) { // Je récupère la réponse du fichier PHP
                    if(json.errors == null ){
                        document.getElementById('fail_sign_up').style.display = 'none';
                        document.getElementById('success_sign_up').style.display = '';
                        document.getElementById('signup').reset();
                    }else{
                        var ul = document.getElementById('error_list');
                        while(ul.firstChild){
                            ul.removeChild(ul.lastChild);
                        }
                        for (var key in json.errors){
                            var error = json.errors[key];
                            var li = document.createElement("li");
                            $(li).addClass("list-group-item");
                            var inside = document.createTextNode(error);
                            li.appendChild(inside);
                            ul.appendChild(li) ;
                        }
                        document.getElementById('success_sign_up').style.display = 'none';
                        document.getElementById('fail_sign_up').style.display = '';
                    }
                }
            });
        }
    });
    
    $('#signin').on('submit', function(e) {
        e.preventDefault(); // J'empêche le comportement par défaut du navigateur, c-à-d de soumettre le formulaire

        var $this = $(this);
 
        // Je récupère les valeurs
        var login = $('#login').val();
        var password = $('#pwd').val();
 
        if(login === '' || password === '') {
            alert('Les champs doivent êtres remplis');
        } else {
            // Envoi de la requête HTTP en mode asynchrone
            $.ajax({
                url: $this.attr('action'),
                type: $this.attr('method'),
                data: {
                    login : login,
                    password : password
                },
                dataType: 'json', //JSON
                success: function(json) { // Je récupère la réponse du fichier PHP
                    console.log(json);
                    if(json.errors == null ){
                        document.getElementById('fail_sign_in').style.display = 'none';
                        document.getElementById('success_sign_in').style.display = '';
                        setTimeout(function() {
                            window.location.href = "myaccount.php";
                        }, 1000);
                    }else{
                        document.getElementById('success_sign_in').style.display = 'none';
                        document.getElementById('fail_sign_in').style.display = '';
                    }
                }
            });
        }
    });
});