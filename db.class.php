<?php

class DB{
    
    private $host = 'localhost';
    private $username = 'vsilvest';
    private $password = '';
    private $database = 'ppe';
    private $db;
    
    public function __construct($host = null, $username = null, $password = null, $database = null){
        if($host != null){
            $this->host = $host;
            $this->username = $username;
            $this->password = $password;
            $this->database = $database;
        }
        
        $this->db = new PDO('mysql:host='.$this->host.';dbname='.$this->database, $this->username, $this->password, array(
            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES UTF8',
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ));
    }
    
    // public function validator($sql, $data = array()){
    //     $req = $this->db->prepare($sql);
    //     $req ->execute($data);
    //     return $req->fetch();
    // }
    
    public function insert($sql){
        $req = $this->db->prepare($sql);
        $password = password_hash($_POST['password'],PASSWORD_BCRYPT);
        $req ->execute(array(
                    ':username'=>$_POST['username'],
                    ':password'=> $password,
                    ':address'=>$_POST['address'],
                    ':country'=>$_POST['country'],
                    ':email'=>$_POST['email'],
                    ));
    }
    
    // public function connect($sql, $data = array()){
    //     $req = $this->db->prepare($sql);
    //     $req ->execute($data);
    //     return $req->fetchAll(PDO::FETCH_NUM);     
    // }
    
    public function query($sql, $data = array()){
        $req = $this->db->prepare($sql);
        $req ->execute($data);
        return $req->fetchAll(PDO::FETCH_OBJ);
    }
    
    public function connect($sql, $data = array()){
        $req = $this->db->prepare($sql);
        $req ->execute($data);
        return $req->fetch(PDO::FETCH_OBJ);
    }
    
    public function prepare($sql){
        $req = $this->db->prepare($sql);
        $req ->execute(array(
                    ':id'=>$_GET['id']
                    ));
        return $req->fetchAll(PDO::FETCH_OBJ);
    }
}