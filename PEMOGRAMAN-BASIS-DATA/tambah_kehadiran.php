<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pegawai = $_POST["id_pegawai"];
    $tanggal = $_POST["tanggal"];
    $status = $_POST["status"];
    
    //  total_hadir berdasarkan status
    $total_hadir = ($status == "Hadir") ? 1 : 0;

    // Simpan ke database
    $query = "INSERT INTO kehadiran (id_pegawai, tanggal, status, total_hadir) 
              VALUES ('$id_pegawai', '$tanggal', '$status', '$total_hadir')";

    if (mysqli_query($conn, $query)) {
        echo "Kehadiran berhasil ditambahkan!";
    } else {
        echo "Gagal menambahkan kehadiran: " . mysqli_error($conn);
    }
}
?>
