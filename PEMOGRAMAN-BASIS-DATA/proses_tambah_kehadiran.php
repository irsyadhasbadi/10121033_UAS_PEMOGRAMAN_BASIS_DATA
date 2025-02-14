<?php
include 'config.php';

if (isset($_POST['submit'])) {
    $id_pegawai = $_POST['id_pegawai'];
    $tanggal = $_POST['tanggal'];
    $status = $_POST['status'];

    if (empty($id_pegawai) || empty($tanggal) || empty($status)) {
        die("Error: Semua data harus diisi!");
    }

    $query = "INSERT INTO kehadiran (id_pegawai, tanggal, status) VALUES ('$id_pegawai', '$tanggal', '$status')";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Data kehadiran berhasil ditambahkan!'); window.location.href='kehadiran.php';</script>";
    } else {
        echo "Error Query: " . mysqli_error($conn);
    }
}
?>
