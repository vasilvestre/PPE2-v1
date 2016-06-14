<?php require 'header.php'?>
              <div class="masthead">
                <nav>
                  <ul class="nav nav-justified">
                    <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                    <li class="active"><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                    <li><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                    <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier(<?= $panier->count(); ?>)</a></li>
                  </ul>
                </nav>
              </div>
              
              <div class="border row">
             <?php 
             $products = $DB->query('SELECT * FROM Categorie');
             foreach ($products as $product): ?>
                <div style="text-align:center" class="border col-sm-4">
                    <div class="box">
                    <?php 
                        echo'<h3><a href="produits.php?id='. $product->idCategorie .'">'.ucfirst($product->nomCategorie).'</a></h3>
                        <br/>
                        <a href="produits.php?id='. $product->idCategorie .'"><img class="imgCategorie" src="src/img/categories/'.$product->lien.'.jpg"/></a>';
                    ?>
                    </div>
                </div>
             <?php endforeach ?>
             </div>
<?php require 'footer.php'?>