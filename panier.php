<?php require 'header.php'?>

            <div class="masthead">
                <nav>
                    <ul class="nav nav-justified">
                        <li><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                        <li><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                        <li><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                        <li class="active"><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier(<span class="count"><?= $panier->count(); ?></span>)</span></a></li>
                    </ul>
                </nav>
            </div>
              
            <div class="page-header">
                <h3 style="text-align:center">Panier en cours <small>Passer au paiement</small></h3>
            </div>
            
            <div class="container containerTable">         
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nom du produit</th>
                            <th>Prix TTC</th>
                            <th>Quantitée</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $ids = array_keys($_SESSION['panier']);
                        if(empty($ids)){
                            $products = array();
                        }else{
                        $products = $DB->query('SELECT * FROM Produit WHERE idProduit IN ('.implode(',',$ids).')');
                        }
                        foreach($products as $product):
                        ?>
                        <tr>
                            <td><img src="src/img/produits/<?= $product->codeProduit ?>.jpg" class="imgPanier"></td>
                            <td><?= $product->nomProduit ?></td>
                            <td><?= number_format($product->prix,2,',',' '); ?>€</td>
                            <td><?= $_SESSION['panier'][$product->idProduit]; ?></td>
                            <td><a href="panier.php?supprimerPanier=<?= $product->idProduit; ?>">
                                  <span class="glyphicon glyphicon-trash"></span>
                                </a>
                            </td>
                        </tr>
                        <?php endforeach ?>
                    </tbody>
                    <tfoot>
                        <td colspan="5" ><p class="pull-right">Coût total : <?= number_format($panier->total(),2,',',' '); ?></p></td>
                    </tfoot>
                </table>
            </div>
              
<?php require 'footer.php'?>