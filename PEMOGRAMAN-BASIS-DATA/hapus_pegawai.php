<?php
include 'config.php';


if (!isset($_GET["id"]) || !is_numeric($_GET["id"])) {
    $id = isset($_GET["id"]) ? $_GET["id"] : "NULL";
    die("❌ Error: ID Pegawai tidak valid. ID yang diterima: " . $id);
}

$id = $_GET["id"];

// Hapus data pegawai dari IDnya
$query = "DELETE FROM pegawai WHERE id_pegawai = $id";

if (mysqli_query($conn, $query)) {
    echo "<script>alert('Data berhasil dihapus!'); window.location='index.html';</script>";
} else {
    echo "❌ Gagal menghapus data: " . mysqli_error($conn);
}
?>
