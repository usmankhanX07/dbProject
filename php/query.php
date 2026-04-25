<?php
include("dbcon.php");

$personName = $personId = $personNationality = "";
$personNameErr = $personIdErr = $personNationalityErr = "";

if(isset($_POST['addPerson'])){
    $personName = $_POST['custName'];
    $personId = $_POST['custID'];
    $personNationality = $_POST['custNationality'];

    if(empty($personName)){
        $personNameErr = "Person Name is Required";
    }

    if(empty($personId)){
        $personIdErr = "Person Id is Required";
    }

    if(empty($personNationality)){
        $personNationalityErr = "Person Nationality is Required";
    }

    if(empty($personNameErr) && empty($personIdErr) && empty($personNationalityErr)){
        $query = $pdo->prepare("insert into customers (Customer_ID, Name, Nationality) values (:id, :name, :nationality)");
        $query->bindParam("name", $personName);
        $query->bindParam("id", $personId);
        $query->bindParam("nationality", $personNationality);
        $query->execute();
        echo "<script>alert('data added');location.assign('../displayCustomers.php')</script>";

    }
}

/*if(isset($_POST['updatePerson'])){ 
    $personName = $_POST['pName']; 
    $query = $pdo->prepare("UPDATE persons SET name=:name WHERE id=:id");
    $query->bindParam("name", $personName);
    $query->bindParam("id", $_POST['personId']);
    $query->execute();
    echo "<script>alert('data updated');location.assign('select.php')</script>";
}*/
?>