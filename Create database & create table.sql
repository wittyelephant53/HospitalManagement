﻿
CREATE DATABASE QLBV
GO
-- Bảng KHOA_PHONGBAN
CREATE TABLE KHOA_PHONGBAN (
    makhoa_pb VARCHAR(4) PRIMARY KEY,
    tenkhoa_pb NVARCHAR(50)
);

-- Bảng NHANVIEN
CREATE TABLE NHANVIEN (
    manv VARCHAR(6) PRIMARY KEY,
    hotennv NVARCHAR(50),
    ngaysinh DATE,
    diachi NVARCHAR(100),
    nu BIT,
    sodienthoai VARCHAR(10),
    mucluong INT,
    makhoa_pb VARCHAR(4)
);

-- Bảng BACSI
CREATE TABLE BACSI (
    manv VARCHAR(6) PRIMARY KEY,
    hocvi VARCHAR(10),
    mahnbs VARCHAR(20)
);

-- Bảng DIEUDUONG
CREATE TABLE DIEUDUONG (
    manv VARCHAR(6) PRIMARY KEY,
    maccdd VARCHAR(20)
);

-- Bảng PHONGBENH
CREATE TABLE PHONGBENH (
    maphong VARCHAR(5) PRIMARY KEY,
    loaiphong NVARCHAR(10),
    succhua INT
);

-- Bảng QUANLY_PHONGBENH
CREATE TABLE QUANLY_PHONGBENH (
    manvdd VARCHAR(6),
    maphong VARCHAR(5),
    sogiotuan INT,
    PRIMARY KEY (manvdd, maphong)
);

-- Bảng PHIEUKHAM
CREATE TABLE PHIEUKHAM (
    maphieu VARCHAR(6) PRIMARY KEY,
    ngaykham DATE,
    mabs VARCHAR(6),
    mabn VARCHAR(6)
);

-- Bảng BỆNH
CREATE TABLE BENH (
    mabenh VARCHAR(6) PRIMARY KEY,
    tenbenh NVARCHAR(20)
);

-- Bảng TOATHUOC
CREATE TABLE TOATHUOC (
    matoa VARCHAR(6) PRIMARY KEY,
    ngaylap DATE,
    mapk VARCHAR(6)
);

-- Bảng THUOC
CREATE TABLE THUOC (
    mathuoc VARCHAR(6) PRIMARY KEY,
    tenthuoc NVARCHAR(20),
    dvt NVARCHAR(10),
    dongia INT
);

-- Bảng CHITIETTOATHUOC
CREATE TABLE CHITIETTOATHUOC (
    matoa VARCHAR(6),
    mathuoc VARCHAR(6),
    lieuluong NVARCHAR(50),
    PRIMARY KEY (matoa, mathuoc)
);

-- Bảng CHANDOAN
CREATE TABLE CHANDOAN (
    maphieu VARCHAR(6),
    mabenh VARCHAR(6),
    PRIMARY KEY (maphieu, mabenh)
);

-- Bảng BENHNHAN
CREATE TABLE BENHNHAN (
    mabn VARCHAR(6) PRIMARY KEY,
    hotenbn NVARCHAR(50),
    sdt VARCHAR(10),
    ngaysinh DATE,
    diachi NVARCHAR(100),
    nu BIT,
    CCCD VARCHAR(12),
    BHYT VARCHAR(20)
);

-- Bảng HOADON
CREATE TABLE HOADON (
    mahd VARCHAR(10) PRIMARY KEY,
    ngaylaphoadon DATE,
    mabn VARCHAR(6),
    tien INT,
    mapxv VARCHAR(6)
);


-- Bảng THANNHAN
CREATE TABLE THANNHAN (
    matn VARCHAR(6) PRIMARY KEY,
    hotentn NVARCHAR(50),
    mqh NVARCHAR(10),
    sdt VARCHAR(10),
    mabenhnhan VARCHAR(6) 
);

-- Bảng PHIEUXUATVIEN
CREATE TABLE PHIEUXUATVIEN (
    maphieu VARCHAR(6) PRIMARY KEY,
    ngaynhapvien DATE,
    ngayxuatvien DATE,
    mabn VARCHAR(6),
    maphong VARCHAR(5)
);

-- Ràng buộc FOREIGN KEY
-- Bảng NHANVIEN
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NhanVien_KhoaPhongBan FOREIGN KEY (makhoa_pb)
REFERENCES KHOA_PHONGBAN(makhoa_pb);

-- Bảng BACSI
ALTER TABLE BACSI
ADD CONSTRAINT FK_BacSi_NhanVien FOREIGN KEY (manv)
REFERENCES NHANVIEN(manv);

-- Bảng DIEUDUONG
ALTER TABLE DIEUDUONG
ADD CONSTRAINT FK_DieuDuong_NhanVien FOREIGN KEY (manv)
REFERENCES NHANVIEN(manv);

-- Bảng QUANLY_PHONGBENH
ALTER TABLE QUANLY_PHONGBENH
ADD CONSTRAINT FK_QuanLyPhongBenh_DieuDuong FOREIGN KEY (manvdd)
REFERENCES DIEUDUONG(manv);

ALTER TABLE QUANLY_PHONGBENH
ADD CONSTRAINT FK_QuanLyPhongBenh_PhongBenh FOREIGN KEY (maphong)
REFERENCES PHONGBENH(maphong);

-- Bảng PHIEUKHAM
ALTER TABLE PHIEUKHAM
ADD CONSTRAINT FK_PhieuKham_BacSi FOREIGN KEY (mabs)
REFERENCES BACSI(manv);

ALTER TABLE PHIEUKHAM
ADD CONSTRAINT FK_PhieuKham_BenhNhan FOREIGN KEY (mabn)
REFERENCES BENHNHAN(mabn);

-- Bảng TOATHUOC
ALTER TABLE TOATHUOC
ADD CONSTRAINT FK_ToaThuoc_PhieuKham FOREIGN KEY (mapk)
REFERENCES PHIEUKHAM(maphieu);

-- Bảng CHITIETTOATHUOC
ALTER TABLE CHITIETTOATHUOC
ADD CONSTRAINT FK_ChiTietToaThuoc_ToaThuoc FOREIGN KEY (matoa)
REFERENCES TOATHUOC(matoa);

ALTER TABLE CHITIETTOATHUOC
ADD CONSTRAINT FK_ChiTietToaThuoc_Thuoc FOREIGN KEY (mathuoc)
REFERENCES THUOC(mathuoc);

-- Bảng CHANDOAN
ALTER TABLE CHANDOAN
ADD CONSTRAINT FK_ChanDoan_PhieuKham FOREIGN KEY (maphieu)
REFERENCES PHIEUKHAM(maphieu);

ALTER TABLE CHANDOAN
ADD CONSTRAINT FK_ChanDoan_Benh FOREIGN KEY (mabenh)
REFERENCES BENH(mabenh);

-- Bảng THANNHAN
ALTER TABLE THANNHAN
ADD CONSTRAINT FK_ThanNhan_BenhNhan FOREIGN KEY (mabenhnhan)
REFERENCES BENHNHAN(mabn);

-- Bảng HOADON
ALTER TABLE HOADON
ADD CONSTRAINT FK_HoaDon_BenhNhan FOREIGN KEY (mabn)
REFERENCES BENHNHAN(mabn);

ALTER TABLE HOADON
ADD CONSTRAINT FK_HoaDon_PXV FOREIGN KEY (mapxv)
REFERENCES PHIEUXUATVIEN(maphieu);

-- Bảng PHIEUXUATVIEN
ALTER TABLE PHIEUXUATVIEN
ADD CONSTRAINT FK_PhieuXuatVien_BenhNhan FOREIGN KEY (mabn)
REFERENCES BENHNHAN(mabn);

ALTER TABLE PHIEUXUATVIEN
ADD CONSTRAINT FK_PhieuXuatVien_PhongBenh FOREIGN KEY (maphong)
REFERENCES PHONGBENH(maphong);
