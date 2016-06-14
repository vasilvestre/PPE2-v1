<?php require 'header.php'?>
        
              <!-- The justified navigation menu is meant for single line per list item.
                   Multiple lines will require custom code not provided by Bootstrap. -->
              <div class="masthead">
                <nav>
                  <ul class="nav nav-justified">
                    <li class="active"><a href="index.php"><span class="glyphicon glyphicon-home"></span> Accueil</a></li>
                    <li><a href="category.php"><span class="glyphicon glyphicon-list-alt"></span> Catégories</a></li>
                    <li><a href="login.php"><span class="glyphicon glyphicon-pencil"></span> Mon compte</a></li>
                    <li><a href="panier.php"><span class="glyphicon glyphicon-shopping-cart"></span> Panier(<?= $panier->count(); ?>)</a></li>
                  </ul>
                </nav>
              </div>
        <p>Hello world!</p>

<?php require 'footer.php'?>