<?php
include('header.php');

$query = isset($_GET['q']) ? trim($_GET['q']) : '';
$results = [];
if ($query !== '') {
    $search = $db->con->real_escape_string($query);

    $sql = "SELECT * FROM product WHERE item_name LIKE '%$search%' OR item_brand LIKE '%$search%' OR item_catagory LIKE '%$search%'";
    
    $res = $db->con->query($sql);
    while ($row = $res->fetch_assoc()) {
        $results[] = $row;
    }
}
?>
<div class="container py-5">
    <h2>Search Results for '<?php echo htmlspecialchars($query); ?>'</h2>
    <div class="row">
        <?php if (count($results) > 0): ?>
            <?php foreach ($results as $item): ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="<?php echo $item['item_image']; ?>" class="card-img-top" alt="<?php echo htmlspecialchars($item['item_name']); ?>">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlspecialchars($item['item_name']); ?></h5>
                            <p class="card-text">Brand: <?php echo htmlspecialchars($item['item_brand']); ?></p>
                            <p class="card-text">Price: $<?php echo $item['item_price']; ?></p>
                            <a href="product.php?item_id=<?php echo $item['item_id']; ?>" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="col-12"><p>No products found.</p></div>
        <?php endif; ?>
    </div>
</div>
<?php include('footer.php'); ?> 