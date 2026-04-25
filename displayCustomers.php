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
            <h2>Customer database:</h2>
            <div class="table-responsive">
                <table class="custom-table">
                    <thead>
                        <tr>
                            <th width="100px">ID</th>
                            <th width="200px">Name</th>
                            <th width="200px">Nationality</th>
                            <th width="100px">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $query = $pdo->query("select * from customers");
                        $allCustomers = $query->fetchAll(PDO::FETCH_ASSOC);
                        foreach($allCustomers as $customer){
                        ?>
                        <tr>
                            <td><?php echo $customer['Customer_ID']?></td>
                            <td><?php echo $customer['Name']?></td>
                            <td><?php echo $customer['Nationality']?></td>
                            <td><a class="btn btn-sm btn-info" href="edit.php?c_id=<?php echo $customer['Customer_ID']?>">Edit</a></td>
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