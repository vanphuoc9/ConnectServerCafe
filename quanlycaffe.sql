-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 18, 2018 lúc 05:42 SA
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
(1, 0),
(2, 1),
(3, 1),
(4, 0),
(5, 0),
(6, 1),
(7, 0),
(8, 1),
(9, 0),
(10, 0);

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
  `MAND` int(11) NOT NULL,
  `THOIGIAN` datetime DEFAULT NULL,
  `TRIGIA` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, NULL, 'Yen', 'yen@gmail.com', 1, '12345', NULL, 0),
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
  MODIFY `STT` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `dichvu`
--
ALTER TABLE `dichvu`
  MODIFY `MADV` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `SOHD` int(11) NOT NULL AUTO_INCREMENT;
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
