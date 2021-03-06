<?php require "_header.php" ?>
    <?php

    if(!empty($_POST)){
        
        $errors = array ();
        
        if(empty($_POST['username']) || !preg_match('/^[a-zA-Z0-9_]+$/', $_POST['username'])){
            $errors['username'] = "Votre pseudo n'est pas valide (alphanumérique)";
        } else{
            $user = $DB->query('SELECT idClient FROM Client WHERE username =:var', array('var' =>$_POST['username']));
            if($user){
                $errors['username'] = "Ce pseudo est déjà prit";
            }
        }
        
        if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $errors['email'] = "Votre email est invalide";
        }else{
            $email = $DB->query('SELECT mailClient FROM Client WHERE mailClient =:var', array('var' =>$_POST['email']));
            if($email){
                $errors['email'] = "Un compte avec cette adresse mail existe déjà";
            }
        }
        
        if($_POST['password'] != $_POST['password2']){
            $errors['password'] = "Vos mots de passe ne concordent pas";
        }else{
            if(!preg_match("/^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$/", $_POST['password'])){
                $errors['password'] = "Votre mot de passe doit contenir au moins une lettre, un nombre et doit faire plus de 6 caractères.";
            }
        }
        
        if(empty($_POST['country'])){
            $errors['country'] = "Veuillez selectionner un pays";
        }
        
        if(empty($_POST['address']) ||!preg_match("/((^[0-9]*).?((BIS)|(TER)|(QUATER))?)?((\W+)|(^))(([a-z]+.)*)([0-9]{5})?.(([a-z\'']+.)*)$/",$_POST['address'])){
            $errors['address'] = "Veillez indiquer une adresse valide";
        }
        
        if(empty($errors)){
            $insert = $DB->insert('INSERT INTO Client SET username =:username, password =:password, adresseClient =:address, paysClient =:country, mailClient =:email');
            unset($errors);
            $_SESSION['user'] = $username;
        }
        
        echo json_encode(['errors' => $errors]);
        
    };