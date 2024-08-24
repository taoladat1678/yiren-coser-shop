<?php
require_once('../database/dbhelper.php');
// $id = $name = '';
// if (!empty($_POST['name'])) {
//     $name = '';

//     if (isset($_POST['name'])) {
//         $name = $_POST['name'];
        
//     }
//     if (isset($_POST['username'])) {
//         $username = $_POST['username'];
        
//     }


//     if (isset($_POST['id'])) {
//         $id = $_POST['id'];
//     }
//     if (!empty($name)) {
//         $created_at = $updated_at = date('Y-m-d H:s:i');
//         // Lưu vào DB
//         if ($id == '') {
//             // Thêm danh mục
//             $sql = 'insert into user(hoten, username,password,phone,gmail) 
//             values ("' . $name . '","' . $created_at . '","' . $updated_at . '")';
//         } 
//         else {
//             // Sửa danh mục
//             $sql = 'update user set name="' . $name . '", updated_at="' . $updated_at . '" where id=' . $id;
//         }
//         execute($sql);
//         header('Location: index.php');
//         die();
//     }
// }



// if (isset($_GET['id'])) {
//     $id = $_GET['id'];
//     $sql = 'select * from user where id=' . $id;
//     $newHost = executeSingleResult($sql);
//     if ($newHost != null) {
//         $name = $newHost['name'];
//     }
// }


if(isset($_POST['name']) && isset($_POST['username']) && isset($_POST['password']) && isset($_POST['phone']) && isset($_POST['gmail']) ){
    $hoten = $_POST['name'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $phone = $_POST['phone'];
    $gmail = $_POST['gmail'];


    $sql = 'insert into user(hoten, username,password,phone,email) 
             values ("' . $hoten . '","' . $username . '","' . $password . '","' . $phone . '","' . $gmail . '")';

    if($sql){
        echo "thành công";
    }

    execute($sql);
}





?>
<!DOCTYPE html>
<html>

<head>
    <title>Thêm Danh Mục</title>
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
                <h2 class="text-center">Thêm Quản Trị</h2>
            </div>
            <div class="panel-body">
                <form method="POST">
                    <div class="form-group">
                        <label for="name">Tên Quản Trị:</label>
                   
                        <input required="true" method="post" type="text" class="form-control" id="name" name="name" value="">
                    </div>
                    <div class="form-group">
                        <label for="name">Username:</label>
                        
                        <input required="true" type="text" class="form-control" id="username" name="username" value="">
                    </div>

                    <div class="form-group">
                        <label for="name">Mật khẩu:</label>
                        
                        <input required="true" type="password" class="form-control" id="password" name="password" value="">
                    </div>

                    <div class="form-group">
                        <label for="name">Phone:</label>
                        
                        <input required="true" type="text" class="form-control" id="phone" name="phone" value="">
                    </div>

                    <div class="form-group">
                        <label for="name">Gmail:</label>
                        
                        <input required="true" type="gmail" class="form-control" id="gmail" name="gmail" value="">
                    </div>
                    <button class="btn btn-success">Thêm</button>
                    <?php
                     $previous = "javascript:history.go(-1)";
                    if (isset($_SERVER['HTTP_REFERER'])) {
                         $previous = $_SERVER['HTTP_REFERER'];
                     }
                 ?>
                    <a href="<?= $previous ?>" class="btn btn-warning">Back</a>
                </form>
            </div>
        </div>
    </div>
</body>

</html>