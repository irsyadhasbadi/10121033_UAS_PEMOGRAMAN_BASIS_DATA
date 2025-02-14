<?php
session_start();
if (!isset($_SESSION['id_pengguna'])) {
    header("Location: login.php");
    exit;
}
?>
<h1>Selamat datang, <?php echo $_SESSION['nama']; ?>!</h1>
<a href="logout.php">Logout</a>
