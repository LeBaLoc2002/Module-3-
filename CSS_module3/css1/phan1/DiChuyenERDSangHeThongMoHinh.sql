use Building_a_sales_management_database ;
create table Customer (
cID int not null primary key auto_increment,
cNAME varchar (40),
cAGE INT check (cAGE >= 18)
);

CREATE table orders (
oID int not null primary key auto_increment ,
cId int not null ,
oDate date ,
oTotalPrice double not null,
FOREIGN KEY (cID) references customer (Cid)
);

create table product (
pID int not null primary key auto_increment,
pName varchar (40) not null ,
pPrice double not null 
);

create table OrderDetail (
oID int not null ,
pID int not null ,
odQTY int not null ,
foreign key (oID)references orders (oID),
foreign key (pID)references product(pID)
);


























CREATE TABLE PhieuXuat(
	SoPX INT AUTO_INCREMENT PRIMARY KEY,
    NgayXuat DATE NOT NULL
);
CREATE TABLE VatTu(
	 MaVTU INT AUTO_INCREMENT PRIMARY KEY,
     TenVTU VARCHAR(50) NOT NULL
);


CREATE TABLE ChiTietPhieuXuat(
	SLXuat INT NOT NULL,
    DGXuat FLOAT NOT NULL,
    SoPX INT NOT NULL, 
    MaVTU INT NOT NULL,
    FOREIGN KEY (SoPX) REFERENCES PhieuXuat(SoPX),
    FOREIGN KEY (MaVTU) REFERENCES VatTu(MaVTU)
);

CREATE TABLE PhieuNhap(
	SoPN INT AUTO_INCREMENT PRIMARY KEY,
    NgayNhap DATE NOT NULL
);

CREATE TABLE ChiTietPhieuNhap(
	SLNhap INT NOT NULL,
    DGNhap FLOAT NOT NULL,
    SoPN INT NOT NULL, 
    MaVTU INT NOT NULL,
    FOREIGN KEY (SoPN) REFERENCES PhieuNhap(SoPN),
    FOREIGN KEY (MaVTU) REFERENCES VatTu(MaVTU)
);

	

CREATE TABLE NhaCC(
	MaNCC INT AUTO_INCREMENT PRIMARY KEY,
    TenNCC VARCHAR(50) NOT NULL UNIQUE,
    DiaChi VARCHAR(100) NOT NULL		
);

CREATE TABLE DonDH(
	SoDH INT AUTO_INCREMENT PRIMARY KEY,
    NgayDH DATE NOT NULL,
    MaNCC INT NOT NULL,
    FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
);

CREATE TABLE ChiTietDonHang(
	MaCTDH INT AUTO_INCREMENT PRIMARY KEY,
	MaVTU INT NOT NULL,
    SoDH INT NOT NULL,
	FOREIGN KEY (MaVTU) REFERENCES VatTu(MaVTU),
	FOREIGN KEY (SoDH) REFERENCES DonDH(SoDH)
);

CREATE TABLE SoDienThoai(
	MaNCC INT NOT NULL,
    SoDienThoai VARCHAR(20) NOT NULL,
	FOREIGN KEY (MaNCC) REFERENCES NhaCC(MaNCC)
    );