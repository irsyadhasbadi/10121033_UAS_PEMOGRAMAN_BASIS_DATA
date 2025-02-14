<?php
include 'config.php';

$query = "SELECT id_pegawai, nama FROM pegawai";
$result = mysqli_query($conn, $query);

$pegawai_list = [];
while ($row = mysqli_fetch_assoc($result)) {
    $pegawai_list[] = $row;
}

header('Content-Type: application/json');
echo json_encode($pegawai_list);
?>
