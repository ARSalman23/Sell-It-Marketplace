<?php

// require MySQL Connection
require ('../database/DBController.php');

// require Product Class
require ('../database/Product.php');

// DBController object
$db = new DBController();

// Product object
$product = new Product($db);

if (isset($_POST['itemid'])){
    $result = $product->getProduct($_POST['itemid']);
    echo json_encode($result);
}

if (isset($_POST['search_query'])) {
    $search = $db->con->real_escape_string($_POST['search_query']);
    $result = $db->con->query("SELECT item_id, item_name FROM product WHERE item_name LIKE '%$search%' LIMIT 8");
    $suggestions = array();
    while ($row = $result->fetch_assoc()) {
        $suggestions[] = $row;
    }
    echo json_encode($suggestions);
    exit;
}