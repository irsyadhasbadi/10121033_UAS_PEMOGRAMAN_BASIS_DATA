<?php
include 'config.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['nama'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    
    $query = "INSERT INTO pengguna (nama, email, password) VALUES (?, ?, ?)";
    $stmt = mysqli_prepare($conn, $query);

    if ($stmt) {
        mysqli_stmt_bind_param($stmt, "sss", $nama, $email, $password);
        if (mysqli_stmt_execute($stmt)) {
            $id_pengguna = mysqli_insert_id($conn);

           
            $query_pegawai = "INSERT INTO pegawai (id_pengguna, nama, jabatan, gaji, id_departemen) VALUES (?, ?, 'Staff', 3000000, 1)";
            $stmt_pegawai = mysqli_prepare($conn, $query_pegawai);

            if ($stmt_pegawai) {
                mysqli_stmt_bind_param($stmt_pegawai, "is", $id_pengguna, $nama);
                mysqli_stmt_execute($stmt_pegawai);
            }

           
            header("Location: login.html");
            exit;
        } else {
            echo "Gagal mendaftar: " . mysqli_error($conn);
        }
    } else {
        echo "Query error: " . mysqli_error($conn);
    }
}
?>
