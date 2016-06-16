 <?php require 'header.php'?>

            <div class="masthead">
                <nav>
                    <ul class="nav nav-justified">
                        <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                        <li class="active"><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                        <li><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                        <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier <span id="count" class="badge"><?= $panier->count(); ?></span></span></a></li>
                    </ul>
                </nav>
            </div>
            
            <?php $products = $DB->prepare('SELECT * FROM Produit WHERE idCategorie=:id'); ?>
            <?php foreach (array_chunk($products, 2, true) as $array): ?>
                <div class="border row">
                <?php foreach ($array as $product): ?>
                    <div class="border col-md-6">
                            <div class="box">
                                <div class="col-md-6">
                                    <span class="nameProduct"><?= $product->nomProduit ?></span>
                                    <br/>
                                    <span>
                                        <img src="src/img/produits/<?= $product->codeProduit ?>.jpg" class="imgProduct">
                                    </span>
                                </div>
                                <div class="col-md-6 scrollbar-inner">
                                    <p class=" descriptionProduit mCustomScrollbar"><?= $product->descriptionProduit ?></p>
                                    <?= $product->prix ?>€ TTC<a class="add addPanier" href="ajouterpanier.php?id=<?= $product->idProduit ?>">Ajouter au panier <span class="glyphicon glyphicon-plus"></span></a>
                                </div>
                             </div>
                        </div>
                <?php endforeach ?>
                </div>
            <?php endforeach;
            
require 'footer.php'?>