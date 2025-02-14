<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST["nama"];
    $jabatan = $_POST["jabatan"];
    $gaji = $_POST["gaji"];
    $id_departemen = $_POST["id_departemen"];

    $query = "INSERT INTO pegawai (nama, jabatan, gaji, id_departemen) VALUES ('$nama', '$jabatan', '$gaji', '$id_departemen')";

    if (mysqli_query($conn, $query)) {
        echo "Pegawai berhasil ditambahkan!";
    } else {
        echo "Gagal menambahkan pegawai: " . mysqli_error($conn);
    }
}
?>
