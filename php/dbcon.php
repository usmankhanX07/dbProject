<?php
    $server="mysql:host=localhost;dbname=dbProject";
    $user="root";
    $pass="";
    try {
        $pdo = new PDO($server, $user, $pass);
        $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        echo "Connected";
    }catch(PDOException $e){
        echo "Connection failed. ". $e->getMessage();
    }
?>