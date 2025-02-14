<?php
include 'config.php';

$query = "SELECT p.id_pegawai, p.nama, p.jabatan, p.gaji, d.nama_departemen 
          FROM pegawai p
          JOIN departemen d ON p.id_departemen = d.id_departemen";
$result = mysqli_query($conn, $query);

$data = [];
while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
}

header('Content-Type: application/json');
echo json_encode($data);
?>
