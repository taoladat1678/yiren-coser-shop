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
            <a class="nav-link" href="../user/index.php">Quản lý Người Dùng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="index.php">Quản lý Bình Luận</a>
        </li>
    </ul>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Quản lý Bình Luận</h2>
            </div>
            <div class="panel-body"></div>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td width="70px">STT</td>
                        <td width="90px">ID bình luận</td>
                        <td width="90px">ID sản phẩm</td>
                        <td width="90px">Username</td>
                        <td width="90px">Bình luận</td>
                        <td width="50px"></td>
                    
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Lấy danh sách danh mục
                    $sql = 'select * from comments';
                    $commentList = executeResult($sql);
                    $index = 1;
                    foreach ($commentList as $cmt) {
                        echo '  <tr>
                    <td>' . ($index++) . '</td>
                    <td>' . $cmt['id'] . '</td>
                    <td>' . $cmt['product_id'] . '</td>
                    <td>' . $cmt['user_name'] . '</td>
                    <td>' . $cmt['comment_text'] . '</td>
                  
                    <td>            
                    <button class="btn btn-danger" onclick="deleteUser('.$cmt['id'].')">Xoá</button>
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
		function deleteUser(id) {
			var option = confirm('Bạn có chắc chắn muốn xoá bình luận này không?')
			if(!option) {
				return;
			}
			console.log(id)
			$.post('ajax.php', {
				'id': id,
				'action': 'delete'
			}, function(data) {
				location.reload()
			})
		}
	</script>
</body>

</html>