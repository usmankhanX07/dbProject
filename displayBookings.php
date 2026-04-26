<?php
include("php/query.php");
?>

<style>
    .custom-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-family: sans-serif;
        font-size: 15px;
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
            integrity="sha384-sRI14kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
            crossorigin="anonymous"
        />
    </head>

    <body>
            <div class="container">
                <div class="table-responsive">
                    <table class="custom-table">    
                        <thead>
                            <tr>
                                <th width="50px">Ticket_ID</th>
                                <th width="100px">Customer_Name</th>
                                <th width="100px">Passport_Exp</th>
                                <th width="50px">Pilot_Name</th>
                                <th width="50px">Baggage_Weight</th>
                                <th width="50px">Duration</th>
                                <th width="100px">Airline_Name</th>
                                <th width="100px">Aircraft_Model</th>
                                <th width="200px">Departure_Airport_Name</th>
                                <th width="200px">Arrival_Airport_Name</th>   
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = $pdo->query("
                                SELECT f.*, 
                                    al.Airline_Name,
                                    ac.Model AS Aircraft_Model,
                                    dep.Airport_Name AS Departure_Airport_Name,
                                    arr.Airport_Name AS Arrival_Airport_Name,
                                    t.Ticket_ID as ZTicket_ID,
                                    B.Weight as ZWeight,
                                    Pi.Pilot_Name as ZPName,
                                    c.Name as ZCName,
                                    P.Passport_Expiry as ZPassport
                                FROM flights f
                                JOIN airlines al ON f.Airline_ID = al.Airline_ID
                                JOIN aircrafts ac ON f.Aircraft_ID = ac.Aircraft_ID
                                JOIN airport dep ON f.Departure_Airport_ID = dep.Airport_ID
                                JOIN airport arr ON f.Arrival_Airport_ID = arr.Airport_ID
                                JOIN recordsTable rt ON f.Flight_ID = rt.Flight_ID
                                JOIN ticket t ON rt.Ticket_ID = t.Ticket_ID
                                JOIN Customers c on c.Customer_ID = t.Customer_ID
                                JOIN Passports P on P.Customer_ID = C.Customer_ID
                                JOIN Pilot Pi on Pi.Pilot_ID = rt.Pilot_ID
                                JOIN Baggage B on B.Baggage_Tag_ID = rt.Baggage_ID;
                            ");                  
                            $allFlights = $query->fetchAll(PDO::FETCH_ASSOC);
                            foreach($allFlights as $flight){
                            ?>
                            <tr>
                                <td><?php echo $flight['ZTicket_ID']?></td>
                                <td><?php echo $flight['ZCName']?></td>
                                <td><?php echo $flight['ZPassport']?></td>
                                <td><?php echo $flight['ZPName']?></td>
                                <td><?php echo $flight['ZWeight']?></td>
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
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-4FKyo..."
            crossorigin="anonymous"
        ></script>
    </body>
</html>