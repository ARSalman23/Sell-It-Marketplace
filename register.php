<?php
include('header.php');

$message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once 'database/DBController.php';
    $db = new DBController();

    // Ensure phone column exists (auto-migrate if missing)
    $schemaRes = $db->con->query("SELECT DATABASE() AS db");
    $schemaRow = $schemaRes ? $schemaRes->fetch_assoc() : null;
    $schema = $schemaRow && isset($schemaRow['db']) ? $db->con->real_escape_string($schemaRow['db']) : 'shopee';
    $checkCol = $db->con->query("SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='$schema' AND TABLE_NAME='seller' AND COLUMN_NAME='phone' LIMIT 1");
    if (!$checkCol || $checkCol->num_rows === 0) {
        $db->con->query("ALTER TABLE seller ADD COLUMN phone VARCHAR(20) NULL");
    }

    $seller_name = $db->con->real_escape_string(trim($_POST['seller_name']));
    $email = $db->con->real_escape_string(trim($_POST['email']));
    $phone = $db->con->real_escape_string(trim($_POST['phone']));
    $password = password_hash(trim($_POST['password']), PASSWORD_DEFAULT);

    // Check if email already exists
    $check = $db->con->query("SELECT * FROM seller WHERE email='$email'");

    if ($check && $check->num_rows > 0) {
        $message = '<div class="alert alert-danger">Email already registered.</div>';
    } else {

        $sql = "INSERT INTO seller (seller_name, email, phone, password) VALUES ('$seller_name', '$email', '$phone', '$password')";
        
        if ($db->con->query($sql)) {
            $message = '<div class="alert alert-success">Registration successful! You can now <a href=\'login.php\'>login</a>.</div>';
        } else {
            $message = '<div class="alert alert-danger">Registration failed. Please try again.</div>';
        }
    }
}
?>
<div class="container py-5">
    <h2>Register as Seller</h2>
    <?php if ($message) echo $message; ?>
    <form method="POST" class="mt-4" style="max-width: 400px;">
        <div class="form-group">
            <label for="seller_name">Seller Name</label>
            <input type="text" class="form-control" id="seller_name" name="seller_name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number</label>
            <input type="tel" class="form-control" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
<?php include('footer.php'); ?> 