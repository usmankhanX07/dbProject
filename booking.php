<?php
include("php/query.php");
?>

<?php
$flightData = [];
if(isset($_GET['myFlight'])){
    $flightId = $_GET['myFlight'];
    $query = $pdo->prepare("SELECT * FROM flights WHERE Flight_ID = :id");
    $query->bindParam("id", $flightId);
    $query->execute();
    $flightData = $query->fetch(PDO::FETCH_ASSOC);
}
?>

<!doctype html>
<html lang="en" data-bs-theme="light">
    <head>
        <title>Title</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS v5.3.8 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
            crossorigin="anonymous"
        />
    </head>

    <body>
        <div class="container0">
            <div style="display: flex; justify-content: center; align-items: center; height:100px">
                <h2>Customer Login:</h2>
                        
            <form action="php/query.php" method="post">
                <div class="m1">
                    <label for="" class="form-label">Person ID</label>
                </div>
                 <input type="text" name="custID" id="" class="form-control" placeholder="" aria-describedby="helpId"/>
            </div>
            <div style="display: flex; justify-content: center; align-items: center; height:100px">         
                <div class="m1">
                    <label for="" class="form-label">Baggage Weight</label>
                </div>
                <input type="text" name="baggageWt" id="" class="form-control" placeholder="" aria-describedby="helpId"/>
            </div>

    <div style="display: flex; justify-content: center; align-items: center; height:100px">
        <h2>Selected flight:</h2> </div>
            <div class="container">
                <div class="table-responsive">
                    <table class="custom-table">    
                        <thead>
                            <tr>
                                <th width="50px">Flight_ID</th>
                                <th width="100px">Flight_Type</th>
                                <th width="50px">Arrival_Time</th>
                                <th width="50px">Departure_Time</th>
                                <th width="50px">Duration</th>
                                <th width="100px">Airline_Name</th>
                                <th width="100px">Aircraft_Model</th>
                                <th width="200px">Departure_Airport_Name</th>
                                <th width="200px">Arrival_Airport_Name</th>                      
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = $pdo->prepare("
                                SELECT f.*, 
                                    al.Airline_Name,
                                    ac.Model AS Aircraft_Model,
                                    dep.Airport_Name AS Departure_Airport_Name,
                                    arr.Airport_Name AS Arrival_Airport_Name
                                FROM flights f
                                JOIN airlines al ON f.Airline_ID = al.Airline_ID
                                JOIN aircrafts ac ON f.Aircraft_ID = ac.Aircraft_ID
                                JOIN airport dep ON f.Departure_Airport_ID = dep.Airport_ID
                                JOIN airport arr ON f.Arrival_Airport_ID = arr.Airport_ID
                                WHERE f.Flight_ID in (select f1.Flight_ID from flights f1 where f1.Flight_ID = :id);
                            ");
                            $query->bindParam("id", $flightId); 
                            $query->execute();    
                            $allFlights = $query->fetchAll(PDO::FETCH_ASSOC);
                            foreach($allFlights as $flight){
                            ?>
                            <tr>
                                <td><?php echo $flight['Flight_ID']?></td>
                                <td><?php echo $flight['Flight_Type']?></td>
                                <td><?php echo $flight['Arrival_Time']?></td>
                                <td><?php echo $flight['Departure_Time']?></td>
                                <td><?php echo $flight['Duration']?></td>
                                <td><?php echo $flight['Airline_Name']?></td>
                                <td><?php echo $flight['Aircraft_Model']?></td>
                                <td><?php echo $flight['Departure_Airport_Name']?></td>
                                <td><?php echo $flight['Arrival_Airport_Name']?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>  
            <div style="display: flex; justify-content: center; align-items: center; height:100px">
                                <input type="hidden" name="flightId" value="<?php echo $flightId ?? '' ?>">
            <button  name= "bookFlight" class="btn btn-primary">Book Flight</button>        
            </form>    
        </div>    
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

<style>
    .custom-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-family: sans-serif;
        font-size: 14px;
    }
    .custom-table thead {
        background-color: #343a40;
        color: white;
    }
    .custom-table th, .custom-table td {
        padding: 12px 18px;
        border: 1px solid #dee2e6;
        text-align: left;
    }
    .custom-table tbody tr:nth-child(even) {
        background-color: #f8f9fa;
    }
    .custom-table tbody tr:hover {
        background-color: #e9ecef;
    }
</style>