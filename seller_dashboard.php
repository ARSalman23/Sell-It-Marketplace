<?php
include('header.php');
if (!isset($_SESSION['seller_id'])) {
    header('Location: login.php');
    exit;
}
require_once 'database/DBController.php';
$db = new DBController();
$seller_id = $_SESSION['seller_id'];
$message = '';

// Handle Add Product
if (isset($_POST['add_product'])) {
    $name = $db->con->real_escape_string(trim($_POST['item_name']));
    $brand = $db->con->real_escape_string(trim($_POST['item_brand']));
    $price = floatval($_POST['item_price']);
    $image = $db->con->real_escape_string(trim($_POST['item_image']));
    $cat = isset($_POST['item_catagory']) ? $db->con->real_escape_string(trim($_POST['item_catagory'])) : '';
    $sql = "INSERT INTO product (item_brand, item_name, item_price, item_image, item_catagory, seller_id) VALUES ('$brand', '$name', $price, '$image', '$cat', $seller_id)";
    if ($db->con->query($sql)) {
        $message = '<div class="alert alert-success">Product added successfully.</div>';
    } else {
        $message = '<div class="alert alert-danger">Failed to add product.</div>';
    }
}
// Handle Delete Product
if (isset($_POST['delete_product'])) {
    $item_id = intval($_POST['item_id']);
    $db->con->query("DELETE FROM product WHERE item_id=$item_id AND seller_id=$seller_id");
}
// Handle Update Product
if (isset($_POST['update_product'])) {
    $item_id = intval($_POST['item_id']);
    $name = $db->con->real_escape_string(trim($_POST['item_name']));
    $brand = $db->con->real_escape_string(trim($_POST['item_brand']));
    $price = floatval($_POST['item_price']);
    $image = $db->con->real_escape_string(trim($_POST['item_image']));
    $cat = isset($_POST['item_catagory']) ? $db->con->real_escape_string(trim($_POST['item_catagory'])) : '';
    $sql = "UPDATE product SET item_brand='$brand', item_name='$name', item_price=$price, item_image='$image', item_catagory='$cat' WHERE item_id=$item_id AND seller_id=$seller_id";
    if ($db->con->query($sql)) {
        $message = '<div class="alert alert-success">Product updated successfully.</div>';
    } else {
        $message = '<div class="alert alert-danger">Failed to update product.</div>';
    }
}
// Get seller's products
$products = [];
$res = $db->con->query("SELECT * FROM product WHERE seller_id=$seller_id");
if ($res && $res instanceof mysqli_result) {
    while ($row = $res->fetch_assoc()) {
        $products[] = $row;
    }
}
// Calculate total products and income
$total_products = count($products);
$total_income = 0;
foreach ($products as $p) {
    $total_income += isset($p['item_price']) ? $p['item_price'] : 0;
}
?>
<div class="container py-5">
    <h2>Seller Dashboard</h2>
    <p>Welcome, <b><?php echo htmlspecialchars($_SESSION['seller_name']); ?></b></p>
    <?php if ($message) echo $message; ?>
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Total Products</h5>
                    <p class="card-text" style="font-size:2rem;"><?php echo $total_products; ?></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Estimated Income</h5>
                    <p class="card-text" style="font-size:2rem;">$<?php echo number_format($total_income,2); ?></p>
                </div>
            </div>
        </div>
    </div>
    <h4>Add Product</h4>
    <form method="POST" class="mb-4">
        <div class="form-row">
            <div class="form-group col-md-3">
                <input type="text" class="form-control" name="item_name" placeholder="Product Name" required>
            </div>
            <div class="form-group col-md-2">
                <input type="text" class="form-control" name="item_brand" placeholder="Brand" required>
            </div>
            <div class="form-group col-md-2">
                <input type="number" step="0.01" class="form-control" name="item_price" placeholder="Price" required>
            </div>
            <div class="form-group col-md-3">
                <input type="text" class="form-control" name="item_image" placeholder="Image URL or path" required>
            </div>
            <div class="form-group col-md-2">
                <input type="text" class="form-control" name="item_catagory" placeholder="Category">
            </div>
        </div>
        <button type="submit" name="add_product" class="btn btn-primary">Add Product</button>
    </form>
    <h4>Your Products</h4>
    <table class="table table-bordered table-hover">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Brand</th>
                <th>Price</th>
                <th>Category</th>
                <th>Image</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <?php if (count($products) > 0): ?>
            <?php foreach ($products as $prod): ?>
                <tr>
                    <form method="POST">
                    <td><?php echo isset($prod['item_id']) ? $prod['item_id'] : ''; ?><input type="hidden" name="item_id" value="<?php echo isset($prod['item_id']) ? $prod['item_id'] : ''; ?>"></td>
                    <td><input type="text" name="item_name" value="<?php echo isset($prod['item_name']) ? htmlspecialchars($prod['item_name']) : ''; ?>" class="form-control" required></td>
                    <td><input type="text" name="item_brand" value="<?php echo isset($prod['item_brand']) ? htmlspecialchars($prod['item_brand']) : ''; ?>" class="form-control" required></td>
                    <td><input type="number" step="0.01" name="item_price" value="<?php echo isset($prod['item_price']) ? $prod['item_price'] : ''; ?>" class="form-control" required></td>
                    <td><input type="text" name="item_catagory" value="<?php echo isset($prod['item_catagory']) ? htmlspecialchars($prod['item_catagory']) : ''; ?>" class="form-control"></td>
                    <td><input type="text" name="item_image" value="<?php echo isset($prod['item_image']) ? htmlspecialchars($prod['item_image']) : ''; ?>" class="form-control"></td>
                    <td>
                        <button type="submit" name="update_product" class="btn btn-sm btn-info mb-1">Update</button>
                        <button type="submit" name="delete_product" class="btn btn-sm btn-danger" onclick="return confirm('Delete this product?');">Delete</button>
                    </td>
                    </form>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr><td colspan="7" class="text-center">No products found.</td></tr>
        <?php endif; ?>
        </tbody>
    </table>
</div>
<?php include('footer.php'); ?> 