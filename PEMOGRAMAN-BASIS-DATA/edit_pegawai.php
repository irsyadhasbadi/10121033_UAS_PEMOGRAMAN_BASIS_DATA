<?php
include 'config.php';

if (!isset($_GET["id"]) || !is_numeric($_GET["id"])) {
    die("❌ Error: ID Pegawai tidak valid.");
}

$id = $_GET["id"];


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_pegawai = $_POST["id_pegawai"];
    $nama = mysqli_real_escape_string($conn, $_POST["nama"]);
    $jabatan = mysqli_real_escape_string($conn, $_POST["jabatan"]);
    $gaji = (int) $_POST["gaji"];
    $id_departemen = (int) $_POST["id_departemen"];

    // Query buat UPDATE data pegawai
    $query = "UPDATE pegawai SET 
                nama = '$nama', 
                jabatan = '$jabatan', 
                gaji = $gaji, 
                id_departemen = $id_departemen 
              WHERE id_pegawai = $id_pegawai";

    $result = mysqli_query($conn, $query);

    if ($result) {
        echo "<script>
                alert('✅ Data berhasil diperbarui!');
                window.location.href='index.html';
              </script>";
        exit();
    } else {
        echo "❌ Error: " . mysqli_error($conn);
    }
}

// Ambil data pegawai berdasarkan IDnya
$query = "SELECT * FROM pegawai WHERE id_pegawai = $id";
$result = mysqli_query($conn, $query);

if (!$result || mysqli_num_rows($result) == 0) {
    die("❌ Error: Data pegawai tidak ditemukan.");
}

$pegawai = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Pegawai</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="form-container">
    <h2>Edit Pegawai</h2>
    <form method="POST">
        <input type="hidden" name="id_pegawai" value="<?php echo $pegawai['id_pegawai']; ?>">

        <div class="form-group">
            <label for="nama">Nama Pegawai:</label>
            <input type="text" name="nama" value="<?php echo htmlspecialchars($pegawai['nama']); ?>" required>
        </div>

        <div class="form-group">
            <label for="jabatan">Jabatan:</label>
            <input type="text" name="jabatan" value="<?php echo htmlspecialchars($pegawai['jabatan']); ?>" required>
        </div>

        <div class="form-group">
            <label for="gaji">Gaji:</label>
            <input type="number" name="gaji" value="<?php echo $pegawai['gaji']; ?>" required>
        </div>

        <div class="form-group">
            <label for="departemen">Departemen:</label>
            <select name="id_departemen" required>
                <?php
                $departemenQuery = mysqli_query($conn, "SELECT * FROM departemen");
                while ($dept = mysqli_fetch_assoc($departemenQuery)) {
                    $selected = ($dept['id_departemen'] == $pegawai['id_departemen']) ? 'selected' : '';
                    echo "<option value='{$dept['id_departemen']}' $selected>{$dept['nama_departemen']}</option>";
                }
                ?>
            </select>
        </div>

        <div class="button-group">
            <button type="submit">Simpan Perubahan</button>
            <button type="reset">Reset</button>
        </div>
    </form>
</div>

</body>
</html>
