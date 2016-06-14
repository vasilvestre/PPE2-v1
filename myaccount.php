<?php require 'header.php'?>

<?php         
    if(!isset($_SESSION)){
        session_start();
    }
?>
    <div class="masthead">
        <nav>
            <ul class="nav nav-justified">
                <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                <li><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                <li class="active"><a href="myaccount.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier(<span id="count"><?= $panier->count(); ?></span>)</span></a></li>
            </ul>
        </nav>
    </div>

    <div class="border row">
        
    </div>

<?php require 'footer.php'?>