<?php require 'header.php'?>

<?php         
    if(!isset($_SESSION)){
        session_start();
    }
    if(!isset($_SESSION['auth'])){
        header('Location: login.php');
        exit();
    }
?>
    <div class="masthead">
        <nav>
            <ul class="nav nav-justified">
                <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                <li><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                <li class="active"><a href="myaccount.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier <span id="count" class="badge"><?= $panier->count(); ?></span></span></a></li>
            </ul>
        </nav>
    </div>

    <div class="jumbotron">
        <div class="container">
            <h1>Bienvenue <?= ucfirst($_SESSION['user']->username);?></h1>
        </div>
    </div>
    <div class="row">
        
                    <?php var_dump($_SESSION['user']) ?>
        <div class="col-sm-8 col-md-8">
            <div class="box text-center">
                <h3>Vos informations de connexion</h3>
                <table class="table account">
                    <tr>
                        <th>Nom d'utilisateur</th>
                        <th><?= $_SESSION['user']->username; ?></th>
                    </tr>
                    <tr>
                        <th>Adresse mail</th>
                        <th><?= $_SESSION['user']->mailClient; ?></th>
                    </tr>
                    <tr>
                        <th>Adresse de livraison</th>
                        <th><?= $_SESSION['user']->adresseClient; ?></th>
                    </tr>
                </table>
                <a href="logout.php" class="pull-right"><span class="label label-success">Me déconnecter</span></a>
            </div>
        </div>
        <div class="col-sm-4 col-md-4">
            fds
        </div>
    </div>

<?php require 'footer.php'?>