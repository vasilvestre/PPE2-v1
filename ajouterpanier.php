<?php
require '_header.php';
$json = array('error' => TRUE);
if(isset($_GET['id'])){
    $product = $DB->query('SELECT idProduit FROM Produit WHERE idProduit=:id', array('id' => $_GET['id']));
    if(empty($product)){
        $json['message'] = "Ce produit n'existe pas";
    }
    $panier->ajouter($product[0]->idProduit);
    $json['error'] = false;
    $json['total'] = $panier->total();
    $json['count'] = $panier->count();
    $json['message'] = 'Produit ajouté au panier';
}else{
    $json['message'] = "Vous n'avez pas sélectionné de produit à ajouter au panier";
}
echo json_encode($json);
?>
