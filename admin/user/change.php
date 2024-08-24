<?php
require_once('../database/dbhelper.php');

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = 'select * from user where id_user=' . $id;
    $user = executeSingleResult($sql);
 
?>
<!DOCTYPE html>
<html>

<head>
    <title>Sửa Thông Tin Người Dùng</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <!-- Include your form with pre-filled values here -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="../index.php">Thống kê</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="index.php">Quản lý danh mục</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../product/">Quản lý sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Quản lý giỏ hàng</a>
        </li>
    </ul>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Sửa Thông Tin Người Dùng</h2>
            </div>
            <div class="panel-body">
                <form method="POST" id="updateForm">
                    <div class="form-group">
                        <label for="name">Tên Người Dùng:</label>
                        <input required="true" type="text" class="form-control" id="name" name="name" value="<?= $user['hoten'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input required="true" type="text" class="form-control" id="username" name="username" value="<?= $user['username'] ?>">
                    </div>

                    <div class="form-group">
                        <label for="password">Mật khẩu:</label>
                        <input required="true" type="password" class="form-control" id="password" name="password" value="">
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input required="true" type="text" class="form-control" id="phone" name="phone" value="<?= $user['phone'] ?>">
                    </div>

                    <div class="form-group">
                        <label for="gmail">Gmail:</label>
                        <input required="true" type="email" class="form-control" id="gmail" name="gmail" value="<?= $user['email'] ?>">
                    </div>
                    <button type="submit" class="btn btn-success" name="submit">Cập Nhật</button>
                    <?php
                    $previous = "javascript:history.go(-1)";
                    if (isset($_SERVER['HTTP_REFERER'])) {
                        $previous = $_SERVER['HTTP_REFERER'];
                    }
                    ?>
                    <a href="<?= $previous ?>" class="btn btn-warning">Quay Lại</a>
                </form>
            </div>
        </div>
    </div>

</body>

</html>

<?php
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
            // Lấy giá trị $id từ URL
            $id = $_GET['id'];

            // Xử lý cập nhật dữ liệu người dùng
            $newName = $_POST['name'];
            $newUsername = $_POST['username'];
            $newPassword = $_POST['password'];
            $newPhone = $_POST['phone'];
            $newEmail = $_POST['gmail'];

            // Thực hiện câu lệnh SQL để cập nhật dữ liệu
            $updateSql = "UPDATE user SET hoten='$newName', username='$newUsername', password='$newPassword', phone='$newPhone', email='$newEmail' WHERE id_user=$id";

            // Thực thi câu lệnh SQL
           execute($updateSql);
        }
    }  

?>
