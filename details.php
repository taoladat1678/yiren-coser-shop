<?php require "layout/header.php"; ?>
<?php
require_once('database/config.php');
require_once('database/dbhelper.php');
require_once('utils/utility.php');
// Lấy id từ trang index.php truyền sang rồi hiển thị nó
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = 'select * from product where id=' . $id;
    $product = executeSingleResult($sql);
    // Kiểm tra nếu ko có id sp đó thì trả về index.php
    if ($product == null) {
        header('Location: index.php');
        die();
    }
}
?>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v11.0&appId=264339598396676&autoLogAppEvents=1" nonce="8sTfFiF4"></script>
<!-- END HEADR -->
<main>
    <div class="container">
        <div id="ant-layout">
        <section class="search-quan">
                <i class="fas fa-search"></i>
                <form action="danhmuc.php" method="GET">
                    <input name="search" type="text" placeholder="Tìm trang phục hoặc phụ kiện ...">
                </form>
            </section>
        </div>
        <!-- <div class="bg-grey">

        </div> -->
        <!-- END LAYOUT  -->
        <section class="main">
            <section class="oder-product">
                <div class="title">
                    <section class="main-order">
                        <h1><?= $product['title'] ?></h1>
                        <div class="box">
                            <img src="<?='admin/product/'.$product['thumbnail'] ?>" alt="">
                            <div class="about">
                                <p><?= $product['content'] ?></p>
                                <div class="size">
                                    <p>Size:</p>
                                    <ul>
                                        <li><a href="">S</a></li>
                                        <li><a href="">M</a></li>
                                        <li><a href="">L</a></li>
                                    </ul>
                                </div>
                                <div class="number">
                                    <span class="number-buy">Số lượng</span>
                                    <input id="num" type="number" value="1" min="1" onchange="updatePrice()">
                                </div>

                                <div class="viewPD">
                                    <span class="view-time">Lượt xem: <?= $product['luot_xem'] ?></span>

                                        <?php
                                            // Update the view count in the database
                                    $sqlUpdateViews = 'UPDATE product SET luot_xem = luot_xem + 1 WHERE id = ' . $id;
                                    execute($sqlUpdateViews);
                                    


                                        ?>
                                    </span>

                                    <div class="viewPD">
                                        <span class="view-time">Bình luận: <?= $product['so_comments']?></span>
                                    </div>
                                </div>

                                <p class="price">Giá: <span id="price"><?= number_format($product['price'], 0, ',', '.') ?></span><span> VNĐ</span><span class="gia none"><?= $product['price'] ?></span></p>
                                <!-- <a class="add-cart" href="" onclick="addToCart(<?= $id ?>)"><i class="fas fa-cart-plus"></i>Thêm vào giỏ hàng</a> -->
                                <button class="add-cart" onclick="addToCart(<?= $id ?>)"><i class="fas fa-cart-plus"></i>Thêm vào giỏ hàng</button>
                                <!-- <a class="buy-now" href="checkout.php" >Mua ngay</a> -->
                                <button class="buy-now" onclick="buyNow(<?= $id ?>)">Mua ngay</button>

                                <script>
                                    function updatePrice() {
                                        var price = document.getElementById('price').innerText; // giá tiền
                                        var num = document.querySelector('#num').value; // số lượng
                                        var gia1 = document.querySelector('.gia').innerText;
                                        var gia = price.match(/\d/g);
                                        gia = gia.join("");
                                        var tong = gia1 * num;
                                        document.getElementById('price').innerHTML = tong.toLocaleString();
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="fb-comments" data-href="http://localhost/PROJECT/details.php" data-width="750" data-numposts="5"></div>

                    </section>
                </div>
                <aside>
                    <h1>Gợi ý cho bạn</h1>
                    <div class="row">
                        <?php
                        $sql = 'select * from product limit 5';
                        $productList = executeResult($sql);
                        $index = 1;
                        foreach ($productList as $item) {
                            echo '
                                    <div class="col">
                                    <a href="details.php?id=' . $item['id'] . '">
                                        <img src="admin/product/'.$item['thumbnail'] . '" alt="">
                                        <div class="about">
                                            <div class="title">
                                                <p>' . $item['title'] . '</p>
                                                <span>Giá: ' . number_format($product['price'], 0, ',', '.') . ' VNĐ' . '</span>
                                                </div>
                                        </div>
                                    </a>
                                </div>
                                ';
                        }
                        ?>
                    </div>

                    
                </aside>






                <!-- Phần hiển thị danh sách bình luận -->
                <div class="comments-section">
    <h2>Bình luận</h2>
    <hr>
    <?php
    // Truy vấn để lấy danh sách bình luận theo product_id
    $sqlComments = "SELECT * FROM comments WHERE product_id = $id ORDER BY created_at DESC";
    $comments = executeResult($sqlComments);

    foreach ($comments as $comment) {
        echo '<div class="comment">';
        echo '<strong>' . $comment['user_name'] . '</strong> '.': ' .$comment['comment_text'];
        echo '</div>';
        echo "<hr>";
    }
    ?>
</div>

<!-- Form viết bình luận -->
<div class="comment-form">
    <h3>Viết bình luận</h3>
    <form action="" method="post">
        <?php
        // Kiểm tra xem đã đăng nhập hay chưa
        if (isset($_COOKIE['username'])) {
            // Sử dụng tên người dùng từ cookie
            $username = $_COOKIE['username'];
            echo '<input type="hidden" name="user_name" value="' . $username . '">';
            echo '<p><strong>Tên của bạn:</strong> ' . $username . '</p>';
        } else {
            echo '<input type="hidden" name="user_name" placeholder="Tên của bạn" required>';
        }
        ?>
        <textarea name="comment_text" placeholder="Viết bình luận của bạn" required></textarea>
        <input type="submit" name="submit_comment" value="Gửi bình luận">
    </form>
</div>

<?php

if (isset($_POST['submit_comment'])) {
    // Kiểm tra xem đã đăng nhập hay chưa
    if (!isset($_COOKIE['username'])) {
        echo '<script>
            alert("Muốn bóc phốt shop tôi ư! Trước tiên hãy cho tôi biết bạn là ai");
            window.location="login/login.php";
        </script>';
        exit(); // Thêm dòng này để ngăn chặn việc thực hiện mã nguồn tiếp theo khi không đăng nhập
    }

    // Lấy dữ liệu từ form
    $user_name = $_POST['user_name'];
    $comment_text = $_POST['comment_text'];

    // Thực hiện insert vào bảng comments
    $sqlInsertComment = "INSERT INTO comments (product_id, user_name, comment_text) VALUES ($id, '$user_name', '$comment_text')";
    execute($sqlInsertComment);
   
    
    increaseCommentCount($id);
  
    // Refresh trang để hiển thị bình luận mới
    //header("Location: details.php?id=$id");
    exit();
}
?>



</section>
            <section class="restaurants">
                <div class="title">
                    <h1>Các món hàng ở <span class="green">Yiren Coser</span></h1>
                </div>
                <div class="product-restaurants">
                    <div class="row">
                    <?php
                        try {
                            if (isset($_GET['page'])) {
                                $page = $_GET['page'];
                            } else {
                                $page = 1;
                            }
                            $limit = 12;
                            $start = ($page - 1) * $limit;
                            $sql = "SELECT * FROM product limit $start,$limit";
                            executeResult($sql);
                            // $sql = 'select * from product limit $star,$limit';
                            $productList = executeResult($sql);

                            $index = 1;
                            foreach ($productList as $item) {
                                echo '
                                <div class="col">
                                    <a href="details.php?id=' . $item['id'] . '">
                                        <img class="thumbnail" src="admin/product/'. $item['thumbnail'] . '" alt="">
                                        <div class="title">
                                            <p>' . $item['title'] . '</p>
                                        </div>
                                        <div class="price">
                                            <span>' . number_format($item['price'], 0, ',', '.') . ' VNĐ</span>
                                        </div>
                                        <div class="more">
                                            <div class="star">
                                                <img src="images/icon/icon-star.svg" alt="">
                                                <span>4.6</span>
                                            </div>
                                            <div class="time">
                                                <img src="images/icon/icon-clock.svg" alt="">
                                                <span>Bình luận: '.$item['so_comments'].'</span>
                                                <span class="viewPD">Lượt xem: '.$item['luot_xem'].'</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                ';
                            }
                        } catch (Exception $e) {
                            die("Lỗi thực thi sql: " . $e->getMessage());
                        }
                        ?>
                    </div>

                    <div class="pagination">
                        <ul>
                            <?php
                            $sql = "SELECT * FROM `product`";
                            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
                            $result = mysqli_query($conn, $sql);
                            if (mysqli_num_rows($result)) {
                                $numrow = mysqli_num_rows($result);
                                $current_page = ceil($numrow / 12);
                                // echo $current_page;
                            }
                            for ($i = 1; $i <= $current_page; $i++) {
                                // Nếu là trang hiện tại thì hiển thị thẻ span
                                // ngược lại hiển thị thẻ a
                                if ($i == $current_page) {
                                    echo '
                                    <li><a href="index.php?page=' . $i . '">' . $i . '</a></li>';
                                } else {
                                    echo '
                                    <li><a href="index.php?page=' . $i . '">' . $i . '</a></li>';
                                }
                            }
                            ?>
                        </ul>
                    </div>

                </div>
            </section>

            <section class="restaurants">
                <div class="title">
                    <h1>SẢN PHẨM CÙNG LOẠI</h1>
                </div>
                <div class="product-restaurants">
                    <div class="row">
                    <?php
        // Lấy danh sách sản phẩm cùng loại (ví dụ: cùng danh mục)
        $categoryId = $product['id_category']; // Giả sử category_id là trường trong bảng product
        $sqlRelatedProducts = "SELECT * FROM product WHERE id_category = $categoryId AND id != $id ";
        $relatedProducts = executeResult($sqlRelatedProducts);

        foreach ($relatedProducts as $item) {
            echo '
            <div class="col">
            <a href="details.php?id=' . $item['id'] . '">
                <img class="thumbnail" src="admin/product/'. $item['thumbnail'] . '" alt="">
                <div class="title">
                    <p>' . $item['title'] . '</p>
                </div>
                <div class="price">
                    <span>' . number_format($item['price'], 0, ',', '.') . ' VNĐ</span>
                </div>
                <div class="more">
                    <div class="star">
                        <img src="images/icon/icon-star.svg" alt="">
                        <span>4.6</span>
                    </div>
                    <div class="time">
                        <img src="images/icon/icon-clock.svg" alt="">
                        <span>Bình luận: '.$item['so_comments'].'</span>
                        <span class="viewPD">Lượt xem: '.$item['luot_xem'].'</span>
                    </div>
                </div>
            </a>
        </div>
            ';
        }
        ?>

                </div>
            </section>


            </section>
            
            


        </section>
    </div>
</main>
<?php require_once('layout/footer.php'); ?>
</div>
<script type="text/javascript">
    function addToCart(id) {
        var num = document.querySelector('#num').value; // số lượng
        $.post('api/cookie.php', {
            'action': 'add',
            'id': id,
            'num': num
        }, function(data) {
            location.reload()
        })
    }

    function buyNow(id) {
            $.post('api/cookie.php', {
                'action': 'add',
                'id': id,
                'num': 1
            }, function(data) {
                location.assign("checkout.php");
            })
    }
</script>
</body>

</html>