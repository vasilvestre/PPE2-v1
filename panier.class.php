<?php

class panier{
    
    private $DB;
    
    public function __construct($DB){
        if(!isset($_SESSION)){
            session_start();
        }
        if(!isset($_SESSION['panier'])){
            $_SESSION['panier'] = array();
        }
        $this->DB = $DB;
        if(isset($_GET['supprimerPanier'])){
            $this->supprimer($_GET['supprimerPanier']);
        }
    }
    
    public function count(){
        return array_sum($_SESSION['panier']);
    }
    
    public function total(){
        $total = 0;
        $ids = array_keys($_SESSION['panier']);
            if(empty($ids)){
                $products = array();
            }else{
                $products = $this->DB->query('SELECT * FROM Produit WHERE idProduit IN ('.implode(',',$ids).')');
            }
        foreach($products as $product ){
            $total += $product->prix * $_SESSION['panier'][$product->idProduit];
        }
        return $total;
    }
    
    public function ajouter($product_id){
        if(isset($_SESSION['panier'][$product_id])){
            $_SESSION['panier'][$product_id]++;
        }else{
            $_SESSION['panier'][$product_id] = 1;
        }
    }
    
    public function supprimer($product_id){
        unset($_SESSION['panier'][$product_id]);
    }
}