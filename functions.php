<?php

// require MySQL Connection
require_once ('database/DBController.php');

// require Product Class
require_once ('database/Product.php');

// require Cart Class
require_once ('database/Cart.php');


// DBController object
$db = new DBController();

// Product object
$product = new Product($db);
$product_shuffle = $product->getData();

// Cart object
$Cart = new Cart($db );
