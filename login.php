<?php require 'header.php'?>

<?php
    if(isset($_SESSION['auth'])){
        echo '<script>window.location.href = "myaccount.php";</script>';
    }
?>

    <div class="masthead">
        <nav>
            <ul class="nav nav-justified">
                <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                <li><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                <li class="active"><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier <span id="count" class="badge"><?= $panier->count(); ?></span></span></a></li>
            </ul>
        </nav>
    </div>

    <div class="border row">
        <div style="text-align:center" class="border col-sm-6">
            <div class="boxSign">
                <h3>Inscription</h3>
                    <div class="alert alert-success" style="display:none" id="success_sign_up">
                        <p>Félicitation votre compte est crée!</p>
                    </div>
                    <div class="alert alert-danger" style="display:none" id="fail_sign_up">
                        <h4>Vous n'avez pas rempli le formulaire correctement:</h4>
                        <ul class="list-group" id="error_list">
                        </ul>
                    </div>
                <form name="register" id="signup" href="#" method="POST" action="sign_up.php">
                    <div class="form-group row">
                        <label for="email" class="col-sm-3 form-control-label">Email</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="username" class="col-sm-3 form-control-label">Nom d'utilisateur</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Nom d'utilisateur">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password" class="col-sm-3 form-control-label">Mot de passe</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Mot de passe">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="password2" class="col-sm-3 form-control-label"></label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="password2" name="password2" placeholder="Confirmer votre mot de passe">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="country" class="col-sm-3 form-control-label">Pays</label>
                        <div class="col-sm-8">
                            <select class="input-medium bfh-countries" data-country="FR" id="country" name="country"></select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="address" class="col-sm-3 form-control-label">Adresse</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="address" name="address" placeholder="00 Avenue Dupont 00000 Paris">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-8">
                          <button type="submit" class="btn btn-secondary">S'enregistrer</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div style="text-align:center" class="border col-sm-6">
            <div class="boxSign">
                <h3>Connexion</h3>
                <div class="alert alert-success" style="display:none" id="success_sign_in">
                    <p>Connetion réussite. Redirection en cours!</p>
                </div>
                <div class="alert alert-danger" style="display:none" id="fail_sign_in">
                    <h4>Les informations de connexion sont incorrectes</h4>
                </div>
                <form name="connection" href="#" method="POST" action="sign_in.php" id="signin">
                    <div class="form-group row">
                        <label for="login" class="col-sm-3 form-control-label">Email ou pseudo</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="login" name="login" placeholder="Adresse email ou pseudonyme">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-3 form-control-label">Mot de passe</label>
                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="•••••••">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-8">
                          <button type="submit" class="btn btn-secondary">Se connecter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

<?php require 'footer.php'?>