<?php require "_header.php" ?>
    <?php

    if(!empty($_POST)){
        
        $errors = array ();

        if(!empty($_POST['login']) && !empty($_POST['password'])){
            $user = $DB -> connect('SELECT * FROM Client WHERE username =:login OR mailClient =:login', array('login' => $_POST['login']));

            if(password_verify($_POST['password'], $user->password)){
                if(!isset($_SESSION)){
                    session_start();
                }
                $_SESSION['auth'] = true;
                $_SESSION['user'] = $user;
                unset($errors);
            }else{
                $errors['login'] = "Les informations de connexion sont incorrectes";
            }
        }
        
        echo json_encode(['errors' => $errors]);
    };