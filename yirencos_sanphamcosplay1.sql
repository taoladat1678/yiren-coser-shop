-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th12 10, 2023 lúc 02:36 AM
-- Phiên bản máy phục vụ: 8.0.34
-- Phiên bản PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `yirencos_sanphamcosplay1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`, `img`) VALUES
(1, 'Cosplay Thường', '2021-07-07 11:50:15', '2021-11-07 08:07:44', 'coser_thuong'),
(2, 'Cosplay Game', '2021-07-07 11:50:15', '2021-07-22 16:07:29', 'cosplay_game'),
(3, 'Cosplay Anime', '2021-07-07 11:50:15', '2021-07-22 16:12:25', 'cosplay_anime'),
(38, 'Phụ kiện Cosplay ', '2021-07-13 10:57:52', '2023-10-11 18:03:03', 'phukien_cosplay');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(143, 'Nguyễn Đăng Thành', '0387578520', 'bossryo68a@gmail.com', '68.65.120.213, viet nam', '', '2021-11-07 08:37:06'),
(144, 'DEMO', '03875723232', 'DEMO@gmail.com', 'DEMO', 'DEMO', '2021-11-07 08:42:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `id_user` int NOT NULL,
  `num` int NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(149, 143, 2, 7, 3, 35000, 'Đã hủy'),
(150, 143, 4, 7, 1, 25000, 'Đã hủy'),
(151, 143, 12, 7, 1, 30000, 'Đã hủy'),
(152, 143, 14, 7, 1, 35000, 'Đã hủy'),
(153, 144, 12, 8, 11, 30000, 'Đã hủy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_category` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `luot_xem` int NOT NULL,
  `so_comments` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `content`, `id_category`, `created_at`, `updated_at`, `luot_xem`, `so_comments`) VALUES
(1, 'COSPLAY HẦU GÁI SHORT VERSION', 25000, 20, 'uploads/cosplay_haugai.jpg', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 44px; padding: 0px;\"><span style=\"color: rgb(0, 0, 0);\">Nhập vai vào thế giới phức tạp và quyến rũ của bộ trang phục cosplay hầu gái, nơi nét dịu dàng gặp gỡ với vẻ quyến rũ. Bộ trang phục này không chỉ là một bức tranh sống động về sự dễ thương mà còn là biểu tượng của sự phục tùng và phục vụ. Với chiếc váy xòe màu đen, kết hợp cùng với chiếc nơ lớn tinh tế, bộ trang phục tạo nên một vẻ ngoại hình kiêu kỳ và thu hút.\r\n\r\nBộ trang phục có đường cắt tỉ mỉ, tạo nên vẻ gợi cảm mà vẫn giữ được sự thanh nhã. Bạn sẽ tự tin bước đi với đôi tất cao cổ và giày bốt, làm tôn lên đôi chân dài mượt mà. Không thể không nhắc đến chiếc đồng hồ cổ điển và dây chuyền mảnh mai, những phụ kiện nhỏ nhưng tinh tế làm nổi bật vẻ quyến rũ của bộ trang phục.</span><br></p>', 1, '2021-07-07 17:41:08', '2021-08-15 16:41:50', 90, 0),
(2, 'COSPLAY QUẢN GIA SIÊU CẤP VIP NGẦU', 35000, 50, 'uploads/cosplay_quangia.jpg', '<font color=\"#000000\">Dạo qua thế giới của cosplay quản gia, bạn sẽ bắt gặp một diện mạo tinh tế và sang trọng, nơi nét lịch lãm hòa quyện với vẻ nam tính. Bộ trang phục này, với chiếc áo sơ mi trắng tinh khôi kết hợp cùng chiếc vest đen hoặc xám, tạo nên hình ảnh của một người quản gia vô cùng ấn tượng.Nút cài và dây nịt được chăm chút tỉ mỉ, tôn lên vẻ chỉn chu và lịch lãm. Đôi quần âu đen hoặc xám, cùng với đôi giày oxford, đồng hành tạo nên bức tranh hoàn hảo của một người hầu trung thành và chuyên nghiệp.\r\n\r\n</font><br>', 1, '2023-10-04 12:02:04', '2023-08-15 12:01:45', 39, 0),
(4, 'COSPLAY MAKIMA CHAINSAW MAN', 2500000, 30, 'uploads/cosplay_makima.jpg', 'Makima bí ẩn và quyền lực với bộ trang phục vest này', 3, '2021-07-07 17:25:47', '2021-08-15 16:12:51', 4, 0),
(5, 'COSPLAY YASUO LIÊN MINH HUYỀN THOẠI', 35000, 10, 'uploads/cosplay_yasuo.jpg\r\n', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Bước vào thế giới huyền bí của Liên Minh Huyền Thoại, một nhân vật đã trở thành biểu tượng không chỉ với tài năng chiến đấu mà còn với sự quyến rũ của bộ trang phục độc đáo - Yasuo, người giữ gió và kiếm như một đơn vị hoàn hảo.</span><br>', 2, '2021-07-07 18:36:37', '2021-08-15 16:24:51', 204, 0),
(8, 'COSPLAY HẦU GÁI BATTLE VERSION', 50000, 10, 'uploads/cosplay_haugai2.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 20px;=\"\" font-weight:=\"\" 700;=\"\" text-align:=\"\" center;\"=\"\">Chìm đắm vào thế giới độc đáo của cosplay hầu gái phiên bản chiến đấu, nơi sự dễ thương gặp gỡ với sức mạnh đầy ấn tượng. Bạn sẽ mê mẩn chiếc váy đen mịn màng, nhưng không phải là để phục vụ, mà để trở thành chiến binh của thế giới cosplay. Bộ trang phục này không chỉ làm nổi bật vóc dáng nhỏ nhắn mà còn là biểu tượng của sức mạnh và quyết đoán. Chiếc áo sơ mi trắng có thể trở thành lớp giáp nhẹ, cùng với chiếc váy đen được thiết kế để thuận tiện cho mọi động tác chiến đấu. Bạn có thể thấy chiếc nơ xinh xắn biến thành một chiếc cà vạt linh hoạt, đồng hành cùng bạn trong mỗi đòn tấn công.</span><br></p>', 1, '2021-07-11 16:07:58', '2021-08-15 16:44:51', 126, 0),
(9, 'COSPLAY ELSA FROZEN', 25000, 46, 'uploads/cosplay_elsa.jpg', '<pTrong thế giới của cosplay Elsa, bạn sẽ bước vào một cõi thần tiên lạc lõng giữa tuyết trắng bạch và bản nhạc đầy cảm xúc của \"Let It Go\". Bộ trang phục này lấy cảm hứng từ nhân vật Elsa trong bộ phim \"Frozen\", tạo ra hình ảnh lạnh lùng, nhưng vô cùng quyến rũ. Chiếc váy màu xanh da trời lấp lánh như tuyết, với đuôi váy dài trải dài như lớp tuyết phủ trắng mặt đất. Nó không chỉ thể hiện vẻ đẹp quyền lực của Elsa mà còn tạo nên hình ảnh nữ tính và quý phái. Điều quan trọng là chiếc áo khoác xanh navy, là điểm nhấn hoàn hảo cho vẻ ngoại hình hoàng gia.<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:02:52', 1, 0),
(10, 'PHỤ KIỆN TAI MÈO FURRY PLUSH', 100000, 44, 'uploads/phukien_taimeo.jpg', '<p><font color=\"#53382c\">Tai mèo siêu cute cho những chị em coser muốn hot hòn họt trên mạng xã hội hoặc làm nũng với người yêu</font></p>', 38, '2021-07-11 16:12:59', '2023-10-04 08:57:17', 11, 0),
(12, 'BỘ SONG KIẾM ELUCIDATOR + DARK REPULSER', 3550000, 15, 'uploads/phukien_elu_repul.jpg', '<p>Cosplay Kirito mà không có bộ song kiếm này là hơi dở&nbsp;</p>', 38, '2021-07-13 10:20:53', '2023-10-04 08:40:21', 45, 1),
(13, 'COSPLAY ASHE LIÊN MINH HUYỀN THOẠI', 19000, 20, 'uploads/cosplay_ashe.jpg', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Ashe Liên Minh Huyền Thoại, xạ thủ khả năng khống chế tầm xa khó chịu.</span><br>', 2, '2021-07-07 17:41:08', '2021-08-15 16:40:53', 2, 0),
(14, 'COSPLAY HUTAO GENSHIN IMPACT', 35000, 5, 'uploads/cosplay_hutao.jpg', '<span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Hutao, 1 con ma dễ thương chuẩn bị ám quẻ mọi người.</span><br>', 2, '2021-07-07 17:41:08', '2021-08-15 16:00:55', 29, 0),
(16, 'COSPLAY GOJO SATORU JJK', 20000, 30, 'uploads/cosplay_gojo.jpg', 'Gojo Satoru, thầy bị cắt đôi nhưng mà thầy vẫn đẹp trai với trang phục cực chất cũng như cặp kính hơi bị buồn cười', 3, '2021-07-07 17:25:47', '2021-08-15 16:17:55', 21, 0),
(17, 'COSPLAY BRONYA HERSCHER OF REASON HONKAI IMPACT', 35000, 10, 'uploads/cosplay_bronya.jpg', 'Cực đỉnh cao với bộ trang phục của Valkirye mạnh nhất nhì Honkai Impact Bronya Herscher of Reason', 2, '2021-07-07 18:36:37', '2021-08-15 16:35:55', 2, 0),
(18, 'COSPLAY JOKER THE DARK KNIGHT', 50000, 10, 'uploads/cosplay_joker.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 1rem;\">Bước vào thế giới khám phá và điên đảo của cosplay Joker, nơi sự điên rồ gặp gỡ với nghệ thuật tội phạm. Bạn sẽ trở thành nhân vật phản diện đầy ma mị và độc đáo từ thế giới Batman, với một vẻ ngoại hình điên đảo và đầy ẩn số. Chiếc áo blazer màu tím đậm với chiếc áo vest màu tím nhạt tạo nên sự tương phản và sặc sỡ. Bạn có thể thêm vào đó chiếc cà vạt màu đỏ đậm để tăng thêm điểm nhấn và vẻ nổi bật. Quần âu màu xám hoặc đen sẽ hoàn thiện phong cách độc đáo của Joker</span><br></p><p><br></p>', 1, '2021-07-11 16:07:58', '2021-08-15 16:48:55', 0, 0),
(19, 'COSPLAY NỮ SINH TRUNG HỌC', 50000, 46, 'uploads/cosplay_nusinh.jpg', '<p>Chào mừng bạn đến với thế giới dễ thương và năng động của cosplay nữ sinh! Bộ trang phục này sẽ đưa bạn trở lại những kỷ niệm ngọt ngào của thời học sinh, nơi sự tươi trẻ và sự hứng khởi là chủ đề chính. Chiếc váy trắng hoặc xanh pastel là lựa chọn hoàn hảo, kèm theo chiếc dây nịt màu đen hoặc nâu tạo điểm nhấn thú vị. Có thể thêm chiếc áo len mỏng hoặc áo khoác jean để tạo nên phong cách năng động và thời trang.<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:03:56', 1, 0),
(20, 'COSPLAY SÁT THỦ BẮN TỈA ', 50000, 44, 'uploads/cosplay_satthu.jpg', '<p><span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Chào mừng bạn đến với thế giới bí ẩn và nguy hiểm của cosplay sát thủ! Trang phục này sẽ biến bạn thành một nhân vật vô cùng huyền bí và đầy chất ngầu. Bộ trang phục có thể bao gồm chiếc áo blazer màu đen, hoặc một bộ trang phục jumpsuit màu đen huyền bí. Để tăng thêm vẻ nổi bật và bí ẩn, bạn có thể thêm vào chiếc dây nịt hoặc thắt lưng mạnh mẽ. Quần âu đen hoặc legging cũng là một sự chọn lựa tốt.</span><br></p>', 1, '2021-07-11 16:12:59', '2021-08-15 16:20:56', 1, 0),
(21, 'BÔNG TAI HOWL ', 30000, 15, 'uploads/phukien_bongtai.jpg', '<p>Đeo quả bông tai này thì quyến rũ vãi&nbsp;</p>', 38, '2021-07-13 10:20:53', '2023-10-04 08:57:27', 0, 0),
(26, 'COSPLAY AIRI KIEMONO', 35000, 100, 'uploads/cosplay_airi.jpg', '<p>Airi hơi bị mạnh.<br></p>', 2, '2021-08-15 08:36:27', '2021-08-15 16:57:56', 0, 0),
(28, 'COSPLAY KIRITO SWORD ART ONLINE', 20000, 90, 'uploads/cosplay_kirito.jpg', '<p>Hắc kiếm sĩ Kirito bật hack đánh bại mọi đối thủ<br></p>', 3, '2021-08-15 08:25:31', '2021-08-15 16:13:57', 0, 0),
(29, 'COSPLAY KANEKI KEN TOKYO GHOUL', 19000, 20, 'uploads/cosplay_kaneki.jpg', '<p>Cosplay thằng bị đau mắt đỏ thêm quả khẩu trang nhe răng nhìn khá là ngầu</p>', 3, '2021-08-15 08:19:32', '2023-10-04 07:30:59', 0, 0),
(30, 'PHỤ KIỆN TÓC GIẢ COSPLAY MAKIMA', 990, 100, 'uploads/phukien_tocgia_makima.jpg', '<p>Cosplay người đẹp Makima mà thiếu bộ tóc thì chỉ có dẹp nha</p>', 38, '2021-08-15 08:01:37', '2023-10-04 08:36:32', 0, 0),
(31, 'PHỤ KIỆN COSPLAY ĐUÔI CÁO', 500000, 90, 'uploads/phukien_duoicao.jpg', '<p>Đuôi cáo cực dễ thương</p>', 38, '2021-08-15 08:51:37', '2023-10-04 08:02:35', 0, 0),
(43, 'COSPLAY Y TÁ KHÁ LÀ GỢI CẢM', 4000000, 47, 'uploads/cosplay_yta.jpg', '<p>Muốn trở thành bệnh nhân của cô ý tá khum :))))</p>', 1, '2023-10-16 12:32:07', '2023-10-16 12:32:07', 0, 0),
(44, 'COSPLAY CON ẾCH KHÁ HÀI HƯỚC ', 1000000, 50, 'uploads/cosplay_conech.jpg', '<p>Con ếch khá là hot trên tóp tóp</p>', 1, '2023-10-16 12:11:12', '2023-10-16 12:11:12', 0, 0),
(45, 'COSPLAY SUPERMAN KHÁ CỨNG CÁP', 5000000, 100, 'uploads/cosplay_superman.jpg', 'Người xưa có câu có nạp mới có ăn ', 1, '2023-10-16 12:44:17', '2023-10-16 12:44:17', 0, 0),
(46, 'COSPLAY SPIDERMAN CỰC CUỐN', 3500000, 200, 'uploads/cosplay_spiderman.jpg', '<p>Làm người nhện đi chém titan đê</p>', 1, '2023-10-16 12:14:21', '2023-10-16 12:14:21', 0, 0),
(47, 'COSPLAY ĐỘI TRƯỞNG MỸ BẢN LĨNH', 10, 500, 'uploads/cosplay_captainUSA.jpg', '<p>Phóng khiên chết kẻ địch</p>', 1, '2023-10-16 12:40:24', '2023-10-16 12:40:24', 0, 0),
(48, 'COSPLAY CAPTAIN MARVEL KHÔNG BIẾT QUYẾN RŨ HAY KHÔNG', 10000000, 900, 'uploads/cosplay_captainMarvel.jpg', '<p>Cung tương tự như CapUSA nhưng ko phóng khiên</p>', 1, '2023-10-16 12:39:29', '2023-10-16 12:39:29', 0, 0),
(49, 'COSPLAY ANH THOR PHÓNG BÚA', 4, 100, 'uploads/cosplay_thor.jpg', '<p>Phóng búa vỡ đầu kẻ địch</p>', 1, '2023-10-16 12:23:31', '2023-10-16 12:23:31', 0, 0),
(50, 'COSPLAY CỔ TRANG HOÀNG THƯỢNG', 4, 200, 'uploads/cosplay_hoangthuong.jpg', '<p>Mặc long bào mang hận căm ra chốn xa trường</p>', 1, '2023-10-16 12:30:33', '2023-10-16 12:30:33', 0, 0),
(51, 'COSPLAY CÔ DÂU ẤN ĐỘ', 1300000, 90, 'uploads/cosplay_codau.jpg', '<p>Cô dâu phi vật lý</p>', 1, '2023-10-16 12:51:35', '2023-10-16 12:51:35', 0, 0),
(52, 'COSPLAY CƯƠNG THI ĐÁNG \"SỢ\"', 1300000, 140, 'uploads/cosplay_cuongthi.jpg', '<p>Sợ không, sợ không?</p>', 1, '2023-10-16 12:44:38', '2023-10-16 12:44:38', 0, 0),
(53, 'COSPLAY TỔNG TÀI HƠI HƠI NGẦU', 4, 123, 'uploads/cosplay_tongtai.jpg', '<p>Làm tổng tài tán đổ vài em</p>', 1, '2023-10-16 12:01:41', '2023-10-16 12:01:41', 0, 0),
(54, 'COSPLAY CỤC \"CỚT\"', 1000000, 50, 'uploads/cosplay_cuccut.jpg', '<p>Cosplay này hơi dơ nhưng cũng hơi hài hước</p>', 1, '2023-10-16 12:54:42', '2023-10-16 12:54:42', 0, 0),
(55, 'COSPLAY PHÙ THỦY HOGWARTS', 1300000, 100, 'uploads/cosplay_phuthuy.jpg', '<p>Cosplay Harry Potter để đi báo bằng phép thuật</p>', 1, '2023-10-16 12:47:44', '2023-10-16 12:47:44', 0, 0),
(56, 'COSPLAY BÍ NGÔ \"KẸO HAY GHẸO\"', 1300000, 111, 'uploads/cosplay_bingo.jpg', '<p>Bí ngô này cũng khá xinh&nbsp;</p>', 1, '2023-10-16 12:05:47', '2023-10-16 12:05:47', 0, 0),
(57, 'COSPLAY THẦY PHẠM NGỌC CƯỜNG FPOLY', 1000000, 1, 'uploads/cosplay_PNC.jpg', '<p>Thầy Cường cho em qua môn :_))))</p>', 1, '2023-10-16 12:07:52', '2023-10-16 12:07:52', 0, 0),
(58, 'COSPLAY AKALI SÁT CHIÊU HOÀN HẢO', 1300000, 100, 'uploads/cosplay_akali.jpg', '<p>Cầm 2 cây hàng xiên đối thủ và lụm 150 vàng</p>', 2, '2023-10-16 12:56:54', '2023-10-16 12:56:54', 0, 0),
(59, 'COSPLAY AKALI KDA ALL OUT CỰC CHẤT', 3550000, 100, 'uploads/cosplay_akaliKDA1.jpg', '<p>Cũng là akali nhưng lấp lánh hơn tí</p>', 2, '2023-10-16 12:58:57', '2023-10-16 12:58:57', 0, 0),
(61, 'COSPLAY AKALI KDA THƯỜNG', 1300000, 90, 'uploads/cosplay_akaliKDA2.jpg', '<p>Cũng là KDA nhưng xưa hơn :_)))</p>', 2, '2023-10-16 13:30:00', '2023-10-16 13:30:00', 0, 0),
(62, 'COSPLAY AHRI LIÊN MINH HUYỀN THOẠI', 3550000, 111, 'uploads/cosplay_ahri.jpg', '<p>Làm nàng cáo cào đối thủ</p>', 2, '2023-10-16 13:42:02', '2023-10-16 13:42:02', 0, 0),
(63, 'COSPLAY AHRI KDA ALL OUT', 3550000, 111, 'uploads/cosplay_ahriKDA.jpg', '<p>Cũng là Ahri nhưng nó lấp lánh hơn</p>', 2, '2023-10-16 13:03:04', '2023-10-16 13:03:04', 1, 0),
(64, 'COSPLAY EZREAL VỆ BINH TINH TÚ ', 1000000, 111, 'uploads/cosplay_ezrealVBTT.jpg', '<p><br></p>', 2, '2023-10-16 13:15:07', '2023-10-16 13:15:07', 0, 0),
(65, 'COSPLAY ELSU SỨ GIẢ TẬN THẾ', 4000000, 111, 'uploads/cosplay_elsu.jpg', '', 2, '2023-10-16 13:21:09', '2023-10-16 13:21:09', 0, 0),
(66, 'COSPLAY NASUS ĐẶC VỤ SUSAN 0175', 5500000, 222, 'uploads/cosplay_nasus.jpg', '', 2, '2023-10-16 13:45:10', '2023-10-16 13:45:10', 0, 0),
(67, 'COSPLAY XIAO GENSHIN IMPACT', 6500000, 2000, 'uploads/cosplay_xiao.jpg', '', 2, '2023-10-16 13:53:11', '2023-10-16 13:53:11', 0, 0),
(68, 'COSPLAY DURANDAL HONKAI IMPACT', 10000000, 500, 'uploads/cosplay_durandal.jpg', '', 2, '2023-10-16 13:14:14', '2023-10-16 13:14:14', 0, 0),
(69, 'BỘ COSPLAY SEELE BỈ NGẠN SONG SINH', 10500000, 400, 'uploads/cosplay_seeleDouble.jpg', '', 2, '2023-10-16 13:38:16', '2023-10-16 13:38:16', 0, 0),
(70, 'COSPLAY MẮM CHÚA GOD KIANA ', 7000000, 90, 'uploads/cosplay_godKiana.jpg', '', 2, '2023-10-16 13:48:19', '2023-10-16 13:48:19', 0, 0),
(71, 'COSPLAY VERES KIEMONO ', 3550000, 1000, 'uploads/cosplay_veres.jpg', '', 2, '2023-10-16 13:59:21', '2023-10-16 13:59:21', 0, 0),
(72, 'COSPLAY VALHEIN VŨ KHÍ TỐI THƯỢNG', 5000000, 100, 'uploads/cosplay_valhein.jpg', '', 2, '2023-10-16 13:44:23', '2023-10-16 13:44:23', 0, 0),
(73, 'COSPLAY VIOLET HUYẾT MA THẦN', 8000000, 50, 'uploads/cosplay_violet.jpg', '', 2, '2023-10-16 13:45:25', '2023-10-16 13:45:25', 0, 0),
(74, 'COSPLAY TOUKA TOKYO GHOUL', 3550000, 123, 'uploads/cosplay_touka.jpg', '', 3, '2023-10-16 13:14:28', '2023-10-16 13:14:28', 0, 0),
(75, 'COSPLAY ASUNA SWORD ART ONLINE', 3550000, 400, 'uploads/cosplay_asuna.jpg', '', 3, '2023-10-16 13:10:30', '2023-10-16 13:10:30', 0, 0),
(76, 'COSPLAY EUGEO SWORD ART ONLINE ALICIZATION', 4000000, 100, 'uploads/cosplay_eugeo.jpg', '', 3, '2023-10-16 13:17:31', '2023-10-16 13:17:31', 3, 0),
(77, 'COSPLAY ALICE SWORD ART ONLINE ALICIZATION', 4000000, 122, 'uploads/cosplay_alice.jpg', '', 3, '2023-10-16 13:40:33', '2023-10-16 13:40:33', 0, 0),
(78, 'COSPLAY KAITOU KID DETECTIVE CONAN', 8500000, 300, 'uploads/cosplay_kaitoukid.jpg', '', 3, '2023-10-16 13:13:35', '2023-10-16 13:13:35', 0, 0),
(79, 'COSPLAY YUJI IDATORI JJK', 10000000, 300, 'uploads/cosplay_yuji_jpg.jpg', '', 3, '2023-10-16 13:45:36', '2023-10-16 13:45:36', 0, 0),
(80, 'COSPLAY L LAWLIET DEATH NOTE', 6500000, 200, 'uploads/cosplay_L.jpg', '', 3, '2023-10-16 13:16:39', '2023-10-16 13:16:39', 0, 0),
(81, 'COSPLAY SHINICHI KUDO DETECTIVE CONAN', 4000000, 123, 'uploads/cosplay_shinichi.jpg', '', 3, '2023-10-16 13:40:41', '2023-10-16 13:40:41', 0, 0),
(82, 'COSPLAY EDOGAWA CONAN DC', 4000000, 444, 'uploads/cosplay_conan.jpg', '', 3, '2023-10-16 13:43:42', '2023-10-16 13:43:42', 0, 0),
(83, 'COSPLAY MIYANO SHIHO DETECTIVE CONAN', 4000000, 431, 'uploads/cosplay_shiho.jpg', '', 3, '2023-10-16 13:47:44', '2023-10-16 13:47:44', 0, 0),
(84, 'COSPLAY AI HAIBARA DETECTIVE CONAN', 4000000, 70, 'uploads/cosplay_haibara.jpg', '', 3, '2023-10-16 13:32:46', '2023-10-16 13:32:46', 0, 0),
(85, 'COSPLAY UCHIHA SASUKE ', 4000000, 212, 'uploads/cosplay_sasuke.jpg', '', 3, '2023-10-16 13:16:48', '2023-10-16 13:16:48', 0, 0),
(86, 'COSPLAY HATAKE KAKASHI UCHIHA LITE KONOHA', 5500000, 457, 'uploads/cosplay_kakashi.jpg', '', 3, '2023-10-16 13:33:50', '2023-10-16 13:33:50', 0, 0),
(87, 'COSPLAY UCHIHA ITACHI', 4500000, 223, 'uploads/cosplay_itachi.jpg', '', 3, '2023-10-16 13:53:52', '2023-10-16 13:53:52', 0, 0),
(88, 'COSPLAY UZUMAKI NARUTO ', 2500000, 112, 'uploads/cosplay_naruto.jpg', '', 3, '2023-10-16 13:15:54', '2023-10-16 13:15:54', 0, 0),
(89, 'COSPLAY SAKURA THỦ LĨNH THẺ BÀI', 1500000, 300, 'uploads/cosplay_sakura.jpg', '', 3, '2023-10-16 13:44:55', '2023-10-16 13:44:55', 0, 0),
(90, 'LAMBENT LIGHT COSPLAY ASUNA', 1000000, 113, 'uploads/phukien_lambent.jpg', '', 38, '2023-10-16 13:09:58', '2023-10-16 13:09:58', 0, 0),
(91, 'BLUE ROSE COSPLAY EUGEO ', 4500000, 444, 'uploads/phukien_bluerose.jpg', '', 38, '2023-10-16 14:14:00', '2023-10-16 14:14:00', 1, 0),
(92, 'FRAGRANT OLIVE COSPLAY ALICE', 6500000, 600, 'uploads/phukien_fragrantolive.jpg', '', 38, '2023-10-16 14:06:02', '2023-10-16 14:06:02', 0, 0),
(93, 'EXCALIBUR COSPLAY KIRITO', 8000000, 20, 'uploads/phukien_excalibur.jpg', '', 38, '2023-10-16 14:19:04', '2023-10-16 14:19:04', 0, 0),
(94, 'BARRET COSPLAY SHINON GUN GALE ONLINE', 3550000, 10, 'uploads/phukien_barret.jpg', '', 38, '2023-10-16 14:26:07', '2023-10-16 14:26:07', 0, 0),
(95, 'TÓC COSPLAY ASUNA', 1500000, 400, 'uploads/phukien_asuna.jpg', '', 38, '2023-10-16 14:49:08', '2023-10-16 14:49:08', 0, 0),
(96, 'TÓC COSPLAY KIRITO', 150000000, 100, 'uploads/phukien_kirito.jpg', '', 38, '2023-10-16 14:24:10', '2023-10-16 14:24:10', 0, 0),
(97, 'TÓC COSPLAY EUGEO', 1500000, 100, 'uploads/phukien_eugeo.jpg', '', 38, '2023-10-16 14:46:11', '2023-10-16 14:46:11', 0, 0),
(98, 'TÓC COSPLAY ALICE SAO', 1500000, 100, 'uploads/phukien_alice.jpg', '', 38, '2023-10-16 14:13:13', '2023-10-16 14:13:13', 0, 0),
(99, 'TÓC COSPLAY SHINON', 1500000, 100, 'uploads/phukien_shinon.jpg', '', 38, '2023-10-16 14:34:14', '2023-10-16 14:34:14', 0, 0),
(100, 'COMBO TÓC + KÍNH COSPLAY GOJO SATORU', 1550000, 200, 'uploads/phukien_gojo.jpg', '', 38, '2023-10-16 14:29:16', '2023-10-16 14:29:16', 0, 0),
(101, 'SÚNG BẮN BÀI KAITOU KID', 2000000, 30, 'uploads/phukien_kaitoukid.jpg', '', 38, '2023-10-16 14:06:18', '2023-10-16 14:06:18', 0, 0),
(102, 'ĐỒNG HỒ GÂY MÊ DETECTIVE CONAN', 500000, 300, 'uploads/phukien_conan1.jpg', '', 38, '2023-10-16 14:40:20', '2023-10-16 14:40:20', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(7, 'Nguyễn Đăng Thành', 'AdminThanh', 'thanh1010', '+84387578520', 'bossryo68@gmail.com'),
(8, 'thanh dang', 'thanhthanh', 'thanhthanh', '0387578520', 'bossryo6811@gmail.com'),
(59, 'sin ', 'taolasin1678', 'dntd1234', '0364655292', 'datd9079@gmail.com'),
(60, 'Dang Nguyen Tien Dat', 'taoladat1678', 'dntd1234', '0364655292', 'datdDNTD@gmail.com'),
(81, 'nak', 'nak11111', '111111111', '555555', 'loif@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
