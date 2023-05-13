Create Database HotelNewWorld
go
use HotelNewWorld
go
Create Table NhanVien
(
	MaNv nchar(10) Primary key,
	MaChucVu nchar (10),
	MaBoPhan nchar (10),
	HoNv nvarchar(100),
	TenNv nvarchar (30), 
	GioiTinh nvarchar (20),
	NgaySinh datetime, 
	DiaChi nvarchar (150),
	DienThoai nvarchar(30),
	Email nvarchar (50)
)
go
Create Table KhachHang
(
	MaKh nchar (10) primary key,
	MaLoaiKhachHang nchar (10),
	HoKh nvarchar(100),
	TenKh nvarchar (30),
	GioiTinh nvarchar (20),
	DiaChi nvarchar (150),
	DienThooai nvarchar (30),
	Email nvarchar (50),
	CMND nchar (20)
)
go
Create Table ChucVu
(
	MaChucVu nchar (10) primary key,
	TenChucVu nvarchar (50)
)
go
Create Table BoPhan
(
	MaBoPhan nchar (10) primary key,
	TenBoPhan nvarchar(50),
	NgayThanhLap datetime
)
go
Create Table LoaiKhachHang
(
	MaLoaiKhachHang nchar (10) primary key,
	TenLoaiKhachHang nvarchar (50)
)
go
Create Table PhieuThuePhong
(
	MaPhieuThuePhong nchar (10) primary key,
	MaKh nchar (10),
)
go
Create Table PhieuNhanPhong
(
	MaPhieuNhanPhong nchar (10) primary key,
	MaPhieuThuePhong nchar (10)
)
go 
Create Table HoaDon
(
	MaHoaDon nchar (10) primary key,
	MaKH nchar (10),
	MaNV nchar (10),
	NgayLapHoaDon datetime 
)

go
Create Table ChiTietHoaDon
(
	MaCTHD nchar (10) primary key,
	MaHD nchar (10),
	DonGia float,
	
)
go
Create Table DichVu
(
	MaDichVu nchar (10) primary key,
	MaLoaiDichVu nchar (10),
	TenDichVu nvarchar (100)
)
go
Create Table LoaiDichVu
(
	MaLoaiDichVu nchar (10) primary key,
	DonGiaDichVu float,
	NgaySuDungDichVu datetime
)
go
Create Table TinhTrangPhong
(
	MaTinhTrangPhong nchar(10) primary key,
	TenTinhTrangPhong nvarchar (100)
)
go
Create Table Phong
(
	MaPhong nchar (10) primary key, 
	MaLoaiPhong nchar (10),
	MaTinhTrangPhong nchar(10),
	SoGiuong int
)
go
Create Table ChiTietPhieuNhanPhong
(
	MaPhieuNhanPhong nchar (10),
	MaHoaDon nchar (10),
	MaDichVu nchar (10),
	NgayNhanPhong datetime
	Primary key (MaPhieuNhanPhong,MaHoaDon,MaDichVu)
)
go
Create Table LoaiPhong
(
	MaLoaiPhong nchar (10) primary key,
	DonGiaPhong float,
	DonVi nvarchar (50),
	TenLoaiPhong nvarchar (100) 
)
go
Create Table ChiTietThuePhong
(
	MaPhong nchar (10),
	MaPhieuThuePhong nchar (10),
	NgayDangKiThuePhong datetime 
	primary key (MaPhong,MaPhieuThuePhong)
)
go

---- tạo ràng buộc  
alter table NhanVien add constraint FK_NhanVien_ChucVu foreign key (MaChucVu) references ChucVu (MaChucVu) 

go

alter table NhanVien add constraint FK_NhanVien_BoPhan foreign key (MaBoPhan) references BoPhan (MaBoPhan) 

go

alter table KhachHang add constraint FK_KhachHang_LKHACHHANGg foreign key (MaLoaiKhachHang) references LoaiKhachHang (MaLoaiKhachHang) 

go

alter table PhieuThuePhong add constraint FK_KhachHang_PhieuThuePhong foreign key (MaKH) references KhachHang (MaKH) 

go

alter table HoaDon add constraint FK_KhachHang_HoaDon foreign key (MaKH) references KhachHang (MaKH) 

go

alter table HoaDon add constraint FK_NhanVien_HoaDon foreign key (MaNV) references NhanVien (MaNV) 

go

alter table ChiTietHoaDon add constraint FK_HoaDon_CTHoaDon foreign key (MaHd) references HoaDon(MaHoaDon)

go

alter table PhieuNhanPhong add constraint FK_PhieuThuePhong_PhieuNhanPhong foreign key (MaPhieuThuePhong) references PhieuThuePhong(MaPhieuThuePhong)

go

alter table ChiTietPhieuNhanPhong add constraint FK_ChiTietPhieuNhanPhong_HoaDon foreign key (MaHoaDon) references HoaDon(MaHoaDon)

go

alter table ChiTietPhieuNhanPhong add constraint FK_ChiTietPhieuNhanPhong_PhieuNhanPhong foreign key (MaPhieuNhanPhong) references PhieuNhanPhong(MaPhieuNhanPhong)

go

alter table ChiTietPhieuNhanPhong add constraint FK_ChiTietPhieuNhanPhong_DichVu foreign key (MaDichVu) references DichVu(MaDichVu)

go

alter table DichVu add constraint FK_DichVu_LoaiDichVu foreign key (MaLoaiDichVu) references LoaiDichVu(MaLoaiDichVu)

go

alter table ChiTietThuePhong add constraint FK_PhieuThuePhong_ChiTietPhieuThuePhong foreign key (MaPhieuThuePhong) references PhieuThuePhong(MaPhieuThuePhong)

go

alter table ChiTietThuePhong add constraint FK_Phong_ChiTietPhieuThuePhong foreign key (MaPhong) references Phong(MaPhong)

go

alter table Phong add constraint FK_Phong_TinhTrangPhong foreign key (MaTinhTrangPhong) references TinhTrangPhong(MaTinhTrangPhong)

go

alter table Phong add constraint FK_Phong_LoaiPhong foreign key (MaLoaiPhong) references LoaiPhong(MaLoaiPhong)

go
-- I) PHẦN RÀNG BUỘC MIỀN GIÁ TRỊ
--1.
ALTER TABLE Nhanvien
Add constraint chk_NV_Gioitinh check (Gioitinh in('Nam',N'Nữ',N'Khác'))
--2.
Alter table Khachhang
add constraint chk_kh_gioitinh check(Gioitinh in('Nam',N'Nữ',N'Khác'))
--3. 
alter table ChiTietHoaDon
add constraint chk_cthd_dongia check( Dongia>0)
--4.
alter table TinhtrangPhong
add constraint chk_ttphong_Tentinhtrang check(TentinhtrangPhong in(N'Phòng trống',N'Phòng đã có người đặt',N'Phòng đã có người ở'))
--5.
alter table Loaikhachhang
add constraint chk_loaikh_Tenlkh check(TenLoaiKhachHang IN (N'Vip',N'Thường'))
--6.
alter table LoaiPhong
add constraint chk_Loaiphong_DongiaPhong check (DonGiaPhong>0)
--7.
alter table LoaiDichVu
add constraint chk_Loaidv_Dgdichvu check(DongiaDichVu >=0)

--II) Phần Ràng buộc Liên thuộc tính, liên quan hệ
-- 1.Ngày chi tiết phiếu thuê  phòng  =< Ngày chi tiết phiếu nhận phòng
-- 2.Ngày sử dụng dịch vụ >= Ngày nhận phong
-- Chưa làm được
-- 3. Ngày nhận phòng Default = Ngày đăng ký thuê phòng

--III) RÀNG BUỘC LIÊN BỘ(ràng buộc duy nhất
--1.
alter table ChucVu
Add constraint U_ChucVu_Tencv Unique(TenChucVu)
--2.
alter table LoaiKhachHang
add constraint U_Loaikh_Tenloaikh Unique(TenLoaiKhachhang)
--3.
alter table TinhTrangPhong
add constraint U_TTPhong_Tenttphong Unique(TenTinhTrangPhong)
--4.
alter table DichVu
add constraint U_DichVu_Tendv Unique(Tendichvu)
--5.
alter table BoPhan
add constraint U_BoPhan_TenBP Unique(TenBoPhan)
--IV) RÀNG BUỘC MẶC ĐỊNH
--1. 
alter table Tinhtrangphong
add constraint def_TTPhong_TenttPhong default N'Phòng trống' for Tentinhtrangphong
--2.
alter table Chitiethoadon
add constraint def_CTHD_NgaylapHD default Getdate() for NgaylapHoadon




---- thêm dữ liệu





Insert INTO LoaiKhachHang
VALUES 
	('LKH01',N'Khách hàng mới'),
	('LKH02', N'Khách hàng VIP')


Insert INTO TinhTrangPhong
VALUES
	('TTP01', N'Phòng trống'),
	('TTP02', N'Phòng đã có người đặt'),
	('TTP03', N'Phòng đã có người ở')



Insert INTO LoaiPhong
VALUES 
	('LP001',1000000, N'Ngày', N'Phòng tiêu chuẩn'),
	('LP002',2000000, N'Ngày', N'Phòng cao cấp'),
	('LP003',4000000, N'Ngày', N'Phòng thương gia'),
	('LP004',7000000, N'Ngày', N'Phòng tổng thống')
	
Insert INTO Phong 
VALUES
	('P0001','LP001','TTP01',1),
	('P0002','LP002','TTP01',1),
	('P0003','LP003','TTP01',2),
	('P0004','LP004','TTP02',2),
	('P0005','LP001','TTP02',1),
	('P0006','LP002','TTP02',1),
	('P0007','LP003','TTP03',2),
	('P0008','LP004','TTP03',2),
	('P0009','LP001','TTP03',1),
	('P0010','LP002','TTP02',1),
	('P0011','LP003','TTP02',2),
	('P0012','LP004','TTP02',2),
	('P0013','LP001','TTP02',1),
	('P0014','LP002','TTP02',1),
	('P0015','LP003','TTP02',2),
	('P0016','LP004','TTP01',2),
	('P0017','LP001','TTP01',1),
	('P0018','LP002','TTP01',1),
	('P0019','LP003','TTP01',2),
	('P0020','LP004','TTP01',2),
	('P0021','LP001','TTP01',1),
	('P0022','LP002','TTP01',1),
	('P0023','LP003','TTP01',2),
	('P0024','LP004','TTP01',2),
	('P0025','LP001','TTP01',1),
	('P0026','LP002','TTP01',1),
	('P0027','LP003','TTP01',2),
	('P0028','LP004','TTP01',2),
	('P0029','LP001','TTP01',1),
	('P0030','LP002','TTP01',1),
	('P0031','LP003','TTP02',2),
	('P0032','LP004','TTP02',2),
	('P0033','LP001','TTP02',1),
	('P0034','LP002','TTP02',1),
	('P0035','LP003','TTP02',2),
	('P0036','LP004','TTP02',2),
	('P0037','LP001','TTP02',1),
	('P0038','LP002','TTP03',1),
	('P0039','LP003','TTP03',2),
	('P0040','LP004','TTP03',2),
	('P0041','LP001','TTP03',1),
	('P0042','LP002','TTP03',1),
	('P0043','LP003','TTP03',2),
	('P0044','LP004','TTP03',2),
	('P0045','LP001','TTP01',1),
	('P0046','LP002','TTP01',1),
	('P0047','LP003','TTP01',2),
	('P0048','LP004','TTP01',2),
	('P0049','LP004','TTP01',2),
	('P0050','LP004','TTP01',2)




Insert INTO ChucVu
VALUES
	('CV01', N'Giám đốc'),
	('CV02', N'Phó giám đốc'),
	('CV03', N'Trưởng phòng'),
	('CV04', N'Nhân viên')


Insert INTO BoPhan
VALUES 
	('BP01', N'Bộ phận điều hành','3/17/1992'),
	('BP02', N'Bộ phận lễ tân', '3/20/1992'),
	('BP03', N'Bộ phận buồng phòng', '3/23/1992'),
	('BP04', N'Bộ phận ẩm thực', '5/20/1992'),
	('BP05', N'Bộ phận bếp','5/2/1992'),
	('BP06', N'Bộ phận kinh doanh tiếp thị', '1/20/1992'),
	('BP07', N'Bộ phận tài chính - kế toán', '1/20/1992'),
	('BP08', N'Bộ phận hành chính - nhân sự','12/1/1992'),
	('BP09', N'Bộ phận kỹ thuật bảo trì', '4/22/1993'),
	('BP10', N'Bộ phận công nghệ thông tin', '7/16/1993'),
	('BP11', N'Bộ phận an ninh','12/12/1993'),
	('BP12',N'Bộ phận thể thao và giải trí', '1/1/1994')



Insert INTO NhanVien 
VALUES 
	('NV0005','CV04','BP02', N'Lê','Khôi', N'Nam','2/2/1997',
	N'90/50 Đỗ Thừa Luông TP HCM','09214355876','lekhoi@gmail.com'),
	('NV0006','CV04','BP02', N'Nguyễn Như', N'Quỳnh', N'Nữ','10/23/2001',
	N'1 Mộ Đức thành phố Quảng Ngãi','08253836382',N'nguyennhuquynh@gmail.com'),
	('NV0007','CV04','BP02', N'Nguyễn Thị Bích', N'Phượng',N'Nữ','04/18/2002',
	N'Đồng Nai',' 0933329203',N'nguyenthibichphuong@gmail.com'),
	('NV0001','CV03','BP01', N'Trần', N'Dần',N'DNam','8/10/1987',
	N'Ngõ 6,phố Thanh Xuân, Hà Nội','098123123',N'trandan1223@gmail.com'),
	('NV0002','CV02','BP01', N'Nguyễn Văn Tuấn', N'Minh', N'Nam','8/31/2002'
	,N'80 Tân Hương Phường Tân Quý,Quận Tân Phú, TP HCM','0123456789',N'nguyevantuanminh@gmail.com'),
	('NV0003','CV01','BP01', N'Đinh Ngọc Quỳnh', N'Trang', N'Nữ','7/3/2002',
	'263/2 Bình Thành, Phường BHH B, Quận Bình Tân, TP HCM','0124114142', N'dinhngocquynhmo@gmail.com'),
	('NV0004','CV04','BP01', N'Lê Nhật Đăng', N'Khoa', N'Nam','1/1/2001',
	N'21 Gò Dầu TP Bình Thuận','0823746191', N'dangkhoane@gmail.com'),
	('NV0008','CV04','BP02', N'Nguyễn Trịnh Thu', N'Ngân', N'Nữ','1/18/2002',
	N'60/40 Nguyễn Sơn Quận Tân Phú TP HCM','0963341637','nguyentrinhthungan@gmail.com'),
	('NV0009','CV01','BP03', N'Trần', N'Hoàng', N'Nam','4/6/2000',
	N'299/9/12 Bình Thành Quận Bình Tân TP HCM','03453415665','tranhoang@gmail.com'),
	('NV0010','CV02','BP03', N'Võ Quang', N'Đông', N'Nam','2/1/1999',
	N'2 Ngõ Hoàng Mai TP Hà Nội','09273483629','voquangdong@gmail.com'),
	('NV0011','CV03','BP03', N'Nguyễn Lâm Ánh', N'Đông', N'Nữ','8/21/2002',
	N'12 Bình Long TP HCM','0982637884837','nguyenlamanhdong@gmail.com'),
	('NV0012','CV04','BP03', N'Lê Trọng', N'Lân', N'Nam','12/31/2002',
	N'3 Lê Lai TP HCM','0923847021',''),
	('NV0013','CV01','BP04', N'Lê Nhật', N'Phi', N'Nam','7/12/2002',
	N'23/34/2 Tây Thạnh TP HCM','0712384957', N'lenhatphi@gmail.com'),
	('NV0014','CV02','BP04', N'Nguyễn Trần', N'Phi',N'Nam','4/1/2002',
	N'23/2 Lê Trọng Tấn','09218763872',N'nguyentranphi@gmail.com'),
	('NV0015','CV03','BP04', N'Nguyễn Thị Thuỳ', N'Tiên', N'Nữ','6/3/2002',
	N'83/12 Lê Lư TP HCM','092135873',N'nguyenthithuytien@gmail.com'),
	('NV0016','CV04','BP04', N'Nguyễn Minh', N'Trí', N'Nam', '9/22/2002',
	N'3/1 Lê Cao Lăng TP HCM','0712345674', 'nguyeminhtri@gmai.com'),
	('NV0017','CV01','BP05', N'Lê Đình', N'Quý', N'Nam','8/2/2002',
	N'2 Hoàng Diệu 2 TP HCM', '09123485032','ledinhquy@gmail.com'),
	('NV0018','CV02','BP05', N'Nguyền Đình', N'Thông', N'Nam','9/29/2002',
	N'34 Nguyễn Thái Học TP HCM','0928765289',N'nguyendinhthong@gmail.com'),
	('NV0019','CV03','BP05',N'Hồ Nguyễn', N'Như', N'Nữ','3/1/2002',
	N'45 Lê Thúc Hoạch','09128374812','honguyennhu@gmail.com'),
	('NV0020','CV01','BP06', N'Trần Ngọc Bảo',N'Hân',N'Nữ','6/12/2002',
	N'32 Lê Văn Việt TP HCM','0918274263','tranngocbaohan@gmail.com'),
	('NV0021','CV02','BP06', N'Võ Đình Gia', N'Huân', N'Nam','5/12/1999',
	N'32 D2 TP HCM','0918273648','vodinhgiahuan'),
	('NV0022','CV03','BP06',N'Nguyễn Tuệ',N'An',N'Nữ','3/21/2001',
	N'2 385 TP HCM','0982716282','nguyentuean@gmail.com'),
	('NV0023','CV04','BP06',N'Võ Hồng Khách',N'Vy',N'Nữ','2/21/2001',
	N'21 Tân Kỳ Tân Quý','0918273921','vohongkhachvy@gmail.com'),
	('NV0024','CV01','BP07', N'Nguyễn Phú', N'Lợi', N'Nam','5/23/2001',
	N'455 Phạm Thế Hiển TP C0912348503 HCM','09182137431','nguyenphuloi@gmail.com'),
	('NV0025','CV02','BP07', N'Trần Minh', N'Nhựt', N'Nam', '7/21/2001',
	N'2 Tân Quý TP HCM','09182723612','tranminhnnhut@gmail.com'),
	('NV0026','CV03','BP07', N'Trần Thuỳ Thanh', N'Tâm',N'Nữ','12/12/2001',
	N'21 Dương Văn Dương TP HCM','0921345325','tranthuythanhtam@gmail.com'),
	('NV0027','CV04','BP07',N'Võ Thị Bảo', N'Uyên', N'Nữ','3/12/2001',
	N'32 Đường số 3 TP HCM','091235423621','vothibaouyen@gmail.com'),
	('NV0028','CV01','BP08',N'Trần',N'Đức',N'Nam','4/22/2002',
	N'299/9/12 Bình Thành TP HCM','0764464486','trandc3015@gmail.com'),
	('NV0029','CV02','BP08',N'Đặng Thanh',N'Lam',N'Nữ','3/3/2001',
	N'12 Đường số 4 TP HCM','0911234567','dangthanhlam@gmail.com'),
	('NV0030','CV03','BP08',N'Lê',N'Trang',N'Nữ','1/12/2001',
	N'34 Ấp Chiến Lược TP HCM','0712387421','letrangne@gmail.com'),
	('NV0031','CV04','BP08',N'Nguyễn Thị Ngọc',N'Ánh',N'Nam', '6/12/2003',
	N'12 Nguyễn Huệ TP HCM','0812356432','nguyenthingocanh@gmail.com'),
	('NV0032','CV01','BP09',N'Trần', N'Nghĩa', N'Nam','2/7/1966',
	N'299/9/12 Bình Thành TP HCM','0902947079','trannghia@gmail.com'),
	('NV0033','CV02','BP09',N'Phan Thị Thanh', N'Hải', N'Nữ','2/6/2001',
	N'21/2 Lê Văn Sỹ TP HCM','0982123141','phanthithanhhai@gmail.com'),
	('NV0034','CV03','BP09', N'Nguyễn Đỗ Gia', N'Hân', N'Nữ', '12/12/2002',
	N'21/23 Lê Lợi TP HCM','0912872618','nguyendogiahan@gmail.com'),
	('NV0035','CV04','BP09', N'Mai Tăng Phú', N'Quý', N'Nam','2/12/2003',
	N'213 Trường Sa TP HCM','08172838942','maitangphuquy@gmail.com'),
	('NV0036','CV01','BP10', N'Bùi Thị Đoang',N'Trang',N'Nữ','7/16/1972',
	N'215/37 Huỳnh Văn Bánh TP HCM','0795051131','buithidoantrang@gmail.com'),
	('NV0037','CV02','BP10',N'Lê Trọng',N'Lân',N'Nam','12/12/2002',
	N'21 Tân Hương TPHCM','0927126978','letronglan@gmail.com'),
	('NV0038','CV03','BP10',N'Bùi Quốc',N'Trung',N'Nam','4/26/2000',
	N'22 Tân Quý TP HCM','0921873121','buiquoctrung@gmail.com'),
	('NV0039','CV04','BP10',N'Lê Ngọc Quỳnh', N'Chi',N'Nữ','2/22/2002',
	'21 Tân Thọ TP HCM','0921723628','lengocquynhchi@gmail.com'),
	('NV0040','CV01','BP11',N'Trần Ngọc',N'Châu',N'Nam','12/23/2002',
	'23 Thành Công TP HCM','0921238471','tranngocchau@gmail.com'),
	('NV0041','CV02','BP11', N'Bùi Quốc',N'Triệu', N'Nam','8/27/2003',
	'21 Sơn Kỳ TP HCM','0928173928','buiquoctrieu@gmail.com'),
	('NV0042','CV03','BP11', N'Trần Gia',N'Huy',N'Nam','2/23/2002',
	'2 Đỗ Thừa Luông TP HCM','0928172382','trangiahuy@gmail.com'),
	('NV0043','CV04','BP11', N'Nguyễn Trần Thanh',N'Hiền',N'Nữ','4/21/2002',
	'21 Tân Quý TP HCM','0712723984','nguyentranthanhhien@gmail.com'),
	('NV0044','CV01','BP12', N'Bùi Đình Duy', N'Thắng', N'Nam','8/26/2002',
	N'Ấp Chiến Lược TP HCM','0918273281','buidinhduythan@gmail.com'),
	('NV0045','CV02','BP12',N'Nguyễn Hoàng Thanh',N'Ân',N'Nữ','12/1/2002',
	N'21 Hai Bà Trưng TP HCM','0712739849','thanhan@gmail.com'),
	('NV0046','CV03','BP12', N'Phạm Võ',N'Đông',N'Nam','2/1/2002',
	N'21 Gò Dầu TP HCM','0928273648','phamvodong@gmail.com'),
	('NV0047','CV04','BP12',N'Lê Đoàn Bội',N'Uyên',N'Nữ','5/5/2001',
	N'32/1/2 Bạch Đằng TP HCM','2/2/2001','ledoanboiuyen@gmail.com'),
	('NV0048','CV04','BP03',N'Trần Anh',N'Khoa',N'Nam','3/3/2001',
	N'21/2 Xuân Diệu TP HCM','0982719283','trananhkhoa@gmail.com'),
	('NV0049','CV04','BP03',N'Nguyễn Đức Hoàng',N'Phước',N'Nam','2/1/2002',
	N'21 Nguyễn Xuân Khoát TP HCM','0928171272','nguyenduchoangphuoc@gmail.com'),
	('NV0050','CV04','BP03',N'Lê Thân Dịu',N'Yến',N'Nữ','2/1/2002',
	N'2B/1 385 TP HCM','0928176279','lethandiuyen@gmail.com')




Insert INTO LoaiDichVu
VALUES
	('GUI',100000,'01/07/2019'),--Giatui
	('KAO',1000000,'01/02/2019'),--Karaoke
	('DUA',500000,'01/03/2019'),--Xeduadon
	('NHA',2500000,'04/02/2019'),--Nhahang
	('SPA',1500000,'06/02/2019'),
	('GYM',700000,'08/02/2019'),-- thue phong tap gym
	('HOP',1200000,'09/02/2019'),--Thue phong hop
	('BAR',1100000,'09/05/2019')--Thue quay bar

Insert INTO DichVu
VALUES
	('DV001','GUI',N'Giặt ủi'),
	('DV002','KAO',N'Karaoke'),
	('DV003','DUA',N'Thuê Xe Đưa Đón'),
	('DV004','NHA',N'Nhà Hàng'),
	('DV005','SPA',N'SPA'),
	('DV006','GYM',N'Thuê Phòng Tập Gym'),
	('DV007','HOP',N'Thuê Phòng Họp'),
	('DV008','BAR',N'Thuê Quầy Bar')



Insert INTO KhachHang 
VALUES
 ('KH001','LKH02',N'Trần',N'Đức',N'Nam',N'Quận Tân Phú, Thành Phố Hồ Chí Minh',
 '979783540',N'trduc123@gmail.com','02116584441'),
 ('KH002','LKH02',N'Hồ Thạnh',N'Phước',N'Nam',N'Quận Tân Bình, Thành Phố Hồ Chí Minh',
 '09825151854',N'hothanhphuoc@gmail.com','02116584441'),
 ('KH003','LKH01',N'Lê Đức',N'Minh',N'Nam',N'31 Nguyễn Xí',
 '098214145',N'leducminh@gmail.com','02116584448'),
 ('KH004','LKH02',N'Võ Cẩm ',N'Nhung',N'Nữ',N'71 Quang Trung',
 '09825451854',N'vocamnhung@gmail.com','02116584442'),
 ('KH005','LKH01',N'Hoàng Khánh ',N'Hưng',N'Nam',N'93 Quốc lộ 13',
 '09845151854',N'hoangkhanhhung@gmail.com','02116584448'),
 ('KH006','LKH02',N'Đỗ Ngọc ',N'Linh',N'Nữ',N'71 Huỳnh Thúc Kháng',
 '09825141854',N'dongoclinh@gmail.com','0812665018'),
 ('KH007','LKH02',N'Lê Văn ',N'Khương',N'Nam',N'455 Xô Viết Nghệ Tĩnh',
 '09225151854',N'levankhuong@gmail.com','02116584444'),
 ('KH008','LKH01',N'Mai Hoàng ',N'Đức',N'Nam',N'93 Quốc lộ 13',
 '0985151854',N'maihoangduc@gmail.com','02116584443'),
 ('KH009','LKH02',N'Trần Ngọc',N'Đan',N'Nữ',N'71 Quang Trung',
 '09825151854',N'tranngocdan@gmail.com','02116584446'),
 ('KH010','LKH01',N'Trần ',N'An',N'Nam',N'72 Quang Trung',
 '09825151814',N'tranan@gmail.com','07927382672'),
 ('KH011','LKH02',N'Trần Ngọc',N'Châu',N'Nam','2 Tân Quý TP HCM',
 '0978271823',N'tranngocanhmai@gmail.com','09273648272'),
 ('KH012','LKH01',N'Trần',N'Dần',N'Nam','72 Quang Trung',
 '09825151814',N'tranngocan@gmail.com','09116584446'),
 ('KH013','LKH02',N'Nguyễn Minh',N'Đăng',N'Nam',N'79 Bình Thuận',
 '0921823648',N'nguyenminhdang@gmail.com','0978398172'),
 ('KH014','LKH01',N'Nguyễn Hoàng Thanh',N'Ân',N'Nữ','32/23 Quang Trung TP HCM',
 '0298724694',N'nguyenhoangthanhan@gmail.com','0876386213'),
 ('KH015','LKH02',N'Bùi Mạnh',N'Hùng',N'Nam',N'215/37 Huỳnh Văn Bánh TP HCM',
 '0987263743',N'buimanhhung@gmail.com','07214892371'),
 ('KH016','LKH01',N'Trần Quang',N'Duy',N'Nam',N'72 Lê Lợi TP HCM','0977263948',
 N'tranquangduy@gmail.com','09872631921'),
 ('KH017','LKH02',N'Võ Trung',N'Thành',N'Nam',N'21 Hai Bà Trung','09825151814',N'tranngocan@gmail.com','09116584446'),
 ('KH018','LKH01',N'Bùi Quang',N'Đông',N'Nam',N'21 Lê Lư TP HCM','0987263948',N'buiquangdong@gmail.com','07618273978'),
 ('KH019','LKH02',N'Phù Dung Thu',N'Trang',N'Nữ',N'123 Đường số 11 TP HCM','0762182739',N'thutrang1507@gmail.com','08172637488'),
 ('KH020','LKH01',N'Nguyễn Phúc',N'Nguyên',N'Nam',N'21/1 Đỗ Thừa Luông TP HCM','0981897287',N'tranngocan@gmail.com','0192837802'),
 ('KH021','LKH02',N'Trần Minh',N'Quân',N'Nam',N'21/2 Nguyễn Văn Trổi','0726719283',N'tranminhquan@gmail.com','09172836477'),
 ('KH022','LKH01',N'Lương Nguyễn Công',N'Khoa',N'Nam',N'2/1 Huyện Thanh Quan TP HCM','0781627389',N'congkhoa@gmail.com','09172648371'),
 ('KH023','LKH02',N'Nguyễn Trọng',N'Nhân',N'Nam',N'72 Tây Thạnh TP HCM','0762367218',N'trongnhan@gmail.com','08172837411'),
 ('KH024','LKH01',N'Nguyễn Hữu',N'Tình',N'Nam',N'12/1 Bạch Đằng TP HCM','0782172312',N'nguyenhuutinh@gmail.com','09112389411'),
 ('KH025','LKH02',N'Nguyễn Văn',N'Luân',N'Nam',N'21 Hoàng Mai TP Hà Nội','0987261762',N'nguyenvanluan@gmail.com','01827473822'),
 ('KH026','LKH01',N'Lê Đình',N'Quý',N'Nam',N'21 Hoàng Diệu','0712381999',N'ledinhquy@gmail.com','017289378e43'),
 ('KH027','LKH02',N'Nguyễn Lâm Ánh',N'Đông',N'Nữ',N'72 Bình Long TP HCM','0982718673',N'nguyenlamanhdong@gmail.com','09876287211'),
 ('KH028','LKH01',N'Nguyễn Thế',N'Quyền',N'Nam',N'21 Lã Xuân Oai','0782172392',N'thequyen@gmail.com','0911898975446'),
 ('KH029','LKH02',N'Võ Đình Gia',N'Huân',N'Nam',N'2/1/1 Ấp Chiến Lược TP HCM','0987129872',N'giahuan@gmail.com','02134892172'),
 ('KH030','LKH01',N'Trịnh Lê Hải',N'Đăng',N'Nam',N'12 Sơn Kỳ','0172863987',N'haidaang@gmail.com','09112458346'),
 ('KH031','LKH02',N'Trần Quốc',N'Huy',N'Nam',N'72 Dương Văn Dương','0987162738',N'quochuy@gmail.com','09187362781'),
 ('KH032','LKH01',N'Trần Văn',N'Tí',N'Nam','74 Bình Trung','09825151814',N'tranvanti@gmail.com','09116544446'),
 ('KH033','LKH02',N'Trần Văn',N'Tèo',N'Nam','79 Quang Bình ','09825151814',N'tranvanteo@gmail.com','09616584446'),
 ('KH034','LKH01',N'Tran Ngọc',N'Nữ',N'Nữ','42 Bạch Đằng','09825151814',N'tranngocnu@gmail.com','09156584446'),
 ('KH035','LKH02',N'Hồ Ngọc',N'Trân',N'Nữ','70 Quang Trung','09825551814',N'hongoctran@gmail.com','09115584446'),
 ('KH036','LKH01',N'Tấn Ngọc',N'Hoàng',N'Nữ','69 Quang Trung','09825141814',N'tanngochoang@gmail.com','09516584446'),
 ('KH037','LKH02',N'Nguyênn Ngọc',N'Linh',N'Nữ','69 Bùi Viện','04825151814',N'nguyengoclin@gmail.com','09114584446'),
 ('KH038','LKH01',N'Trần Ngọc',N'Đan',N'Nữ','9 Bùi Viện','09825151854',N'Tranngocdan@gmail.com','09115584446'),
 ('KH039','LKH02',N'Đặng Ngọc',N'Ái',N'Nữ','72/ 61 Nam Đông','09825151814',N'dangai@gmail.com','09516584446'),
 ('KH040','LKH01',N'Trần Ngọc',N'Ánh Mai',N'Nữ','Sông Cầu','09865151814',N'anhmai@gmail.com','09116584446'),
 ('KH041','LKH02',N'Nguyễn',N'Linh',N'Nữ','Sillicon Valley','09825451814',N'nguyenlinh@gmail.com','09115584446'),
 ('KH042','LKH01',N'Trần Ngọc',N'Hạ',N'Nữ','78 Quang Trung',
 '09825151814',N'tranngocha@gmail.com','09116584445'),
 ('KH043','LKH02',N'Trần Phi',N'Hùng',N'Nam','99 Quang Trung',
 '09425151814',N'phihung@gmail.com','09116584446'),
 ('KH044','LKH01',N'Hồ Thanh',N'Phước',N'Nam','Silicon Valley',
 '09825151814',N'phuocthank@gmail.com','09116584446'),
 ('KH045','LKH02',N'Trần Doan ',N'An',N'Nữ','55 Quang Trung',
 '09835151814',N'trandoan@gmail.com','09116584546'),
 ('KH046','LKH01',N'Trần Bố',N'Phi',N'Nam','American',
 '098251541814',N'bophi@gmail.com','09116544446'),
 ('KH047','LKH02',N'Trần Ngọc',N'An',N'Nữ','Spain',
 '09845151814',N'trangnocan@gmail.com','09116584446'),
 ('KH048','LKH01',N'Hồ Ngọc',N'Khánh Trân',N'Nữ','Sông Cầu',
 '04825151814',N'ktrannea@gmail.com','02116584446'),
 ('KH049','LKH02',N'Trần Ngọc',N'Phi',N'Nam','Cầu Trung',
 '09824151814',N'phi@gmail.com','09116584446'),
 ('KH050','LKH01',N'Trần Mạnh',N'An',N'Nam','02 Quang Trung',
 '09825151814',N'mahan@gmail.com','04116584446')



 Insert INTO HoaDon
 VALUES 
	('HD0001','KH001','NV0001','2/1/2016'),
	('HD0002','KH002','NV0002','2/23/2016'),
	('HD0003','KH003','NV0003','3/22/2016'),
	('HD0004','KH004','NV0004','3/12/2016'),
	('HD0005','KH005','NV0005','2/2/2017'),
	('HD0006','KH006','NV0006','2/2/2017'),
	('HD0007','KH007','NV0007','3/2/2017'),
	('HD0008','KH008','NV0008','4/2/2017'),
	('HD0009','KH019','NV0009','4/2/2017'),
	('HD0010','KH010','NV0010','3/2/2018'),
	('HD0011','KH011','NV0011','4/2/2018'),
	('HD0012','KH012','NV0012','4/22/2018'),
	('HD0013','KH013','NV0013','4/2/2018'),
	('HD0014','KH014','NV0014','4/2/2018'),
	('HD0015','KH015','NV0015','4/2/2019'),
	('HD0016','KH016','NV0016','2/2/2019'),
	('HD0017','KH017','NV0017','2/2/2019'),
	('HD0018','KH018','NV0018','2/2/2019'),
	('HD0019','KH019','NV0019','2/2/2019'),
	('HD0020','KH020','NV0020','3/2/2019'),
	('HD0021','KH021','NV0021','3/2/2019'),
	('HD0022','KH022','NV0022','4/2/2019'),
	('HD0023','KH023','NV0023','4/2/2019'),
	('HD0024','KH024','NV0024','4/2/2019'),
	('HD0025','KH025','NV0025','4/2/2019'),
	('HD0026','KH026','NV0026','5/2/2019'),
	('HD0027','KH027','NV0027','5/2/2019'),
	('HD0028','KH028','NV0028','5/2/2019'),
	('HD0029','KH029','NV0029','5/2/2019'),
	('HD0030','KH030','NV0030','5/2/2019'),
	('HD0031','KH031','NV0031','6/2/2019'),
	('HD0032','KH032','NV0032','6/2/2019'),
	('HD0033','KH033','NV0033','6/2/2019'),
	('HD0034','KH034','NV0034','2/2/2020'),
	('HD0035','KH035','NV0035','2/2/2020'),
	('HD0036','KH036','NV0036','4/2/2020'),
	('HD0037','KH037','NV0037','5/2/2020'),
	('HD0038','KH038','NV0038','6/2/2020'),
	('HD0039','KH039','NV0039','7/2/2020'),
	('HD0040','KH040','NV0040','2/2/2021'),
	('HD0041','KH041','NV0041','2/2/2021'),
	('HD0042','KH042','NV0042','2/2/2021'),
	('HD0043','KH043','NV0043','3/2/2021'),
	('HD0044','KH044','NV0044','4/2/2021'),
	('HD0045','KH045','NV0045','5/2/2021'),
	('HD0046','KH046','NV0046','6/2/2021'),
	('HD0047','KH047','NV0047','6/2/2021'),
	('HD0048','KH048','NV0048','6/2/2021'),
	('HD0049','KH049','NV0049','7/2/2021'),
	('HD0050','KH050','NV0050','8/2/2021')
	

	


Insert INTO ChiTietHoaDon
VALUES 
	('CTHD0001','HD0001',2222126),
	('CTHD0002','HD0002',2122229),
	('CTHD0003','HD0003',922598),
	('CTHD0004','HD0004',782945),
	('CTHD0005','HD0005',622125894),
	('CTHD0006','HD0006',45465),
	('CTHD0007','HD0007',232225),
	('CTHD0008','HD0008',782278),
	('CTHD0009','HD0009',22216521),
	('CTHD0010','HD0010',232223),
	('CTHD0011','HD0011',222424),
	('CTHD0012','HD0012',222324),
	('CTHD0013','HD0013',7228878),
	('CTHD0014','HD0014',78878),
	('CTHD0015','HD0015',822989),
	('CTHD0016','HD0016',6227676),
	('CTHD0017','HD0017',787787),
	('CTHD0018','HD0018',8922899),
	('CTHD0019','HD0019',898998),
	('CTHD0020','HD0020',892289),
	('CTHD0021','HD0021',892228),
	('CTHD0022','HD0022',67112326),
	('CTHD0023','HD0023',7222348),
	('CTHD0024','HD0024',51231235),
	('CTHD0025','HD0025',45123324),
	('CTHD0026','HD0026',4123545),
	('CTHD0027','HD0027',4342454),
	('CTHD0028','HD0028',4234343),
	('CTHD0029','HD0029',42342334),
	('CTHD0030','HD0030',65543556),
	('CTHD0031','HD0031',665476776),
	('CTHD0032','HD0032',76657567),
	('CTHD0033','HD0033',46577754),
	('CTHD0034','HD0034',256745432),
	('CTHD0035','HD0035',6345675656),
	('CTHD0036','HD0036',856756378),
	('CTHD0037','HD0037',576573345),
	('CTHD0038','HD0038',4586776844),
	('CTHD0039','HD0039',956567389),
	('CTHD0040','HD0040',9834549),
	('CTHD0041','HD0041',96546898),
	('CTHD0042','HD0042',64564556),
	('CTHD0043','HD0043',546496),
	('CTHD0044','HD0044',64564556),
	('CTHD0045','HD0045',4565656),
	('CTHD0046','HD0046',456434),
	('CTHD0047','HD0047',34564562),
	('CTHD0048','HD0048',44564514),
	('CTHD0049','HD0049',545645615),
	('CTHD0050','HD0050',64564513),
	('CTHD0051','HD0001',324234234),
	('CTHD0052','HD0001',21222229),
	('CTHD0053','HD0002',9225928),
	('CTHD0054','HD0002',9225928),
	('CTHD0055','HD0002',122928),
	('CTHD0056','HD0002',3229228),
	('CTHD0057','HD0010',1232223),
	('CTHD0058','HD0010',34234233),
	('CTHD0059','HD0013',57228878),
	('CTHD0060','HD0013',17228878),
	('CTHD0061','HD0036',156756378),
	('CTHD0062','HD0036',122756378),
	('CTHD0063','HD0036',1756378)

Insert INTO PhieuThuePhong
VALUES
	('PTP0001','KH001'),
	('PTP0002','KH002'),
	('PTP0003','KH003'),
	('PTP0004','KH004'),
	('PTP0005','KH005'),
	('PTP0006','KH006'),
	('PTP0007','KH007'),
	('PTP0008','KH008'),
	('PTP0009','KH009'),
	('PTP0010','KH010'),
	('PTP0011','KH011'),
	('PTP0012','KH012'),
	('PTP0013','KH013'),
	('PTP0014','KH014'),
	('PTP0015','KH015'),
	('PTP0016','KH016'),
	('PTP0017','KH017'),
	('PTP0018','KH018'),
	('PTP0019','KH019'),
	('PTP0020','KH020'),
	('PTP0021','KH021'),
	('PTP0022','KH022'),
	('PTP0023','KH023'),
	('PTP0024','KH024'),
	('PTP0025','KH025'),
	('PTP0026','KH026'),
	('PTP0027','KH027'),
	('PTP0028','KH028'),
	('PTP0029','KH029'),
	('PTP0030','KH030'),
	('PTP0031','KH031'),
	('PTP0032','KH032'),
	('PTP0033','KH033'),
	('PTP0034','KH034'),
	('PTP0035','KH035'),
	('PTP0036','KH036'),
	('PTP0037','KH037'),
	('PTP0038','KH038'),
	('PTP0039','KH039'),
	('PTP0040','KH040'),
	('PTP0041','KH041'),
	('PTP0042','KH042'),
	('PTP0043','KH043'),
	('PTP0044','KH044'),
	('PTP0045','KH045'),
	('PTP0046','KH046'),
	('PTP0047','KH047'),
	('PTP0048','KH048'),
	('PTP0049','KH049'),
	('PTP0050','KH050')

	--- sau

Insert INTO ChiTietThuePhong
VALUES
	('P0001','PTP0001','2/01/2019'),
	('P0002','PTP0002','2/02/2019'),
	('P0003','PTP0003','2/03/2019'),
	('P0004','PTP0004','2/04/2019'),
	('P0005','PTP0005','2/05/2019'),
	('P0006','PTP0006','2/06/2019'),
	('P0007','PTP0007','2/07/2019'),
	('P0008','PTP0008','2/08/2019'),
	('P0009','PTP0009','2/09/2019'),
	('P0010','PTP0010','2/10/2019'),
	('P0011','PTP0011','2/11/2019'),
	('P0012','PTP0012','2/12/2019'),
	('P0013','PTP0013','2/13/2019'),
	('P0014','PTP0014','2/14/2019'),
	('P0015','PTP0015','2/15/2019'),
	('P0016','PTP0016','2/16/2019'),
	('P0017','PTP0017','2/17/2019'),
	('P0018','PTP0018','2/18/2019'),
	('P0019','PTP0019','2/19/2019'),
	('P0020','PTP0020','2/20/2019'),
	('P0021','PTP0021','2/21/2019'),
	('P0022','PTP0022','2/22/2019'),
	('P0023','PTP0023','2/23/2019'),
	('P0024','PTP0024','2/24/2019'),
	('P0025','PTP0025','2/25/2019'),
	('P0026','PTP0026','3/01/2019'),
	('P0027','PTP0027','3/02/2019'),
	('P0028','PTP0028','3/03/2019'),
	('P0029','PTP0029','3/04/2019'),
	('P0030','PTP0030','3/05/2019'),
	('P0031','PTP0031','3/06/2019'),
	('P0032','PTP0032','3/07/2019'),
	('P0033','PTP0033','3/08/2019'),
	('P0034','PTP0034','3/09/2019'),
	('P0035','PTP0035','3/10/2019'),
	('P0036','PTP0036','3/11/2019'),
	('P0037','PTP0037','3/12/2019'),
	('P0038','PTP0038','3/13/2019'),
	('P0039','PTP0039','3/14/2019'),
	('P0040','PTP0040','3/15/2019'),
	('P0041','PTP0041','3/16/2019'),
	('P0042','PTP0042','3/17/2019'),
	('P0043','PTP0043','3/18/2019'),
	('P0044','PTP0044','3/19/2019'),
	('P0045','PTP0045','3/20/2019'),
	('P0046','PTP0046','3/21/2019'),
	('P0047','PTP0047','3/22/2019'),
	('P0048','PTP0048','3/23/2019'),
	('P0049','PTP0049','3/24/2019'),
	('P0050','PTP0050','3/25/2019')

Insert INTO PhieuNhanPhong
VALUES 
	('PNP001','PTP0001'),
	('PNP002','PTP0002'),
	('PNP003','PTP0003'),
	('PNP004','PTP0004'),
	('PNP005','PTP0005'),
	('PNP006','PTP0006'),
	('PNP007','PTP0007'),
	('PNP008','PTP0008'),
	('PNP009','PTP0009'),
	('PNP010','PTP0010'),
	('PNP011','PTP0011'),
	('PNP012','PTP0012'),
	('PNP013','PTP0013'),
	('PNP014','PTP0014'),
	('PNP015','PTP0015'),
	('PNP016','PTP0016'),
	('PNP017','PTP0017'),
	('PNP018','PTP0018'),
	('PNP019','PTP0019'),
	('PNP020','PTP0020'),
	('PNP021','PTP0021'),
	('PNP022','PTP0022'),
	('PNP023','PTP0023'),
	('PNP024','PTP0024'),
	('PNP025','PTP0025'),
	('PNP026','PTP0026'),
	('PNP027','PTP0027'),
	('PNP028','PTP0028'),
	('PNP029','PTP0029'),
	('PNP030','PTP0030'),
	('PNP031','PTP0031'),
	('PNP032','PTP0032'),
	('PNP033','PTP0033'),
	('PNP034','PTP0034'),
	('PNP035','PTP0035'),
	('PNP036','PTP0036'),
	('PNP037','PTP0037'),
	('PNP038','PTP0038'),
	('PNP039','PTP0039'),
	('PNP040','PTP0040'),
	('PNP041','PTP0041'),
	('PNP042','PTP0042'),
	('PNP043','PTP0043'),
	('PNP044','PTP0044'),
	('PNP045','PTP0045'),
	('PNP046','PTP0046'),
	('PNP047','PTP0047'),
	('PNP048','PTP0048'),
	('PNP049','PTP0049'),
	('PNP050','PTP0050')

INSERT INTO ChiTietPhieuNhanPhong
VALUES
	('PNP001','HD0001','DV001','2/02/2019'),
	('PNP002','HD0002','DV002','2/03/2019'),
	('PNP003','HD0003','DV003','2/04/2019'),
	('PNP004','HD0004','DV004','2/05/2019'),
	('PNP005','HD0005','DV005','2/06/2019'),
	('PNP006','HD0006','DV006','2/07/2019'),
	('PNP007','HD0007','DV007','2/08/2019'),
	('PNP008','HD0008','DV008','2/09/2019'),
	('PNP009','HD0009','DV001','2/10/2019'),
	('PNP010','HD0010','DV002','2/11/2019'),
	('PNP011','HD0011','DV003','2/12/2019'),
	('PNP012','HD0012','DV004','2/13/2019'),
	('PNP013','HD0013','DV005','2/14/2019'),
	('PNP014','HD0014','DV006','2/15/2019'),
	('PNP015','HD0015','DV007','2/16/2019'),
	('PNP016','HD0016','DV008','2/17/2019'),
	('PNP017','HD0017','DV001','2/18/2019'),
	('PNP018','HD0018','DV002','2/19/2019'),
	('PNP019','HD0019','DV003','2/20/2019'),
	('PNP020','HD0020','DV004','2/21/2019'),
	('PNP021','HD0021','DV005','2/22/2019'),
	('PNP022','HD0022','DV006','2/23/2019'),
	('PNP023','HD0023','DV007','2/24/2019'),
	('PNP024','HD0024','DV008','2/25/2019'),
	('PNP025','HD0025','DV001','2/26/2019'),
	('PNP026','HD0026','DV002','3/02/2019'),
	('PNP027','HD0027','DV003','3/03/2019'),
	('PNP028','HD0028','DV004','3/04/2019'),
	('PNP029','HD0029','DV005','3/05/2019'),
	('PNP030','HD0030','DV006','3/06/2019'),
	('PNP031','HD0031','DV007','3/07/2019'),
	('PNP032','HD0032','DV008','3/08/2019'),
	('PNP033','HD0033','DV001','3/09/2019'),
	('PNP034','HD0034','DV002','3/10/2019'),
	('PNP035','HD0035','DV003','3/11/2019'),
	('PNP036','HD0036','DV004','3/12/2019'),
	('PNP037','HD0037','DV005','3/13/2019'),
	('PNP038','HD0038','DV006','3/14/2019'),
	('PNP039','HD0039','DV007','3/15/2019'),
	('PNP040','HD0040','DV008','3/16/2019'),
	('PNP041','HD0041','DV001','3/17/2019'),
	('PNP042','HD0042','DV002','3/18/2019'),
	('PNP043','HD0043','DV003','3/19/2019'),
	('PNP044','HD0044','DV004','3/20/2019'),
	('PNP045','HD0045','DV005','3/21/2019'),
	('PNP046','HD0046','DV006','3/22/2019'),
	('PNP047','HD0047','DV007','3/23/2019'),
	('PNP048','HD0048','DV008','3/24/2019')
-- ỨNG DỤNG
-- PHẦN 1 [SYNONYM]
-- 1.1 Tạo một tên đồng nghĩa ngắn gọn để dễ gọi trong bảng Khách Hàng
CREATE SYNONYM KHang FOR dbo.KhachHang
-- Thực thi
select * from KHang

-- 1.2 Tạo Tên đồng nghĩa ngắn gọn cho View Số lượng khách vip
CREATE SYNONYM KHACHVIP FOR vw_soluongkhachvip
-- Thực thi
Select * from KHACHVIP

-- 1.3 Tạo tên đồng nghĩa truy xuất vào bảng cơ sở dữ liệu của
-- hệ thống do người dùng sys làm chủ sở hữu.
create synonym db for sys.databases
 -- thực thi
select * from db
-- 1.4.Tạo tên đồng nghĩa truy xuất vào bảng cơ sở dữ liệu của 
--hệ thống cho biết số tên đồng nghĩa đang có trong hệ thống.
create synonym cc for sys.synonyms
 -- thực thi
select * from cc

-- PHẦN 2 [INDEX]
--INDEX ĐƠN
-- 2.1 Tạo “Index” cho bảng “KhachHang”, cột Tenkh
CREATE INDEX Index_TenKhachHang on KhachHang(TenKh)
-- Thực thi
select *
from KhachHang
where TenKh = N'Đức'
-- So sánh với
Select *
From KhachHang
With (Index(Index_TenKhachHang))
Where TenKh = N'Đức'

-- 2.2 Tạo “Unique Index” cho bảng “NhanVien” cột MaNV
CREATE UNIQUE INDEX Index_NhanVien on NhanVien(MaNV)
-- Thực thi
select * 
from NhanVien
where MaNv = 'NV0001'
-- So sánh với
Select *
From NhanVien
With (Index(Index_NhanVien))
where MaNv = 'NV0001'

-- INDEX ĐÔI
-- 2.3 Tạo “Composite Index” cho bảng “HoaDon” với cột MaHoaDon và MaNV
CREATE INDEX Index_Doi_HoaDon on HoaDon (MaHoaDon, MaNV)
-- Thực Thi
Select *
from HoaDon
where MaHoaDon = 'HD0001' and MaNV = 'NV0001'
-- So sánh với
Select *
From HoaDon
With (Index (Index_Doi_HoaDon))
where MaHoaDon = 'HD0001' and MaNV = 'NV0001'

-- PHẦN 3 [VIEW]

-- 3.1 Tạo view danh sách nhân viên theo chức vụ và bộ phận 
-- (vw_dsnhanvien_theochucvu_bophan) gồm: Mã nhân viên,
-- họ tên nhân viên,giới tính, ngày sinh, tên bộ phận, tên chức vụ
-- (View cơ bản)
CREATE  VIEW vw_dsnhanvien_theochucvu_bophan
as
Select distinct MaNv , HoNv +' '+ TenNv [Họ và tên nhân viên],
GioiTinh, NgaySinh,TenBoPhan , TenChucVu
From NhanVien NV join ChucVu CV on NV.MaChucVu = CV.MaChucVu
join BoPhan BP on BP.MaBoPhan = NV.MaBoPhan
-- Thực thi
select * from vw_dsnhanvien_theochucvu_bophan

--3.2 Tạo View danh sách số nhân viên của từng bộ phận (vw_ SoNhanVienMoiBoPhan) gồm:
-- Mã bộ phận, tên bộ phận, số lượng nhân viên, ngày thành lập.
--view gom nhóm
CREATE VIEW vw_SoNhanVienMoiBoPhan
as 
select BP.MaBoPhan, TenBoPhan ,count(MaNv) [Số lượng nhân viên] 
, NgayThanhLap
from NhanVien NV join BoPhan BP on NV.MaBoPhan = BP.MaBoPhan
group by BP.MaBoPhan, TenBoPhan  , NgayThanhLap
-- Thực thi
select * from vw_SoNhanVienMoiBoPhan

--3.3 Tạo View thống kê danh sách số lượng khách hàng VIP(vw_ soluongkhachvip) gồm:
-- Mã khách hàng, Họ tên khách hàng, tên loại khách hàng
-- View thống kê
CREATE VIEW vw_soluongkhachvip
as 
select MaKh,HoKh +' '+ TenKh [Họ tên khách hàng] ,
TenLoaiKhachHang, GioiTinh
from KhachHang KH join LoaiKhachHang LKH 
on KH.MaLoaiKhachHang = LKH.MaLoaiKhachHang
where  LKH.MaLoaiKhachHang = 'LKH02'
-- Thực thi
select * from vw_soluongkhachvip

--3.4 Tạo View (vw_doanhthunhanviencaonhat) cho biết doanh thu của nhân viên có lương cao nhất gồm: 
-- Mã nhân viên, họ và tên nhân viên, tổng doanh thu của từng nhân viên. 
-- View truy vấn lồng
CREATE VIEW vw_doanhthunhanviencaonhat
as
select NV.MaNV,HoNv + ' ' + TenNv [Họ và tên nhân viên],
sum(DonGia) [Tổng tiền] 
from NhanVien NV join HoaDon HD on NV.MaNv = HD.MaNV 
join ChiTietHoaDon CTHD on CTHD.MaHD = HD.MaHoaDon
group by NV.MaNV,HoNv + ' ' + TenNv
having sum(DonGia) = (select top 1 sum(DonGia) 
from NhanVien NV join HoaDon HD on NV.MaNv = HD.MaNV
join ChiTietHoaDon CTHD on CTHD.MaHD = HD.MaHoaDon
group by NV.MaNV 
order by sum(DonGia) desc)
-- Thực thi
select * from vw_doanhthunhanviencaonhat

-- 1.0 View case when
-- Tạo view cho phép xem thông tin khách hàng bao gồm: Mã khách hàng, Họ tên, 
-- Đơn giá, và phân loại khách hàng(Vãng lai, thường, tiềm năng) dựa trên đơn giá hóa đơn của mỗi khách
CREATE VIEW vw_phanloaikhachhang
AS
SELECT kh.MaKh, HoKh +' '+TenKh AS Hoten,Dongia,
(CASE WHEN DonGia < 1000000 THEN DonGia 
ELSE 0 END) AS N'Khách vãng lai',
(CASE WHEN DonGia >= 1000000 AND DonGia <= 10000000  THEN DonGia 
ELSE N'' END) AS N'Khách hàng thường',
(CASE WHEN DonGia > 10000000 THEN DonGia 
ELSE 0 END) AS N'Khách hàng tiềm năng'
FROM KhachHang kh JOIN HoaDon hd ON kh.MaKh = hd.MaKH
JOIN ChiTietHoaDon cthd ON cthd.MaHD = hd.MaHoaDon

-- THỰC THI
SELECT *
FROM vw_phanloaikhachhang
-- 2.0 “Cập nhật dữ liệu trực tiếp vào view với khách hàng có giới tính Nữ”
CREATE VIEW vw_khachhangnu
AS
SELECT *
FROM KhachHang 
WHERE GioiTinh LIKE N'Nữ'
-- xem view
SELECT *
FROM vw_khachhangnu
-- thực thi
SELECT *
FROM LoaiKhachHang
UPDATE vw_khachhangnu
SET MaLoaiKhachHang = 'LKH02'
WHERE MaKh = 'KH014'

--2.2 View tạo view Update mã chi tiết hóa đơn trong bảng hóa đơn
CREATE VIEW vw_windowfunction
AS
SELECT hd.MaKH, hd.MaHoaDon, MaCTHD,DonGia,
RANK() OVER (PARTITION BY hd.Mahoadon ORDER BY Dongia DESC)AS N'Thứ tự'
FROM ChiTietHoaDon cthd join HoaDon hd on cthd.MaHD= hd.MaHoaDon
-- Xem view
SELECT *
FROM vw_windowfunction
-- thực thi
UPDATE vw_windowfunction
SET DonGia = 3200000
WHERE MaKH = 'KH001' AND MaHoaDon = 'HD0001' AND MaCTHD = 'CTHD0051'
--3.0 Insert View “Thêm dữ liệu trực tiếp vào view được tạo với thông tin: Mã nhân viên, Họ nhân viên, Tên nv, 
-- Giới tính, Ngày sinh với điều kiện ngày sinh phải khác NULL”
CREATE VIEW vw_Nhanvien
AS
SELECT MaNv, HoNv, TenNv, GioiTinh,NgaySinh
FROM NhanVien
WHERE NgaySinh is not null
SELECT *
FROM vw_Nhanvien
-- Thực thi
INSERT INTO vw_Nhanvien 
VALUES('NV051',N'Hồ Quốc',N'Đạt','Nam','08/09/2002')

-- 3.1 Lỗi view với check option(kiểm tra điều kiện trong mệnh đề where)
CREATE VIEW vw_Khachhang
AS
SELECT MaKh, HoKh, TenKh,GioiTinh,CMND
FROM KhachHang
WHERE CMND IS NOT NULL
WITH CHECK OPTION

SELECT * 
FROM vw_Khachhang

INSERT INTO vw_Khachhang
VALUES('KH052','Hồ Nguyễn','An','Nam',NULL)






-- 4.1 Tạo thủ tục cho biết số lượng phòng theo mã loại phòng
-- (thủ tục không có tham số)
CREATE PROC sp_Slphong 
as
	SELECT MaLoaiPhong, count(MaPhong) as N'Số lượng phòng '
	FROM Phong
	GROUP BY MaLoaiPhong
-- 4.1 Thực thi
EXEC sp_Slphong

--4.2 Cho biết danh sách 3 hóa đơn có đơn giá lớn nhất
-- (thủ tục không có tham số)
CREATE PROC sp_Max3hd
AS 
	SELECT *
	FROM ChiTietHoaDon
	WHERE DonGia IN (SELECT TOP 3 DonGia
	FROM ChiTietHoaDon
	ORDER BY DonGia DESC)
--4.2 Thực thi
EXEC sp_Max3hd
select *from LoaiDichVu

--4.3 Tạo thủ tục tăng đơn giá của các loại dịch vụ lên 10% vào các dịp lễ
CREATE PROC sp_dichvu10
AS	
	BEGIN	
		SELECT *
		FROM LoaiDichVu
		UPDATE LoaiDichVu SET DonGiaDichVu = DonGiaDichVu *1.1
	END
--4.3 Thực thi
Exec sp_dichvu10


-- 4.4 Tạo thủ tục cho biết đơn giá dịch vụ với mã loại dịch vụ là tham số truyền vào
-- (Tạo thủ tục một tham số)
CREATE PROC sp_dongiadv @Maloaidv nchar(10)
AS 
	BEGIN 
		IF EXISTS(
			SELECT DonGiaDichVu
			FROM LoaiDichVu
			WHERE MaLoaiDichVu = @Maloaidv)
			SELECT DonGiaDichVu
			FROM LoaiDichVu
			WHERE MaLoaiDichVu = @Maloaidv
		ELSE 
		PRINT N'Mã loại dịch vụ này không tồn tại!'
	END
-- 4.4 Thực thi
EXEC sp_dongiadv'Bar'

-- 4.5 Tạo thủ tục cho biết doanh thu từ các loại khách hàng(Vip,Thường)
-- với mã loại khách hàng là tham số truyền vào
--(Tạo thủ tục 1 tham số)
CREATE PROC sp_doanhthuloaikh @Maloaikh nchar(10)
AS
	BEGIN
		IF EXISTS(
		SELECT *
		FROM KhachHang kh  join HoaDon hd on hd.MaKH = kh.MaKh 
		join ChiTietHoaDon cthd on cthd.MaHD = hd.MaHoaDon
		WHERE MaLoaiKhachHang = @Maloaikh)	
			SELECT SUM(Dongia) as Doanhthu
			FROM KhachHang kh  join HoaDon hd on hd.MaKH = kh.MaKh 
			join ChiTietHoaDon cthd on cthd.MaHD = hd.MaHoaDon
			WHERE MaLoaiKhachHang = @Maloaikh
		ELSE
			PRINT N'Mã loại khách hàng này không tồn tại!'
	END	

-- 4.5 Thực thi
EXEC sp_doanhthuloaikh 'LKH01'


-- 4.6 Tạo thủ tục cho phép xem thông tin bao gồm: Mã khách hàng, Họ , tên khách hàng, CMND khách hàng
-- Mã hóa đơn, Ngày nhận phòng theo khoảng thời gian từ ngày, đến ngày do người dùng yêu cầu
-- (Tạo thủ tục nhiều tham số)
CREATE PROC sp_ngaynhanphong(@Ngaybatdau datetime, @Ngayketthuc datetime)
AS	
	BEGIN
		IF EXISTS(SELECT kh.MaKh, HoKh + TenKh, CMND, hd.MaHoaDon, NgayNhanPhong
		FROM KhachHang kh join HoaDon hd on kh.MaKh = hd.MaKH
		join ChiTietPhieuNhanPhong ctpn on ctpn.MaHoaDon = hd.MaHoaDon
		WHERE NgayNhanPhong >= @Ngaybatdau and NgayNhanPhong <=@Ngayketthuc)
			SELECT kh.MaKh, HoKh + TenKh, CMND, hd.MaHoaDon, NgayNhanPhong
			FROM KhachHang kh join HoaDon hd on kh.MaKh = hd.MaKH
			join ChiTietPhieuNhanPhong ctpn on ctpn.MaHoaDon = hd.MaHoaDon
			WHERE NgayNhanPhong >= @Ngaybatdau and NgayNhanPhong <=@Ngayketthuc
		ELSE 
			PRINT N'Không có ngày nhận phòng nào trong khoảng thời gian này!'
	END
-- 4.6 Thực thi
EXEC [dbo].[sp_ngaynhanphong]'01/02/2019','01/28/2019'

--4.7 Cho biết tổng số hóa đơn  được thành lập trong ngày với ngày lập hóa đơn là tham số truyền vào, tổng số hóa đơn
-- là tham số truyền ra
-- (Tạo thủ tục nhiều tham số)
CREATE PROC sp_doanhthuOutput(@ngayinput datetime,@sohoadon float Output)
AS
	BEGIN
		IF EXISTS(SELECT *
					FROM ChiTietHoaDon 
					WHERE NgayLapHoaDon = @ngayinput)
			SELECT @sohoadon = COUNT(*)
			FROM ChiTietHoaDon
			WHERE NgayLapHoaDon = @ngayinput
		ELSE
			PRINT N'Không có hóa đơn nào được thành lập trong ngày này!'		
	END
--4.7 Thực thi
DECLARE @Doanhthu float
SET @Doanhthu = 0
EXEC sp_doanhthuOutput'04/02/2019', @Doanhthu Output
PRINT N'Số lượng hóa đơn được lập trong ngày này là: '+cast(@Doanhthu as nvarchar(10))

--4.8 Tạo thủ tục nhập đầy đủ thông tin 1 khách hàng 
-- (Tạo thủ tục nhiều tham số)
CREATE PROC sp_nhapkh(@Makh nchar(10), @Loaikh nchar(10),@hokh nvarchar(100),
					@Tenkh nvarchar(30),@Phai nvarchar(20),@Dc nvarchar(150),
					@Dienthoai nvarchar(30),@Email nvarchar(50),@CMND nchar(20))
AS
	BEGIN
		INSERT INTO KhachHang (MaKh,MaLoaiKhachHang,HoKh,TenKh,
		GioiTinh,DiaChi,DienThooai,Email,CMND) 
		VALUES(@Makh,@Loaikh,@hokh,@Tenkh,@Phai,@Dc,@Dienthoai,@Email,@CMND)
	END
--4.8 THỰC THI
select *from KhachHang
EXEC sp_nhapkh'KH051','LKH02',N'Trần Văn',N'Thông','Nam',
'Silicon Valley','0982625456','vanthong@gmail.com','05799987415'


-- PHẦN 5 [FUNCTION]
-- 5.1 Tạo Function tính doanh thu theo tháng năm với tham số truyền vào là tháng và năm:
--(không xuất thông báo)
CREATE FUNCTION f_doanhthutheotungthangnam (@thang int , @nam int)
returns float 
as
	begin 
		declare @doanhthu float
		select @doanhthu = sum(DonGia) 
		from HoaDon HD join ChiTietHoaDon CTDH on HD.MaHoaDon = CTDH.MaHD
		where MONTH(NgayLapHoaDon) =@thang and YEAR (NgayLapHoaDon) = 2016
		group by MONTH(NgayLapHoaDon) , YEAR (NgayLapHoaDon)
		return @doanhthu
	end
--5.1 Thực thi
select dbo.f_doanhthutheotungthangnam('2','2016')

-- 5.2 Tạo Function tính doanh thu theo tháng năm với tham số truyền vào là tháng và năm và xuất ra thông báo:
-- (có thông báo)
CREATE FUNCTION f_doanhthutheotungthangnam_cothongbao (@thang int , @nam int)
Returns Nvarchar (100)
as
	begin 
		declare @doanhthu float 
		set @doanhthu =0
		declare @thongbao nvarchar (100)

		select @doanhthu = sum(DonGia)
		from HoaDon HD join ChiTietHoaDon CTDH 
		on HD.MaHoaDon = CTDH.MaHD
		where MONTH(NgayLapHoaDon) =@thang and
		YEAR (NgayLapHoaDon) = 2016
		group by MONTH(NgayLapHoaDon), YEAR (NgayLapHoaDon)
		
		if (@doanhthu > 0)
		set @thongbao = N'Doanh thu của tháng '+
		cast(@thang as nvarchar (10))+ N' và năm ' +
		cast (@nam as nvarchar (100)) + N' là: ' +
		cast (@doanhthu as  nvarchar (4000))
		else 
		set @thongbao = N'Tháng này không có doanh thu'
		return @thongbao
	end 
--5.2 Thực thi
select dbo.f_doanhthutheotungthangnam_cothongbao('1','2016')
--5.2 Thực thi
select dbo.f_doanhthutheotungthangnam_cothongbao('2','2016')

-- 5.3 Tạo Function hiện thị doanh thu theo từng tháng năm.
-- (Trả về dạng bảng, không có tham số)
CREATE FUNCTION f_doanhthutheotungthangnam1 ()
returns table
as
return (select MONTH(NgayLapHoaDon) [Tháng] , 
		YEAR (NgayLapHoaDon) [Năm] ,sum(DonGia) [Doanh thu] 
		from HoaDon HD join ChiTietHoaDon CTDH on HD.MaHoaDon = CTDH.MaHD
		group by MONTH(NgayLapHoaDon) , YEAR (NgayLapHoaDon))
-- 5.3 Thực thi
select * from dbo.f_doanhthutheotungthangnam1()

-- 5.4 Tạo Function hiện thị doanh thu theo từng tháng năm với tham số truyền vào là tháng, năm
-- (Trả về dạng bảng, có tham số)
CREATE FUNCTION f_doanhthutheotungthangnam2 (@thang int , @nam int)
returns table
as
return (select MONTH(NgayLapHoaDon) [Tháng] ,
		YEAR (NgayLapHoaDon) [Năm], sum(DonGia) [Doanh thu]
		from HoaDon HD join ChiTietHoaDon CTDH
		on HD.MaHoaDon = CTDH.MaHD
		where MONTH(NgayLapHoaDon) =@thang and 
		YEAR (NgayLapHoaDon) = @nam
		group by MONTH(NgayLapHoaDon) , YEAR (NgayLapHoaDon))
-- 5.4 Thực thi
select * from dbo.f_doanhthutheotungthangnam2('2','2016')

--5.5 Tạo Function hiện thị doanh thu theo từng năm xuất ra dạng bảng có các cột năm, và doanh thu
-- (Trả về giá trị bảng tự tạo, không có tham số)
CREATE FUNCTION f_doanhthutheotungthangnam1_new()
RETURNS @KQ TABLE (nam INT, doanhthu FLOAT)
AS
	BEGIN
		INSERT @KQ
		SELECT YEAR(NgayLapHoaDon), SUM(Dongia)
		FROM HoaDon HD join ChiTietHoaDon CTHD on HD.MaHoaDon = CTHD.MaHD
		GROUP BY YEAR(NgaylapHoaDon)
		RETURN
	END
-- 5.5 Thực thi
SELECT *
FROM f_doanhthutheotungthangnam1_new()

-- PHẦN 6 [TRIGGER](sửa)
-- 6.1 Ngày lập hóa đơn phải bé hơn hoặc bằng ngày hiện tại (INSERT):
CREATE TRIGGER TG_NgayLapHD_HoaDon
on HoaDon	
for INSERT,UPDATE
AS
IF EXISTS (SELECT * FROM inserted WHERE inserted.NgayLapHoaDon <= GETDATE())
	BEGIN
		PRINT N'Ngày lập hóa đơn phải bé hơn hoặc bằng ngày hiện tại'
		ROLLBACK TRAN
	END

-- 6.1 Thực thi 
INSERT INTO HoaDon
VALUES ('HD0053','KH049','NV0041','4/16/2022')
-- 6.1 Thực Thi
INSERT INTO HoaDon
VALUES ('HD0054','KH049','NV0041','4/14/2022')

-- 6.2 Số giường trong phòng phải lớn hơn bằng 0 (UPDATE):
CREATE TRIGGER TG_SoGiuong_Phong
ON PHONG
FOR UPDATE, INSERT
AS
IF EXISTS (SELECT * FROM inserted where inserted.SoGiuong < = 0)
	BEGIN
		Print N'Đơn giường trong phòng phải lớn hơn hoặc bằng 0'
		ROLLBACK TRAN
	END
-- 6.2 Thực thi
UPDATE Phong
SET SoGiuong = 4
WHERE MaPhong =  'P0015'
-- 6.2 Thực thi
UPDATE Phong
SET SoGiuong = -4
WHERE MaPhong =  'P0014'

--6.3 Muốn xóa chi tiết hóa đơn thì đơn giá tiền của hóa đơn đó phải bé hơn 5000 (DELETE)
CREATE TRIGGER TG_DonGia_CTHD
ON ChiTietHoaDon
FOR Delete
AS
IF EXISTS (SELECT * FROM DELETED where DELETED.DonGia >= 5000)
	BEGIN
		Print N'Muốn xóa chi tiết hóa đơn thì đơn giá hóa đơn phải dưới 5000'
		ROLLBACK TRAN
	END
-- 6.3 Thực thi
DELETE FROM ChiTietHoaDon
WHERE MaCTHD= 'CTHD0065'

-- PHẦN 7 [USER]
-- Tạo role giám đốc
CREATE ROLE RL_GIAMDOC

-- Cấp quyền cho role giám đốc
GRANT ALL on KhachHang to RL_GIAMDOC 
WITH GRANT OPTION

-- tạo tài khoản đăng nhập cho giám đốc 
CREATE LOGIN GIAMDOC with password = '123',
default_database = HotelNewWorld


--- tạo các người dùng có chức vụ giám đốc
CREATE USER GIAMDOC1 for login GIAMDOC

-- add các tài khoản giám đốc
ALTER ROLE RL_GIAMDOC ADD MEMBER GIAMDOC1

-- test lệnh giám đốc
select * from KhachHang

insert into KhachHang 
values ('KH52', 'LKH01', N'Phạm Như',N'Quỳnh',N'Nữ', '299/9/12 Bình Thành HCM',
		'02145782585','phamnhuquynh@gmail.com','09116584444')


select * from KhachHang


delete khachhang
where makh = 'KH51'

update KhachHang
set TenKh = N'QUỲNHHHH'
where MaKh = 'KH51'




-- Tạo role phó giám đốc 
CREATE ROLE RL_PGIAMDOC

-- Cấp quyền cho role phó giám đốc
GRANT SELECT, UPDATE,delete  on KhachHang to RL_PGIAMDOC
WITH GRANT OPTION

--tạo tài khoản đăng nhập cho phó giám đốc
CREATE LOGIN PGIAMDOC with password = '123', 
default_database = HotelNewWorld

-- tạo các người dùng có chức vụ phó giám đốc
CREATE USER PGIAMDOC1 for login PGIAMDOC

-- add các tài khoản phó giám đốc
ALTER ROLE RL_PGIAMDOC ADD MEMBER PGIAMDOC1



-- TẠO ROLE TRƯỞNG PHÒNG
CREATE ROLE RL_TRUONGPHONG

-- CẤP QUYỀN CHO ROLE TRƯỞNG PHÒNG 
GRANT SELECT, UPDATE on KhachHang to RL_TRUONGPHONG
WITH GRANT OPTION

-- TẠO TÀI KHOẢN ĐĂNG NHẬP CHO TRƯỞNG PHÒNG
CREATE LOGIN TRUONGPHONG with password = '123',
default_database = HotelNewWorld

-- TẠO NGƯỜI DÙNG CÓ CHỨC VỤ TRƯỞNG PHÒNG
CREATE USER TRUONGPHONG1 for login TRUONGPHONG

-- ADD CÁC TOÀN KHOẢN TRƯỞNG PHÒNG
ALTER ROLE RL_TRUONGPHONG ADD MEMBER TRUONGPHONG1



-- TẠO ROLE NHÂN VIÊN
CREATE ROLE RL_NHANVIEN

-- CẤP QUYỀN CHO ROLE NHÂN VIÊN
GRANT UPDATE on KhachHang to RL_NHANVIEN

-- TẠO TÀI KHOẢN ĐĂNG NHẬP CHO NHÂN VIÊN
CREATE LOGIN NHANVIEN with password = '123', 
default_database = HotelNewWorld

-- TẠO NGƯỜI DÙNG LÀ NHÂN VIÊN
CREATE USER NHANVIEN1 for login NHANVIEN

-- ADD CÁC TÀI KHOẢN NHÂN VIÊN
ALTER ROLE RL_NHANVIEN ADD MEMBER NHANVIEN1

-- giám đốc có all quyền, giám đốc phân quyền cho phó giám đốc, phó giám đốc phân quyền phó giám đốc có cho nhân viên với trưởng phòng


-- ĐĂNG NHẬP VÀO PHÓ GIAMSD DỐC PHÂN QUYỀN CHO TRƯỞNG PHÒNG 


-- ĐĂNG NHẬP VÔ TRƯỞNG PHÒNG PHÂN QUYỀN CHO NHÂN VIÊN

-- Thu hồi quyền
REVOKE UPDATE on KhachHang to NHANVIEN1

-- Xoá người dùng
DROP User NhanVien1

-- Từ chối quyền người dùng
Deny UPDATE on KhachHang to NHANVIEN1



select * from vw_SoNhanVienMoiBoPhan

select * from vw_dsnhanvien_theochucvu_bophan

-- PHẦN 8 [TRANSACTION]
-- Transaction
-- 8.1.Roll back Transaction
-- Ví dụ thêm dữ liệu vào bảng KhachHang:
BEGIN TRAN
INSERT INTO KhachHang
VALUES ('KH052','LKH02',N'Hồ Kính',N'Đạt','Nam',
  'Singapore','0982645781','datio777@gmail.com',
  '05799417415')
-- 8.1 Thực thi
SELECT *
FROM KhachHang
ROLLBACK TRAN

-- 8.2 Commit Transaction
-- Ví dụ cập nhật dữ liệu Đơn giá bán lên 10% trong bảng ChiTietHoaDon với MaCTHD  là CTHD0001  sau đó dùng lệnh “Commit” 
-- để xác nhận thông tin thay đổi và không thể “RollBack” được: 
BEGIN TRAN
UPDATE ChiTietHoaDon 
SET DonGia = DonGia * 1.1
WHERE MaCTHD = 'CTHD0001'
-- 8.2 Thực thi
SELECT *
FROM ChiTietHoaDon
-- 8.2 Thực thi
COMMIT 
-- 8.2 Thực thi
ROLLBACK TRAN
-- 8.3 Save Point Transaction
-- 8.3 Tạo Transaction xóa toàn bộ thông tin khách hàng có mã 
-- “KH051”,”KH052” lưu vào SavePoint_1, SavePoint_2
BEGIN TRAN
DELETE
FROM KhachHang
WHERE MaKh = 'KH051'
SAVE TRAN SAVEPOINT_1

BEGIN TRAN
DELETE
FROM KhachHang
WHERE MaKh = 'KH052'
SAVE TRAN SAVEPOINT_2
-- 8.3 Thực Thi
ROLLBACK TRAN SAVEPOINT_1
-- 8.3 Thực thi
SELECT *
from KhachHang
-- 8.4 TRANSACTION HỆ THỐNG
-- Ví dụ tạo thủ tục cập nhật Đơn giá phòng trong bảng Loại phòng 
-- với tham số MaLoaiPhong do người dùng nhập và xác định giao dịch
-- hoàn thành hoặc quay lùi khi giao dịch có lỗi:
SELECT *From LoaiPhong

CREATE PROC sp_Capnhatgiaphong(@Malphong nchar(10), @Dgphong float)
AS
	DECLARE @Error int, @RowCount int 
	BEGIN TRAN
	UPDATE LoaiPhong
	SET DonGiaPhong = @Dgphong
	WHERE MaLoaiPhong = @Malphong
	SELECT @Error = @@ERROR, @RowCount = @@ROWCOUNT
	IF(@Error<>0 OR @RowCount<>1)
	BEGIN
		ROLLBACK TRAN
		RETURN -999
	END
	ELSE
	BEGIN
		COMMIT TRAN
		RETURN 0
	END
-- 8.4 THỰC THI
DECLARE @Bientam int
DECLARE @Maloaiphong nchar(10)
SET @Maloaiphong = 'LP010'
EXEC @Bientam = sp_Capnhatgiaphong @Maloaiphong,'1800000'
IF @Bientam<>0
	PRINT N'Lỗi do nhập sai mã Loại phòng!'
ELSE
	SELECT *
	FROM LoaiPhong WHERE MaLoaiPhong = @Maloaiphong


-- PHẦN 9 [WINDOW FUNCTIONS]
-- 9.1 Sắp xếp thông tin giảm dần theo khách hàng có Đơn giá hóa đơn là
-- lớn nhất OVER()
SELECT hd.MaKH,hd.MaHoaDon,MaCTHD,DonGia,
RANK() OVER (ORDER BY Dongia DESC) as N'Thứ tự'
FROM ChiTietHoaDon cthd join HoaDon hd on cthd.MaHD = hd.MaHoaDon
-- 9.2. OVER(Participant by) Sắp xếp thông tin giảm dần với đơn giá hóa đơn là lớn nhất theo từng loại Mã hóa đơn
SELECT hd.MaKH,hd.MaHoaDon,MaCTHD,DonGia,
RANK() OVER (PARTITION BY hd.Mahoadon ORDER BY Dongia DESC) AS N'Thứ tự'
FROM ChiTietHoaDon cthd join HoaDon hd on cthd.MaHD = hd.MaHoaDon
-- 9.3. Tính tỉ lệ phần trăm số tiền đóng góp của mỗi khách hàng vào tổng doanh thu của khách sạn
SELECT hd.MaHoaDon, kh.MaKh,
SUM(cthd.DonGia) OVER () AS TONGDOANHTHU
, cthd.DonGia/SUM(cthd.DonGia) OVER () AS Phantramdonggop
FROM ChiTietHoaDon cthd join HoaDon hd on cthd.MaHD = hd.MaHoaDon join KhachHang kh on kh.MaKh = hd.MaKH
---- power bi
create view doanhthune
as
select NV.manv, sum (dongia) [Doanh thu]
from NhanVien NV join HoaDon HD on NV.MaNV = HD.manv join ChiTietHoaDon CTHD on CTHD.mahd = HD.mahoadon
group by NV.manv
