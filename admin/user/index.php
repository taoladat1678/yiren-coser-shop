<?php
require_once('../database/dbhelper.php');
?>
<!DOCTYPE html>
<html>

<head>
    <title>Quản Lý Danh Mục</title>
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
            <a class="nav-link active" href="../category/">Quản lý danh mục</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../product/">Quản lý sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../dashboard.php">Quản lý đơn hàng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="index.php">Quản lý Người Dùng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../comments/index.php">Quản lý Bình Luận</a>
        </li>
    </ul>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Quản lý Người Dùng</h2>
            </div>
            <div class="panel-body"></div>
            <a href="add.php">
                <button class=" btn btn-success" style="margin-bottom:20px">Thêm Quản Trị</button>
            </a>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td width="70px">STT</td>
                        <td width="100px">ID Người dùng</td>
                        <td>Tên danh mục</td>
                        <td width="50px"></td>
                        <td width="50px"></td>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Lấy danh sách danh mục
                    $sql = 'select * from user';
                    $categoryList = executeResult($sql);
                    $index = 1;
                    foreach ($categoryList as $item) {
                        echo '  <tr>
                    <td>' . ($index++) . '</td>
                    <td>' . $item['id_user'] . '</td>
                    <td>' . $item['username'] . '</td>
                    <td>
                        <a href="change.php?id=' . $item['id_user'] . '">
                            <button class=" btn btn-warning">Sửa</button> 
                        </a> 
                    </td>
                    <td>            
                    <button class="btn btn-danger" onclick="deleteUser('.$item['id_user'].')">Xoá</button>
                    </td>
                </tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    </div>
    <script type="text/javascript">
         function editUser(id) {
        // Redirect to the edit page or open a modal for editing
        window.location.href = 'change.php?id_user=' + id;
    }

		function deleteUser(id) {
			var option = confirm('Bạn có chắc chắn muốn xoá người dùng này không?')
			if(!option) {
				return;
			}
			console.log(id)
			$.post('ajax.php', {
				'id_user': id,
				'action': 'delete'
			}, function(data) {
				location.reload()
			})
		}
	</script>
</body>

</html>