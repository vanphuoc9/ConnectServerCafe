/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     17/07/2018 2:57:59 PM                        */
/*==============================================================*/


drop table if exists BAN;

drop table if exists BINHLUAN;

drop table if exists CA;

drop table if exists CONGVIEC;

drop table if exists CT_DM;

drop table if exists CT_DV;

drop table if exists DANGKY;

drop table if exists DGL;

drop table if exists DICHVU;

drop table if exists DIEM;

drop table if exists DIEMDANH;

drop table if exists HOADON;

drop table if exists KHUYENMAI;

drop table if exists LOAIMON;

drop table if exists MON;

drop table if exists MON_NGUYENLIEU;

drop table if exists NGAY;

drop table if exists NGUOIDUNG;

drop table if exists NGUYENLIEU;

drop table if exists NHAPNL;

drop table if exists THOIHAN;

/*==============================================================*/
/* Table: BAN                                                   */
/*==============================================================*/
create table BAN
(
   STTBAN               int not null,
   TRANGTHAI            varchar(100),
   primary key (STTBAN)
);

/*==============================================================*/
/* Table: BINHLUAN                                              */
/*==============================================================*/
create table BINHLUAN
(
   MABL                 int not null,
   MAND                 int not null,
   MAMON                int not null,
   NOIDUNG              text not null,
   CREATED_AT           timestamp,
   UPDATED_AT           timestamp,
   primary key (MABL)
);

/*==============================================================*/
/* Table: CA                                                    */
/*==============================================================*/
create table CA
(
   STTCA                int not null,
   TGBD                 datetime,
   TGKT                 datetime,
   HESO                 float,
   primary key (STTCA)
);

/*==============================================================*/
/* Table: CONGVIEC                                              */
/*==============================================================*/
create table CONGVIEC
(
   MACV                 int not null,
   TENCV                varchar(255),
   HESOCV               float,
   primary key (MACV)
);

/*==============================================================*/
/* Table: CT_DM                                                 */
/*==============================================================*/
create table CT_DM
(
   STT                  int not null,
   MAND                 int not null,
   MAMON                int not null,
   STTBAN               int not null,
   THOIGIAN             datetime,
   TRANGTHAI            varchar(100),
   SOLUONG              int,
   primary key (STT)
);

/*==============================================================*/
/* Table: CT_DV                                                 */
/*==============================================================*/
create table CT_DV
(
   MADV                 int not null,
   THOIHAN              int not null,
   GIADV                float(8,2) not null,
   primary key (MADV, THOIHAN)
);

/*==============================================================*/
/* Table: DANGKY                                                */
/*==============================================================*/
create table DANGKY
(
   MADV                 int not null,
   THOIHAN              int not null,
   MAND                 int not null,
   primary key (MADV, THOIHAN, MAND)
);

/*==============================================================*/
/* Table: DGL                                                   */
/*==============================================================*/
create table DGL
(
   NGAY                 datetime not null,
   DGL                  float not null,
   primary key (NGAY, DGL)
);

/*==============================================================*/
/* Table: DICHVU                                                */
/*==============================================================*/
create table DICHVU
(
   MADV                 int not null,
   TENDV                varchar(255) not null,
   MOTADV               text,
   primary key (MADV)
);

/*==============================================================*/
/* Table: DIEM                                                  */
/*==============================================================*/
create table DIEM
(
   MAMON                int not null,
   MAND                 int,
   DIEM                 int not null,
   primary key (MAMON)
);

/*==============================================================*/
/* Table: DIEMDANH                                              */
/*==============================================================*/
create table DIEMDANH
(
   STTCA                int not null,
   NGAY                 datetime not null,
   MAND                 int not null,
   CO                   int not null,
   primary key (STTCA, NGAY, MAND)
);

/*==============================================================*/
/* Table: HOADON                                                */
/*==============================================================*/
create table HOADON
(
   SOHD                 int not null,
   STT                  int not null,
   MAND                 int not null,
   THOIGIAN             datetime,
   TRIGIA               float(8,2),
   primary key (SOHD)
);

/*==============================================================*/
/* Table: KHUYENMAI                                             */
/*==============================================================*/
create table KHUYENMAI
(
   MAKM                 int not null,
   MADV                 int not null,
   MAND                 int not null,
   TENKM                varchar(255) not null,
   MOTAKM               text,
   HINHKM               varchar(255),
   primary key (MAKM)
);

/*==============================================================*/
/* Table: LOAIMON                                               */
/*==============================================================*/
create table LOAIMON
(
   MALOAI               int not null,
   TENLOAI              varchar(255) not null,
   HINH                 varchar(255),
   primary key (MALOAI)
);

/*==============================================================*/
/* Table: MON                                                   */
/*==============================================================*/
create table MON
(
   MAMON                int not null,
   MALOAI               int not null,
   TEN                  varchar(255) not null,
   HINH                 varchar(255) not null,
   MOTA                 text not null,
   DONGIA               float(8,2) not null,
   primary key (MAMON)
);

/*==============================================================*/
/* Table: MON_NGUYENLIEU                                        */
/*==============================================================*/
create table MON_NGUYENLIEU
(
   MANL                 int not null,
   MAMON                int not null,
   primary key (MANL, MAMON)
);

/*==============================================================*/
/* Table: NGAY                                                  */
/*==============================================================*/
create table NGAY
(
   NGAY                 datetime not null,
   primary key (NGAY)
);

/*==============================================================*/
/* Table: NGUOIDUNG                                             */
/*==============================================================*/
create table NGUOIDUNG
(
   MAND                 int not null,
   MACV                 int not null,
   TEN                  varchar(255) not null,
   EMAIL                varchar(255) not null,
   QUYEN                int not null,
   MATKHAU              varchar(255) not null,
   REMEMBER_TOKEN       varchar(200),
   primary key (MAND)
);

/*==============================================================*/
/* Table: NGUYENLIEU                                            */
/*==============================================================*/
create table NGUYENLIEU
(
   MANL                 int not null,
   TENNL                varchar(255) not null,
   GIA                  float(8,2) not null,
   primary key (MANL)
);

/*==============================================================*/
/* Table: NHAPNL                                                */
/*==============================================================*/
create table NHAPNL
(
   MANHAPNL             int not null,
   NGAYNHAP             timestamp not null,
   MANL                 int not null,
   SOLGNHAP             int not null,
   primary key (MANHAPNL, NGAYNHAP)
);

/*==============================================================*/
/* Table: THOIHAN                                               */
/*==============================================================*/
create table THOIHAN
(
   THOIHAN              int not null,
   primary key (THOIHAN)
);
-- AUTO_INCREMENT cho bảng `ban`
--
ALTER TABLE `ban`
  MODIFY `STTBAN` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `MALOAI` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `mon`
--
ALTER TABLE `mon`
  MODIFY `MAMON` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `MAND` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  MODIFY `MANL` int(11) NOT NULL AUTO_INCREMENT;
--

--
-- Các ràng buộc cho các bảng đã đổ

alter table BINHLUAN add constraint FK_BINHLUAN foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table BINHLUAN add constraint FK_BINHLUAN_MON foreign key (MAMON)
      references MON (MAMON) on delete restrict on update restrict;

alter table CT_DM add constraint FK_BAN_DM foreign key (STTBAN)
      references BAN (STTBAN) on delete restrict on update restrict;

alter table CT_DM add constraint FK_CT_DM foreign key (MAMON)
      references MON (MAMON) on delete restrict on update restrict;

alter table CT_DM add constraint FK_NGUOIDUNG_DATMON foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table CT_DV add constraint FK_CT_THOIHAN foreign key (THOIHAN)
      references THOIHAN (THOIHAN) on delete restrict on update restrict;

alter table CT_DV add constraint FK_DV_CT foreign key (MADV)
      references DICHVU (MADV) on delete restrict on update restrict;

alter table DANGKY add constraint FK_DANGKY foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table DANGKY add constraint FK_DANGKY2 foreign key (MADV, THOIHAN)
      references CT_DV (MADV, THOIHAN) on delete restrict on update restrict;

alter table DGL add constraint FK_DGL_NGAY foreign key (NGAY)
      references NGAY (NGAY) on delete restrict on update restrict;

alter table DIEM add constraint FK_DIEM_MON foreign key (MAMON)
      references MON (MAMON) on delete restrict on update restrict;

alter table DIEM add constraint FK_RELATIONSHIP_22 foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table DIEMDANH add constraint FK_DIEMDANH_CA foreign key (STTCA)
      references CA (STTCA) on delete restrict on update restrict;

alter table DIEMDANH add constraint FK_DIEMDANH_NGAY foreign key (NGAY)
      references NGAY (NGAY) on delete restrict on update restrict;

alter table DIEMDANH add constraint FK_DIEMDANH_NV foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table HOADON add constraint FK_HOADON_DM foreign key (STT)
      references CT_DM (STT) on delete restrict on update restrict;

alter table HOADON add constraint FK_NHANVIEN_THANHTOAN foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table KHUYENMAI add constraint FK_KHUYENMAI_DV foreign key (MADV)
      references DICHVU (MADV) on delete restrict on update restrict;

alter table KHUYENMAI add constraint FK_KHUYENMAI_NGUOIDUNG foreign key (MAND)
      references NGUOIDUNG (MAND) on delete restrict on update restrict;

alter table MON add constraint FK_LOAI_MON foreign key (MALOAI)
      references LOAIMON (MALOAI) on delete restrict on update restrict;

alter table MON_NGUYENLIEU add constraint FK_MON_NGUYENLIEU foreign key (MANL)
      references NGUYENLIEU (MANL) on delete restrict on update restrict;

alter table MON_NGUYENLIEU add constraint FK_MON_NGUYENLIEU2 foreign key (MAMON)
      references MON (MAMON) on delete restrict on update restrict;

alter table NGUOIDUNG add constraint FK_CV_NHANVIEN foreign key (MACV)
      references CONGVIEC (MACV) on delete restrict on update restrict;

alter table NHAPNL add constraint FK_NHAP_NGUYENLIEU foreign key (MANL)
      references NGUYENLIEU (MANL) on delete restrict on update restrict;

