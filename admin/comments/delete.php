<?php
// require_once('..database/dbhelper.php');
?>
<?php
// if (isset($POST['id'])) {
//     $id = $POST['id'];


// $sql = 'delete from comments where id=' . $id;
// execute($sql);
// header('Location: index.php');
// die();
// }

?>

<?php
require_once('../database/dbhelper.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['id'])) {
        $id = $_POST['id'];

        // Lấy product_id từ bình luận sẽ bị xóa
        $sqlGetProductId = "SELECT product_id FROM comments WHERE id = $id";
        $productInfo = executeSingleResult($sqlGetProductId);

        // Thực hiện xóa bình luận
        $sqlDeleteComment = "DELETE FROM comments WHERE id = $id";
        execute($sqlDeleteComment);

        // Giảm giá trị so_comments trong bảng product
        decreaseCommentCount($productInfo['product_id']);

        header('Location: index.php');
        die();
    }
}

function decreaseCommentCount($productId) {
    $sql = "UPDATE product SET so_comments = GREATEST(0, so_comments - 1) WHERE id = $productId";
    execute($sql);
}
?>
