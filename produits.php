 <?php require 'header.php'?>

            <!-- The justified navigation menu is meant for single line per list item.
                Multiple lines will require custom code not provided by Bootstrap. -->
            <div class="masthead">
                <nav>
                    <ul class="nav nav-justified">
                        <li><a href="index.php"><span class="glyphicon glyphicon-home"> </span>Accueil</a></li>
                        <li class="active"><a href="category.php"><span class="glyphicon glyphicon-list-alt"> </span>Catégories</a></li>
                        <li><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                        <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"> </span>Panier(<span id="count"><?= $panier->count(); ?></span>)</span></a></li>
                    </ul>
                </nav>
            </div>
              
            
            <?php $products = $DB->prepare('SELECT * FROM Produit WHERE idCategorie=:id'); ?>
            <?php foreach (array_chunk($products, 2, true) as $array){
                echo '<div class="border row">';
                foreach ($array as $product){
                    echo '<div class="border col-md-6">
                            <div class="box">
                                <div class="col-md-6">
                                    <span class="nameProduct">'. $product->nomProduit. '</span>
                                    <br/>
                                    <span>
                                        <img src="src/img/produits/'. $product->codeProduit .'.jpg" class="imgProduct">
                                    </span>
                                </div>
                                <div class="col-md-6 scrollbar-inner">
                                    <p class=" descriptionProduit mCustomScrollbar">'. $product->descriptionProduit .'</p>
                                    <a class="add addPanier" href="ajouterpanier.php?id='. $product->idProduit .'">Ajouter au panier <span class="glyphicon glyphicon-plus"></span></a>
                                </div>
                             </div>
                        </div>';
                }
                echo '</div>';
            }
            
require 'footer.php'?>