<?php
include("dbcon.php");

$personName = $personId = $personNationality = $expiry = "" ;
$personNameErr = $personIdErr = $personNationalityErr = $expiryErr = "";

if(isset($_POST['addPerson'])){
    $personName = $_POST['custName'];
    $personId = $_POST['custID'];
    $personNationality = $_POST['custNationality'];
    $expiry = $_POST['custPassportExpiry'];

    if(empty($personName)){
        $personNameErr = "Person Name is Required";
    }

    if(empty($personId) || $personId<0){
        $personIdErr = "Person Id is Required";
    }

    if(empty($personNationality)){
        $personNationalityErr = "Person Nationality is Required";
    }

    $minDate = date('Y-m-d', strtotime('+15 days'));
    if(empty($expiry) || $expiry <= $minDate){
        $expiryErr = "Passport must be valid for more than 15 days";
    }

    if(empty($personNameErr) && empty($personIdErr) && empty($personNationalityErr) && empty($expiryErr) ){
        $query = $pdo->prepare("insert into customers (Customer_ID, Name, Nationality) values (:id, :name, :nationality)");
        $query->bindParam("name", $personName);
        $query->bindParam("id", $personId);
        $query->bindParam("nationality", $personNationality);
        $query->execute();

        $q2 = $pdo->prepare("INSERT INTO passports (Customer_ID, Passport_Expiry) VALUES (:id, :passExpiry)");
        $q2->bindParam(':id',         $personId);
        $q2->bindParam(':passExpiry', $expiry);
        $q2->execute();
        echo "<script>alert('data added');location.assign('../displayCustomers.php')</script>";
    }
    else {
        echo "<script>alert('exception alert: data is invalid');location.assign('../customerUI.php')</script>";
    }
}

if(isset($_POST['bookFlight'])){
    $personId = $_POST['custID'];
    $baggage = $_POST['baggageWt'];
    $flightId = $_POST['flightId'];

    $personIdErr="";
    
    if(empty($personId) || $personId < 0 || $baggage<0){
        $personIdErr = "Person Id is Required";
    }

    if(empty($personIdErr)){
        $query = $pdo->prepare("INSERT INTO ticket (Customer_ID) VALUES (:id)");
        $query->bindParam("id", $personId);
        $query->execute();
        $ticketId = $pdo->lastInsertId();

        $query = $pdo->prepare("INSERT INTO baggage (Weight) VALUES (:weight)");
        $query->bindParam("weight", $baggage);
        $query->execute();
        $baggageId = $pdo->lastInsertId();

        $query = $pdo->prepare("INSERT INTO recordstable (Ticket_ID, Flight_ID, Baggage_ID) VALUES (:tid, :fid, :bid)");
        $query->bindParam("tid", $ticketId);
        $query->bindParam("fid", $flightId);
        $query->bindParam("bid", $baggageId);
        $query->execute();

        echo "<script>alert('data added');location.assign('../displayBookings.php')</script>";
    }
    else {
        echo "<script>alert('exception alert: data is invalid');location.assign('../customerUI.php')</script>";
    }
}

if(isset($_POST['updatePerson'])){ 
    $personId = $_POST['custID'];
    $personName = $_POST['custName'];
    $personNationality = $_POST['custNationality'];
    $expiry = $_POST['custPassportExpiry'];

    $personErr = $expiryErr = "";

    if(empty($personId) || $personId < 0){
        $personErr = "Person details are Required";
    }

    $minDate = date('Y-m-d', strtotime('+15 days'));
    if(empty($expiry) || $expiry <= $minDate){
        $expiryErr = "Passport must be valid for more than 15 days";
    }

    if(empty($personErr) && empty($expiryErr)){
        $query = $pdo->prepare("UPDATE Customers SET Name=:name, Nationality= :nationality  WHERE Customer_ID= :id");
        $query->bindParam("name", $personName);
        $query->bindParam("id", $personId);
        $query->bindParam("nationality", $personNationality);          
        $query->execute();

        $q2 = $pdo->prepare("UPDATE Passports SET Passport_Expiry = :exp WHERE Customer_ID= :id");
        $q2->bindParam("exp", $expiry);
        $q2->bindParam("id", $personId);
        $q2->execute();
        echo "<script>alert('data updated in customers and passports');location.assign('../displayCustomers.php')</script>";
    } 
    else {
        echo "<script>alert('exception alert: data is invalid');location.assign('../displayCustomers.php')</script>";
    } 
}
?>