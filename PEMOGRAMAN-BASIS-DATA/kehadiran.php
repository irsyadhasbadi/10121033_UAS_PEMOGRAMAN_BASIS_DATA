<?php
include 'config.php';


$query = "SELECT k.id_pegawai, 
                 p.nama, 
                 k.tanggal, 
                 k.status, 
                 DATE_FORMAT(k.tanggal, '%Y-%m') AS bulan,
                 (SELECT COUNT(*) 
                  FROM kehadiran 
                  WHERE kehadiran.id_pegawai = k.id_pegawai 
                  AND DATE_FORMAT(kehadiran.tanggal, '%Y-%m') = DATE_FORMAT(k.tanggal, '%Y-%m') 
                  AND kehadiran.status = 'Hadir') AS total_hadir
          FROM kehadiran k
          JOIN pegawai p ON k.id_pegawai = p.id_pegawai
          ORDER BY k.id_pegawai, k.tanggal";

$result = mysqli_query($conn, $query);

$kehadiranData = [];
foreach ($result as $row) {
    
    $key = $row['id_pegawai'] . '-' . $row['bulan'];
    
    if (!isset($kehadiranData[$key])) {
        $kehadiranData[$key] = [
            "id_pegawai" => $row["id_pegawai"],
            "nama" => $row["nama"],
            "bulan" => $row["bulan"],
            "total_hadir" => $row["total_hadir"],
            "kehadiran" => []
        ];
    }

    
    $kehadiranData[$key]["kehadiran"][] = [
        "tanggal" => $row["tanggal"],
        "status" => $row["status"]
    ];
}


header('Content-Type: application/json');
echo json_encode(array_values($kehadiranData)); 
?>
