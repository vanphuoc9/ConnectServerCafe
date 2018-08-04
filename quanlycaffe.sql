-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 04, 2018 lúc 04:59 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlycaffe`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CapNhatHoaDon` (IN `mahd` INT)  begin
	declare tong float;
	select sum(`ct_dm`.soluong*mon.dongia) into tong 
								from `ct_dm` join ban on `ct_dm`.STTBAN = ban.STTBAN 
								join mon on `ct_dm`.MAMON = mon.MAMON
								where `ct_dm`.sohd = mahd
								group by `ct_dm`.sohd;

	update hoadon set trigia = tong where sohd = mahd;
	
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CapNhatSoLuongMon` (IN `mand` INT, IN `mon` INT, IN `sttban` INT, IN `hd` INT, IN `thoigian` DATETIME, IN `trangthai` INT, IN `soluong` INT)  begin
	delete from `ct_dm` where sohd = hd and mamon = mon;
	insert into `ct_dm`(mand,mamon,sttban,sohd,thoigian,trangthai,soluong) values(mand,mon,sttban,hd,thoigian,trangthai,soluong);
	call CapNhatHoaDon(hd);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CapNhatTrangThaiHoaDon` (IN `mahd` INT, IN `soban` INT, IN `ttHoaDon` INT, IN `ttBan` INT)  begin
	update `ct_dm` set trangthai = ttHoaDon where sohd = mahd;
	update ban set trangthai = ttBan where sttban = soban;
	
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TimKiemMon` (IN `keyword` VARCHAR(50))  begin
	select * from mon 
    where ten like CONCAT('%',keyword,'%') or mamon like CONCAT('%',keyword,'%') 
	or maloai like CONCAT('%',keyword,'%') or dongia like CONCAT('%',keyword,'%') limit 6;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `XoaMon` (IN `mon` INT, IN `hd` INT, IN `soban` INT)  begin
    if exists(select * from `ct_dm` where sohd = hd)
		then
			delete from `ct_dm` where sohd = hd and mamon = mon;
			
			if exists(select * from `ct_dm` where sohd = hd)
				then
					call CapNhatHoaDon(hd);
				else
					delete from hoadon where sohd = hd;
					update ban set trangthai = 0 where sttban = soban;
			end if;
	end if;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ban`
--

CREATE TABLE `ban` (
  `STTBAN` int(11) NOT NULL,
  `TRANGTHAI` int(100) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ban`
--

INSERT INTO `ban` (`STTBAN`, `TRANGTHAI`) VALUES
(1, 1),
(2, 1),
(3, 0),
(4, 0),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `MABL` int(11) NOT NULL,
  `MAND` int(11) NOT NULL,
  `MAMON` int(11) NOT NULL,
  `NOIDUNG` text NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ca`
--

CREATE TABLE `ca` (
  `STTCA` int(11) NOT NULL,
  `TGBD` datetime DEFAULT NULL,
  `TGKT` datetime DEFAULT NULL,
  `HESO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congviec`
--

CREATE TABLE `congviec` (
  `MACV` int(11) NOT NULL,
  `TENCV` varchar(255) DEFAULT NULL,
  `HESOCV` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_dm`
--

CREATE TABLE `ct_dm` (
  `STT` int(11) NOT NULL,
  `MAND` int(11) NOT NULL,
  `MAMON` int(11) NOT NULL,
  `STTBAN` int(11) DEFAULT NULL,
  `SOHD` int(11) NOT NULL,
  `THOIGIAN` datetime DEFAULT NULL,
  `TRANGTHAI` int(100) NOT NULL DEFAULT '0',
  `SOLUONG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ct_dm`
--

INSERT INTO `ct_dm` (`STT`, `MAND`, `MAMON`, `STTBAN`, `SOHD`, `THOIGIAN`, `TRANGTHAI`, `SOLUONG`) VALUES
(3, 2, 5, 1, 7, '2018-07-01 02:22:00', 0, 1),
(4, 3, 4, 5, 4, '2018-07-18 14:17:28', 0, 1),
(5, 3, 5, 5, 4, '2018-07-18 14:17:28', 0, 1),
(6, 3, 3, 10, 3, '2018-07-18 14:18:29', 0, 4),
(7, 3, 5, 10, 3, '2018-07-18 14:18:29', 0, 1),
(8, 3, 6, 10, 3, '2018-07-18 14:18:29', 0, 6),
(9, 3, 4, 7, 2, '2018-07-18 14:25:33', 0, 1),
(17, 3, 3, 3, 20, '2018-07-19 14:41:11', 1, 1),
(18, 3, 5, 3, 20, '2018-07-19 14:41:11', 1, 4),
(19, 3, 4, 3, 20, '2018-07-19 14:42:08', 1, 3),
(21, 3, 3, 8, 21, '2018-07-20 09:17:56', 0, 1),
(22, 3, 3, 8, 21, '2018-07-20 09:18:41', 0, 1),
(28, 3, 4, 8, 21, '2018-07-20 13:13:43', 0, 1),
(29, 3, 5, 8, 21, '2018-07-20 13:13:43', 0, 3),
(30, 3, 3, 1, 7, '2018-07-20 13:19:36', 0, 1),
(52, 4, 3, 6, 22, '2018-07-31 12:58:38', 1, 1),
(53, 4, 3, 6, 22, '2018-07-31 12:59:38', 1, 1),
(54, 4, 4, 6, 22, '2018-07-31 13:00:33', 1, 1),
(55, 4, 3, 6, 22, '2018-07-31 13:00:55', 1, 1),
(56, 4, 4, 6, 22, '2018-07-31 13:22:46', 1, 2),
(57, 4, 4, 6, 22, '2018-08-01 10:09:54', 1, 2),
(58, 4, 3, 6, 23, '2018-08-01 10:14:09', 0, 2),
(59, 4, 6, 6, 23, '2018-08-01 10:14:21', 0, 4),
(87, 4, 6, 4, 16, '2018-08-03 10:05:07', 1, 2),
(88, 4, 4, 2, 24, '2018-08-03 10:08:57', 0, 2),
(89, 4, 4, 2, 24, '2018-08-03 10:13:07', 0, 3),
(90, 4, 6, 2, 24, '2018-08-03 10:13:07', 0, 1),
(91, 4, 5, 9, 25, '2018-08-04 09:55:42', 0, 1),
(92, 4, 7, 9, 25, '2018-08-04 09:55:42', 0, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ct_dv`
--

CREATE TABLE `ct_dv` (
  `MADV` int(11) NOT NULL,
  `THOIHAN` int(11) NOT NULL,
  `GIADV` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dangky`
--

CREATE TABLE `dangky` (
  `MADV` int(11) NOT NULL,
  `THOIHAN` int(11) NOT NULL,
  `MAND` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dgl`
--

CREATE TABLE `dgl` (
  `NGAY` datetime NOT NULL,
  `DGL` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dichvu`
--

CREATE TABLE `dichvu` (
  `MADV` int(11) NOT NULL,
  `TENDV` varchar(255) NOT NULL,
  `MOTADV` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem`
--

CREATE TABLE `diem` (
  `MAMON` int(11) NOT NULL,
  `MAND` int(11) DEFAULT NULL,
  `DIEM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diemdanh`
--

CREATE TABLE `diemdanh` (
  `STTCA` int(11) NOT NULL,
  `NGAY` datetime NOT NULL,
  `MAND` int(11) NOT NULL,
  `CO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `SOHD` int(11) NOT NULL,
  `MAND` int(11) DEFAULT NULL,
  `THOIGIAN` datetime DEFAULT NULL,
  `TRIGIA` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`SOHD`, `MAND`, `THOIGIAN`, `TRIGIA`) VALUES
(1, 4, '2018-07-18 03:15:00', 999999.99),
(2, NULL, NULL, 120000),
(3, NULL, NULL, 1200),
(4, NULL, NULL, 130000),
(6, NULL, NULL, 143000),
(7, NULL, NULL, 46000),
(8, NULL, NULL, 12),
(9, NULL, NULL, 69000),
(10, NULL, NULL, 189000),
(11, NULL, NULL, 120000),
(12, NULL, NULL, 240000),
(13, NULL, NULL, 23000),
(14, NULL, NULL, 120000),
(15, NULL, NULL, 120000),
(16, NULL, NULL, 80000),
(18, NULL, NULL, 130000),
(19, NULL, NULL, 130000),
(20, NULL, NULL, 115000),
(21, NULL, NULL, 235000),
(22, NULL, NULL, 669000),
(23, NULL, NULL, 206000),
(24, NULL, NULL, 640000),
(25, NULL, NULL, 29000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `MAKM` int(11) NOT NULL,
  `MADV` int(11) NOT NULL,
  `MAND` int(11) NOT NULL,
  `TENKM` varchar(255) NOT NULL,
  `MOTAKM` text,
  `HINHKM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaimon`
--

CREATE TABLE `loaimon` (
  `MALOAI` int(11) NOT NULL,
  `TENLOAI` varchar(255) NOT NULL,
  `HINH` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `loaimon`
--

INSERT INTO `loaimon` (`MALOAI`, `TENLOAI`, `HINH`) VALUES
(1, 'Nước Đá', 'https://duckickfit.vn/upload/product/post_3-phuong-phap-giam-beo-bang-da-lanh-112733140917.png'),
(2, 'Caffe', 'https://duckickfit.vn/upload/product/post_3-phuong-phap-giam-beo-bang-da-lanh-112733140917.png'),
(3, 'Món Hàn', 'http://admin.bigmua.com/public/media/media/content/chuot/ct51383406848.jpg'),
(4, 'Pessi', 'http://admin.bigmua.com/public/media/media/content/chuot/ct51383406848.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon`
--

CREATE TABLE `mon` (
  `MAMON` int(11) NOT NULL,
  `MALOAI` int(11) NOT NULL,
  `TEN` varchar(255) NOT NULL,
  `HINH` varchar(255) NOT NULL,
  `MOTA` text NOT NULL,
  `DONGIA` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mon`
--

INSERT INTO `mon` (`MAMON`, `MALOAI`, `TEN`, `HINH`, `MOTA`, `DONGIA`) VALUES
(3, 1, 'Trà đá', 'https://duckickfit.vn/upload/product/post_3-phuong-phap-giam-beo-bang-da-lanh-112733140917.png', 'Trà đá', 23000.00),
(4, 1, 'Caffe Trung Nguyen ', 'https://donglucshop.vn/apt-upload/image/data/hinh-anh-uong-cafe-dung-cach-rat-co-loi-cho-nguoi-tap-the-hinh-2.png', 'Cafe Trung Nguyen', 120000.00),
(5, 1, 'Caffe Trung Nguyen 1', 'https://donglucshop.vn/apt-upload/image/data/hinh-anh-uong-cafe-dung-cach-rat-co-loi-cho-nguoi-tap-the-hinh-2.png', 'Cafe Trung Nguyen 1', 23000.00),
(6, 1, 'Caffe Trung Nguyen 2', 'https://donglucshop.vn/apt-upload/image/data/hinh-anh-uong-cafe-dung-cach-rat-co-loi-cho-nguoi-tap-the-hinh-2.png', 'Cafe Trung Nguyen 2', 40000.00),
(7, 1, 'Caffe Trung Nguyen 3', 'https://donglucshop.vn/apt-upload/image/data/hinh-anh-uong-cafe-dung-cach-rat-co-loi-cho-nguoi-tap-the-hinh-2.png', 'Cafe Trung Nguyen 3', 6000.00),
(8, 1, 'Caffe Trung Nguyen 4', 'https://donglucshop.vn/apt-upload/image/data/hinh-anh-uong-cafe-dung-cach-rat-co-loi-cho-nguoi-tap-the-hinh-2.png', 'Cafe Trung Nguyen 4', 70000.00),
(9, 1, 'Trà đá 1', 'https://duckickfit.vn/upload/product/post_3-phuong-phap-giam-beo-bang-da-lanh-112733140917.png', 'Trà đá 1', 2000.00),
(10, 1, 'Trà đá 3', 'https://duckickfit.vn/upload/product/post_3-phuong-phap-giam-beo-bang-da-lanh-112733140917.png', 'Trà đá 3', 23000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_nguyenlieu`
--

CREATE TABLE `mon_nguyenlieu` (
  `MANL` int(11) NOT NULL,
  `MAMON` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ngay`
--

CREATE TABLE `ngay` (
  `NGAY` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `MAND` int(11) NOT NULL,
  `MACV` int(11) DEFAULT NULL,
  `TEN` varchar(255) NOT NULL,
  `EMAIL` varchar(255) NOT NULL,
  `QUYEN` int(11) NOT NULL,
  `MATKHAU` varchar(255) NOT NULL,
  `REMEMBER_TOKEN` varchar(200) DEFAULT NULL,
  `XACNHAN` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`MAND`, `MACV`, `TEN`, `EMAIL`, `QUYEN`, `MATKHAU`, `REMEMBER_TOKEN`, `XACNHAN`) VALUES
(2, NULL, 'Phuoc', 'phuoc@gmail.com', 1, '12345', NULL, 0),
(3, NULL, 'Yen', 'yen@gmail.com', 1, '12345', NULL, 1),
(4, NULL, 'Nghia', 'nghia', 0, '12345', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguyenlieu`
--

CREATE TABLE `nguyenlieu` (
  `MANL` int(11) NOT NULL,
  `TENNL` varchar(255) NOT NULL,
  `GIA` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhapnl`
--

CREATE TABLE `nhapnl` (
  `MANHAPNL` int(11) NOT NULL,
  `NGAYNHAP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MANL` int(11) NOT NULL,
  `SOLGNHAP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thoihan`
--

CREATE TABLE `thoihan` (
  `THOIHAN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`STTBAN`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`MABL`),
  ADD KEY `FK_BINHLUAN` (`MAND`),
  ADD KEY `FK_BINHLUAN_MON` (`MAMON`);

--
-- Chỉ mục cho bảng `ca`
--
ALTER TABLE `ca`
  ADD PRIMARY KEY (`STTCA`);

--
-- Chỉ mục cho bảng `congviec`
--
ALTER TABLE `congviec`
  ADD PRIMARY KEY (`MACV`);

--
-- Chỉ mục cho bảng `ct_dm`
--
ALTER TABLE `ct_dm`
  ADD PRIMARY KEY (`STT`),
  ADD KEY `FK_BAN_DM` (`STTBAN`),
  ADD KEY `FK_CT_DM` (`MAMON`),
  ADD KEY `FK_NGUOIDUNG_DATMON` (`MAND`),
  ADD KEY `FK_HOADON_DM` (`SOHD`);

--
-- Chỉ mục cho bảng `ct_dv`
--
ALTER TABLE `ct_dv`
  ADD PRIMARY KEY (`MADV`,`THOIHAN`),
  ADD KEY `FK_CT_THOIHAN` (`THOIHAN`);

--
-- Chỉ mục cho bảng `dangky`
--
ALTER TABLE `dangky`
  ADD PRIMARY KEY (`MADV`,`THOIHAN`,`MAND`),
  ADD KEY `FK_DANGKY` (`MAND`);

--
-- Chỉ mục cho bảng `dgl`
--
ALTER TABLE `dgl`
  ADD PRIMARY KEY (`NGAY`,`DGL`);

--
-- Chỉ mục cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  ADD PRIMARY KEY (`MADV`);

--
-- Chỉ mục cho bảng `diem`
--
ALTER TABLE `diem`
  ADD PRIMARY KEY (`MAMON`),
  ADD KEY `FK_RELATIONSHIP_22` (`MAND`);

--
-- Chỉ mục cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD PRIMARY KEY (`STTCA`,`NGAY`,`MAND`),
  ADD KEY `FK_DIEMDANH_NGAY` (`NGAY`),
  ADD KEY `FK_DIEMDANH_NV` (`MAND`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`SOHD`),
  ADD KEY `FK_NHANVIEN_THANHTOAN` (`MAND`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`MAKM`),
  ADD KEY `FK_KHUYENMAI_DV` (`MADV`),
  ADD KEY `FK_KHUYENMAI_NGUOIDUNG` (`MAND`);

--
-- Chỉ mục cho bảng `loaimon`
--
ALTER TABLE `loaimon`
  ADD PRIMARY KEY (`MALOAI`);

--
-- Chỉ mục cho bảng `mon`
--
ALTER TABLE `mon`
  ADD PRIMARY KEY (`MAMON`),
  ADD KEY `FK_LOAI_MON` (`MALOAI`);

--
-- Chỉ mục cho bảng `mon_nguyenlieu`
--
ALTER TABLE `mon_nguyenlieu`
  ADD PRIMARY KEY (`MANL`,`MAMON`),
  ADD KEY `FK_MON_NGUYENLIEU2` (`MAMON`);

--
-- Chỉ mục cho bảng `ngay`
--
ALTER TABLE `ngay`
  ADD PRIMARY KEY (`NGAY`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`MAND`),
  ADD KEY `FK_CV_NHANVIEN` (`MACV`);

--
-- Chỉ mục cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  ADD PRIMARY KEY (`MANL`);

--
-- Chỉ mục cho bảng `nhapnl`
--
ALTER TABLE `nhapnl`
  ADD PRIMARY KEY (`MANHAPNL`,`NGAYNHAP`),
  ADD KEY `FK_NHAP_NGUYENLIEU` (`MANL`);

--
-- Chỉ mục cho bảng `thoihan`
--
ALTER TABLE `thoihan`
  ADD PRIMARY KEY (`THOIHAN`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ban`
--
ALTER TABLE `ban`
  MODIFY `STTBAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `MABL` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `ca`
--
ALTER TABLE `ca`
  MODIFY `STTCA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `congviec`
--
ALTER TABLE `congviec`
  MODIFY `MACV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `ct_dm`
--
ALTER TABLE `ct_dm`
  MODIFY `STT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `MADV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `SOHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `MAKM` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `loaimon`
--
ALTER TABLE `loaimon`
  MODIFY `MALOAI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `mon`
--
ALTER TABLE `mon`
  MODIFY `MAMON` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MAND` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  MODIFY `MANL` int(11) NOT NULL AUTO_INCREMENT;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `FK_BINHLUAN` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`),
  ADD CONSTRAINT `FK_BINHLUAN_MON` FOREIGN KEY (`MAMON`) REFERENCES `mon` (`MAMON`);

--
-- Các ràng buộc cho bảng `ct_dm`
--
ALTER TABLE `ct_dm`
  ADD CONSTRAINT `FK_BAN_DM` FOREIGN KEY (`STTBAN`) REFERENCES `ban` (`STTBAN`),
  ADD CONSTRAINT `FK_CT_DM` FOREIGN KEY (`MAMON`) REFERENCES `mon` (`MAMON`),
  ADD CONSTRAINT `FK_HOADON_DM` FOREIGN KEY (`SOHD`) REFERENCES `hoadon` (`SOHD`),
  ADD CONSTRAINT `FK_NGUOIDUNG_DATMON` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`);

--
-- Các ràng buộc cho bảng `ct_dv`
--
ALTER TABLE `ct_dv`
  ADD CONSTRAINT `FK_CT_THOIHAN` FOREIGN KEY (`THOIHAN`) REFERENCES `thoihan` (`THOIHAN`),
  ADD CONSTRAINT `FK_DV_CT` FOREIGN KEY (`MADV`) REFERENCES `dichvu` (`MADV`);

--
-- Các ràng buộc cho bảng `dangky`
--
ALTER TABLE `dangky`
  ADD CONSTRAINT `FK_DANGKY` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`),
  ADD CONSTRAINT `FK_DANGKY2` FOREIGN KEY (`MADV`,`THOIHAN`) REFERENCES `ct_dv` (`MADV`, `THOIHAN`);

--
-- Các ràng buộc cho bảng `dgl`
--
ALTER TABLE `dgl`
  ADD CONSTRAINT `FK_DGL_NGAY` FOREIGN KEY (`NGAY`) REFERENCES `ngay` (`NGAY`);

--
-- Các ràng buộc cho bảng `diem`
--
ALTER TABLE `diem`
  ADD CONSTRAINT `FK_DIEM_MON` FOREIGN KEY (`MAMON`) REFERENCES `mon` (`MAMON`),
  ADD CONSTRAINT `FK_RELATIONSHIP_22` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`);

--
-- Các ràng buộc cho bảng `diemdanh`
--
ALTER TABLE `diemdanh`
  ADD CONSTRAINT `FK_DIEMDANH_CA` FOREIGN KEY (`STTCA`) REFERENCES `ca` (`STTCA`),
  ADD CONSTRAINT `FK_DIEMDANH_NGAY` FOREIGN KEY (`NGAY`) REFERENCES `ngay` (`NGAY`),
  ADD CONSTRAINT `FK_DIEMDANH_NV` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `FK_NHANVIEN_THANHTOAN` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`);

--
-- Các ràng buộc cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD CONSTRAINT `FK_KHUYENMAI_DV` FOREIGN KEY (`MADV`) REFERENCES `dichvu` (`MADV`),
  ADD CONSTRAINT `FK_KHUYENMAI_NGUOIDUNG` FOREIGN KEY (`MAND`) REFERENCES `nguoidung` (`MAND`);

--
-- Các ràng buộc cho bảng `mon`
--
ALTER TABLE `mon`
  ADD CONSTRAINT `FK_LOAI_MON` FOREIGN KEY (`MALOAI`) REFERENCES `loaimon` (`MALOAI`);

--
-- Các ràng buộc cho bảng `mon_nguyenlieu`
--
ALTER TABLE `mon_nguyenlieu`
  ADD CONSTRAINT `FK_MON_NGUYENLIEU` FOREIGN KEY (`MANL`) REFERENCES `nguyenlieu` (`MANL`),
  ADD CONSTRAINT `FK_MON_NGUYENLIEU2` FOREIGN KEY (`MAMON`) REFERENCES `mon` (`MAMON`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `FK_CV_NHANVIEN` FOREIGN KEY (`MACV`) REFERENCES `congviec` (`MACV`);

--
-- Các ràng buộc cho bảng `nhapnl`
--
ALTER TABLE `nhapnl`
  ADD CONSTRAINT `FK_NHAP_NGUYENLIEU` FOREIGN KEY (`MANL`) REFERENCES `nguyenlieu` (`MANL`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
