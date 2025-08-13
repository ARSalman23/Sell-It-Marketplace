<?php
session_start();
$message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once 'database/DBController.php';
    $db = new DBController();
    $email = $db->con->real_escape_string(trim($_POST['email']));
    $password = trim($_POST['password']);

    $sql = "SELECT * FROM seller WHERE email='$email'";
    
    $res = $db->con->query($sql);
    if ($res && $res->num_rows === 1) {
        $seller = $res->fetch_assoc();
        if (password_verify($password, $seller['password'])) {
            $_SESSION['seller_id'] = $seller['seller_id'];
            $_SESSION['seller_name'] = $seller['seller_name'];
            header('Location: index.php');
            exit;
        } else {
            $message = '<div class="alert alert-danger">Invalid password.</div>';
        }
    } else {
        $message = '<div class="alert alert-danger">No account found with that email.</div>';
    }
}
include('header.php');
?>
<div class="container py-5">
    <h2>Seller Login</h2>
    <!-- <?php if ($message) echo $message; ?> -->
    <form method="POST" class="mt-4" style="max-width: 400px;">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>
<?php include('footer.php'); ?> 