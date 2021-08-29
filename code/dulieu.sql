-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 12, 2020 lúc 06:24 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dv`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `stk` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `chi_nhanh` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card`
--

CREATE TABLE `card` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `thucnhan` int(11) DEFAULT 0,
  `createdate` datetime DEFAULT NULL,
  `seri` varchar(64) DEFAULT NULL,
  `pin` varchar(64) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `note` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `code`, `img`, `note`) VALUES
(2, 'Dịch Vụ Facebook', 'dich-vu-facebook', 'https://i.imgur.com/EoRvO41.png', '<p><span style=\"font-size: 1rem;\">- Vui lòng nhập đầy đủ thông tin để chúng tôi xử lý giao dịch cho bạn.</span></p><p>- Trường hợp đơn hàng thiếu hoặc Link không hợp lệ, chúng tôi sẽ HỦY đơn hàng đó và tự động hoàn lại số dư về ví cho quý khách.</p><p>- Nếu quý khách có nhu cầu HỦY đơn hàng vì một lý do nào đó, xin vui lòng gửi hỗ trợ cho chúng tôi qua <a href=\"/ho-tro/create/\" target=\"_blank\">ĐÂY</a>, không hoàn tiền đối với trường hợp này.</p><p>- Nếu tăng <b>LIKE BÀI VIẾT</b>: vui lòng mở công khai bài viết để hệ thống tăng cho quý khách, EDIT quyền riêng tư vào <a href=\"https://www.facebook.com/settings?tab=privacy\" target=\"_blank\">ĐÂY</a>.</p><p>- Nếu tăng <b>THEO DÕI TRANG CÁ NHÂN</b>: vui lòng bật chức năng theo dõi và đảm bảo nick của bạn &gt;= 18 Tuổi, EDIT theo dõi tại <a href=\"https://www.facebook.com/settings?tab=followers\" target=\"_blank\">ĐÂY</a>.</p><p><span style=\"font-size: 1rem;\">- Nếu tăng </span><b style=\"font-size: 1rem;\">CMT</b><span style=\"font-size: 1rem;\">: vui lòng nhập cmt cần tăng tại ô </span><b style=\"font-size: 1rem;\">GHI CHÚ</b><span style=\"font-size: 1rem;\">, mỗi CMT cách nhau mỗi dấu phẩy (,).</span></p>'),
(5, 'Dịch Vụ Youtube', 'dich-vu-youtube', 'https://i.imgur.com/h4se7VH.png', ''),
(8, 'Dịch Vụ TikTok', 'dich-vu-tiktok', 'https://i.imgur.com/0rT4yUL.png', ''),
(9, 'Dịch Vụ Instagram', 'dich-vu-instagram', 'https://i.imgur.com/sRqpIt0.png', '<ul><li>Vui lòng kiểm tra thông tin trước khi chạy.</li><li>Tăng nhầm link chúng tôi sẽ không hoàn tiền.</li><li>Chúng tôi tăng theo số thứ tự đơn hàng.</li></ul>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `createdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `momo`
--

CREATE TABLE `momo` (
  `id` int(11) NOT NULL,
  `tranId` text CHARACTER SET utf8 DEFAULT NULL,
  `partnerId` text CHARACTER SET utf8 DEFAULT NULL,
  `partnerName` text CHARACTER SET utf8 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `comment` text CHARACTER SET utf8 DEFAULT NULL,
  `time` text CHARACTER SET utf8 DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `username` text DEFAULT NULL,
  `service_name` text DEFAULT NULL,
  `category_code` varchar(128) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `money` int(32) DEFAULT 0,
  `status` varchar(255) DEFAULT 'xuly',
  `note` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `note_status` text DEFAULT NULL,
  `ghichu` text DEFAULT NULL,
  `note_admin` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `code`, `username`, `service_name`, `category_code`, `service_id`, `amount`, `money`, `status`, `note`, `url`, `createdate`, `updatedate`, `note_status`, `ghichu`, `note_admin`) VALUES
(1, '54D1LH', 'admin', 'Tăng Follow Facebook', 'dich-vu-facebook', 23, 1000, 45000, 'hoantat', '', 'https://www.facebook.com/thangvip9x', '2020-10-12 11:05:04', '2020-10-12 23:00:50', NULL, '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reply_ticket`
--

CREATE TABLE `reply_ticket` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `createdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `stt` int(11) DEFAULT NULL,
  `category` varchar(128) DEFAULT '0',
  `name` text DEFAULT NULL,
  `money` int(12) DEFAULT 0,
  `content` longtext DEFAULT NULL,
  `status` varchar(32) DEFAULT 'show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `service`
--

INSERT INTO `service` (`id`, `stt`, `category`, `name`, `money`, `content`, `status`) VALUES
(23, 1, 'dich-vu-facebook', 'Tăng Follow Facebook ( Bảo Hành )', 50, '<p class=\"cl-red font-bold\" style=\"\">- Lưu ý: hệ thống hoạt động theo hình thức order tức là bạn order số lượng bao nhiêu thì hệ thống sẽ tự động lấy trong cơ sở dữ liệu ra số lượng người tương ứng để like, follow,... cho bạn.</p><p class=\"cl-red font-bold\" style=\"\">- Nên nếu nick của họ bị khóa (checkpoint) sau khi buff sẽ gây ra hiện tưởng tụt trong lúc buff là bình thường..</p><p class=\"cl-red font-bold\" style=\"\">- Do đó, vui lòng buff dư thêm 30 - 50% trên tổng số lượng để tránh tụt hoặc chọn gói bảo hành để được hoàn tiền nếu tụt.</p>', 'show'),
(24, 0, 'dich-vu-facebook', 'Like', 62, '', 'show'),
(25, 0, 'dich-vu-facebook', 'Tăng Follow Page', 60, '', 'show'),
(26, 0, 'dich-vu-youtube', 'Tăng View Youtobe', 100, '', 'show'),
(27, 0, 'dich-vu-tiktok', 'Follow Tik Tok', 60, '', 'show'),
(28, 0, 'dich-vu-tiktok', 'Tăng Like ', 35, '', 'show'),
(29, 0, 'dich-vu-instagram', 'Sub Intagram ( Không Bảo Hành )', 110, '<p><br></p>', 'show'),
(30, 0, 'dich-vu-instagram', 'Sub Íntagram ( Có Bảo Hành )', 165, '', 'show');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `tenweb` text DEFAULT NULL,
  `mota` text DEFAULT NULL,
  `tukhoa` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `baotri` varchar(32) DEFAULT 'OFF',
  `status_top` varchar(32) DEFAULT 'ON',
  `status_order` varchar(32) DEFAULT 'ON',
  `thongbao` text DEFAULT NULL,
  `thong_bao_chay` text DEFAULT NULL,
  `id_fb` text DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `cookie` text NOT NULL,
  `idbot` text DEFAULT NULL,
  `api` text DEFAULT NULL,
  `site_callback` text DEFAULT NULL,
  `img1` text DEFAULT NULL,
  `color` text DEFAULT NULL,
  `color1` text DEFAULT NULL,
  `color_login` text DEFAULT NULL,
  `currency` text DEFAULT NULL,
  `text_xac_minh_giao_dich` longtext DEFAULT NULL,
  `text_login` text DEFAULT NULL,
  `text_nap_tien` longtext DEFAULT NULL,
  `text_mail_order` text DEFAULT NULL,
  `min_order` int(11) DEFAULT 100,
  `ck_nap_the` int(11) DEFAULT 0,
  `keyMOMO` varchar(32) DEFAULT NULL,
  `site_gmail` varchar(32) DEFAULT NULL,
  `site_favicon` text DEFAULT NULL,
  `site_img` text DEFAULT NULL,
  `bg_login` text DEFAULT NULL,
  `site_gmail_momo` text DEFAULT NULL,
  `site_pass_momo` text DEFAULT NULL,
  `site_sdt_momo` text DEFAULT NULL,
  `site_ten_momo` text DEFAULT NULL,
  `site_qr_momo` text DEFAULT NULL,
  `site_noidung_momo` text DEFAULT NULL,
  `site_color_nav` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `setting`
--

INSERT INTO `setting` (`id`, `tenweb`, `mota`, `tukhoa`, `logo`, `baotri`, `status_top`, `status_order`, `thongbao`, `thong_bao_chay`, `id_fb`, `mail`, `phone`, `cookie`, `idbot`, `api`, `site_callback`, `img1`, `color`, `color1`, `color_login`, `currency`, `text_xac_minh_giao_dich`, `text_login`, `text_nap_tien`, `text_mail_order`, `min_order`, `ck_nap_the`, `keyMOMO`, `site_gmail`, `site_favicon`, `site_img`, `bg_login`, `site_gmail_momo`, `site_pass_momo`, `site_sdt_momo`, `site_ten_momo`, `site_qr_momo`, `site_noidung_momo`, `site_color_nav`) VALUES
(1, 'LOCALHOST', 'Dịch Vụ Mạng Xã Hội ', 'dvmxh, vip like, tăng follow, dịch vụ fb, dịch vụ instagram, dịch vụ mang xa hoi,', 'https://farm66.staticflickr.com/65535/50461572436_d51c000fc7_o.png', 'OFF', 'ON', 'ON', '<p>Hệ thống đang trong quá trình xây dựng</p>', 'Sub Like Giá Rẻ', 'https://www.facebook.com/thangvip9x', 'ntt2001811@gmail.com', '0947838128', '', NULL, '5900f9b6-d3c6-4234-ab14-5bec94a41037', 'http://localhost/callback.php', 'https://farm66.staticflickr.com/65535/50461945747_3b8925365b_o.jpg', '#2a5792', '#2a5792', '#00172f', 'VNĐ', '<p>- Bạn có chắc chắn muốn <b>THANH TOÁN</b> đơn hàng này ?</p><p>- Sau khi <b>THANH TOÁN</b> không thể tự <b>HỦY</b> mà phải thông qua <b>ADMIN</b>.</p><p>- Vui lòng <a href=\"/ho-tro/create/\" target=\"_blank\">liên hệ</a> chúng tôi để <b>HỦY</b> trước khi đơn hàng được chạy.</p>', '<h1 style=\"text-align: center; \"><font style=\"\" color=\"#ffffff\">Chào Mừng Bạn!</font></h1><h5 style=\"text-align: center;\"><font style=\"\" color=\"#ffffff\">Vui lòng đăng nhập để sử dụng hệ thống</font></h5>', '<ul><li>Vui lòng nhập chính xác nội dung chuyển khoản.</li><li>Nếu nạp thẻ vui lòng nạp đúng mệnh giá, sai mệnh giá mất thẻ.</li></ul>', '<h1>XIN CHÀO ANH/CHỊ!</h1><p><br></p><h2>Đơn hàng của Anh/Chị đã có kết quả ạ</h2><p><br></p><p>Cảm ơn Anh/Chị đã sử dụng dịch vụ.</p>', 100, 30, 'lzOWD1TkyoB1NqXe5EaYIxicPHFRVtGj', 'admin@tuoitreit.vn', 'https://farm66.staticflickr.com/65535/50461572436_d51c000fc7_o.png', 'https://farm66.staticflickr.com/65535/50461572436_d51c000fc7_o.png', 'https://farm66.staticflickr.com/65535/50461733841_b9ec905014_o.jpg', 'admin@tuoitreit.vn', 'testtest', '0981869555', 'Nguyen Huu Thang', '', 'HACK', '#ffffff');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `title` text NOT NULL,
  `content` longtext NOT NULL,
  `createdate` datetime NOT NULL,
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ticket`
--

INSERT INTO `ticket` (`id`, `username`, `title`, `content`, `createdate`, `status`) VALUES
(2, 'admin', 'Thử hệ thống', '<p><b>Thử nghiệm hệ thống</b></p>', '2020-10-12 23:22:46', 'xuly');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mail` text DEFAULT NULL,
  `money` int(11) DEFAULT 0,
  `total_nap` int(11) DEFAULT 0,
  `level` varchar(32) DEFAULT NULL,
  `banned` int(11) DEFAULT 0,
  `createdate` datetime DEFAULT NULL,
  `id_facebook` text DEFAULT NULL,
  `fullname` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `ck` int(11) DEFAULT 0,
  `token` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `mail`, `money`, `total_nap`, `level`, `banned`, `createdate`, `id_facebook`, `fullname`, `phone`, `ip`, `ck`, `token`) VALUES
(1007, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@tuoitreit.vn', 1000000000, 1000000000, 'admin', 0, '2020-08-27 14:08:36', '', '', '', '::1', 0, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`code`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_2` (`code`),
  ADD KEY `code` (`code`);

--
-- Chỉ mục cho bảng `reply_ticket`
--
ALTER TABLE `reply_ticket`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `momo`
--
ALTER TABLE `momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `reply_ticket`
--
ALTER TABLE `reply_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
