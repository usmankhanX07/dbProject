<?php
include("php/query.php");
?>
<?php
$custData = [];
if(isset($_GET['c_id'])){
    $custId = $_GET['c_id'];
    $query = $pdo->prepare("SELECT * FROM Customers WHERE Customer_ID = :id");
    $query->bindParam("id", $custId);
    $query->execute();
    $custData = $query->fetch(PDO::FETCH_ASSOC);
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
            <h2>Edit customer:</h2>
            <form action="php/query.php" method="post">
                <div class="m1">
                    <label for="" class="form-label">Person Name</label>
                    <input type="text" name="custName" class="form-control" value="<?php echo $custData['Name'] ?? '' ?>" aria-describedby="helpId"/>
                </div>
                <div class="m1">
                    <label for="" class="form-label">Person ID</label>
                    <input type="text" name="custID" id="" value="<?php echo $custData['Customer_ID'] ?? '' ?>" readonly class="form-control" placeholder="" aria-describedby="helpId"/>
                </div>
                <div class="m1">
                    <label for="" class="form-label">Person Nationality</label>
                    <input type="text" name="custNationality" id="" class="form-control" value="<?php echo $custData['Nationality'] ?? '' ?>"  aria-describedby="helpId"/>
                </div>
               <div class="m1">
                    <label for="" class="form-label">Person Passport Expiry</label>
                    <input type="date" name="custPassportExpiry" id="custPassportExpiry" class="form-control" placeholder="" aria-describedby="helpId"/>
                </div>
                <button name= "updatePerson" class="btn btn-primary">Edit</button>
            </form>
            <br>
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