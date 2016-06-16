 <?php require 'header.php'?>

            <!-- The justified navigation menu is meant for single line per list item.
                Multiple lines will require custom code not provided by Bootstrap. -->
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
              
            
            <?php 
                $promotions = $DB->query('SELECT * FROM Promotion');
                $appliquer = $DB->query('SELECT * FROM Appliquer');
                $i = 0;
                foreach($promotions as $promotion){
                    $expiration = new DateTime($promotion->dateDebut);
                    $expiration->add(new DateInterval('P'. $appliquer[$i]->nombreSemaine .'W'));
                    $today = new DateTime(date('Y-m-d'));
                    if($promotion->dateDebut > $today){
                        $status = NULL;
                    }else if($expiration <= $today){
                        $destructJoin = $DB->delete('DELETE FROM `ppe`.`Appliquer` WHERE `Appliquer`.`idPromotion` ='. $promotion->idPromotion .'');
                        $destructProm = $DB->delete('DELETE FROM `ppe`.`Promotion` WHERE `Promotion`.`idPromotion` = '. $promotion->idPromotion .'');
                    }else{
                        $products = $DB->query('SELECT * FROM Produit WHERE idCategorie= :id',array(
                            'id' => $appliquer[$i]->idCategorie
                        )); ?>
                        <div class="page-header text-center">
                        <?php if($appliquer[$i]->nombreSemaine == 1): ?>
                            <h1>-<?= $promotion->taux ?> CETTE SEMAINE SEULEMENT!</h1>
                        <?php elseif($appliquer[$i]->nombreSemaine == 4): ?>
                            <h1>-<?= $promotion->taux ?> TOUT CE MOIS CI!</h1>
                        <?php endif ?>
                        </div>
                        <?php foreach (array_chunk($products, 2, true) as $array):?>
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
                                        <?= $prix = $product->prix - ($product->prix * $promotion->taux /100) ?>€ TTC!<a class="add addPanier" href="ajouterpanier.php?id=<?= $product->idProduit ?>">Ajouter au panier <span class="glyphicon glyphicon-plus"></span></a>
                                    </div>
                                </div>
                                </div>
                            <?php endforeach ?>
                            </div>
                        <?php endforeach;
                    $i++;
                    }
                    if($status = NULL){
                        echo "Il n'existe pas de promotion actuellement.. redirection en cours !";
                        
                    }
                }
            
require 'footer.php' ?>