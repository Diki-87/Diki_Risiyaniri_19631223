CREATE TABLE lokasi (
id INT NOT NULL AUTO_INCREMENT ,
nama_lokasi VARCHAR(255) NOT NULL ,
PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO lokasi (id, nama_lokasi) VALUES
(NULL, 'Banjarmasin'),
(NULL, 'Banjarbaru'),
(NULL, 'Gambut');

UPDATE lokasi SET nama_lokasi = 'Kota Banjarmasin' WHERE
id = 1;
UPDATE lokasi SET nama_lokasi = 'Kota Banjarbaru' WHERE
id = 2;
UPDATE lokasi SET nama_lokasi = 'Kabupaten Banjar' WHERE
id = 3;

CREATE TABLE jabatan (
id INT NOT NULL AUTO_INCREMENT ,
nama_jabatan VARCHAR(255) NOT NULL ,
gapok_jabatan DOUBLE NOT NULL ,
tunjangan_jabatan DOUBLE NOT NULL ,
uang_makan_perhari DOUBLE NOT NULL ,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO jabatan (id, nama_jabatan,
gapok_jabatan, tunjangan_jabatan, uang_makan_perhari)
VALUES
(NULL, 'System Analyst', 2400000, 500000, 40000),
(NULL, 'Project Manager', 2300000, 450000, 38000),
(NULL, 'Senior Programmer', 2200000, 400000, 36000),
(NULL, 'Junior Programmer', 2100000, 350000, 34000),
(NULL, 'Intern', 1000000, 100000, 20000);

UPDATE jabatan SET nama_jabatan = 'Magang' WHERE
jabatan.id = 5;

CREATE TABLE pengguna (
id INT NOT NULL AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
peran ENUM('ADMIN','USER'),
login_terakhir TIMESTAMP NULL,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO pengguna (id, username, password,
peran, login_terakhir) VALUES
(NULL, 'admin', MD5('admin'), 'ADMIN', NULL),
(NULL, 'user', MD5('user'), 'USER', NULL),
(NULL, 'johndoe', MD5('johndoe'), 'USER', NULL),
(NULL, 'fulanbinfulan', MD5('fulanbinfulan'), 'USER',
NULL),
(NULL, 'mawar', MD5('mawar'), 'USER', NULL),
(NULL, 'melati', MD5('melati'), 'USER', NULL),
(NULL, 'dahlia', MD5('user'), 'USER', NULL),
(NULL, 'lily', MD5('lily'), 'USER', NULL);

CREATE TABLE karyawan (
id INT NOT NULL AUTO_INCREMENT,
nik VARCHAR(255) NOT NULL,
nama_lengkap VARCHAR(255) NOT NULL,
handphone VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
tanggal_masuk DATE NOT NULL,
pengguna_id INT,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO karyawan (id, nik, nama_lengkap,
handphone, email, tanggal_masuk, pengguna_id
) VALUES
(NULL, '001', 'Admin', '08112011',
'admin@mail.com','2011-01-01', 1),
(NULL, '002', 'Tes User', '08112012',
'user@mail.com','2012-02-02', 2),
(NULL, '003', 'John Doe', '08112013',
'john@mail.com', '2013-03-03', 3),
(NULL, '004', 'Fulan Bin Fulan', '08112014',
'fulan@mail.com', '2014-04-04', 4),
(NULL, '005', 'Mawar Kurniani', '08112015',
'mawar@mail.com', '2015-05-05', 5),
(NULL, '006', 'Melati Rahmawati','08112016',
'melati@mail.com', '2016-06-06', 6),
(NULL, '007', 'Dahlia Setiani','08112017',
'dahlia@mail.com', '2017-07-07', 7),
(NULL, '008', 'Lily Handayani', '08112018',
'lily@mail.com', '2018-08-08', 8);

CREATE TABLE bagian (
id INT NOT NULL AUTO_INCREMENT ,
nama_bagian VARCHAR(255) NOT NULL ,
karyawan_id INT NOT NULL ,
lokasi_id INT NOT NULL ,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO bagian (id, nama_bagian,
karyawan_id, lokasi_id) VALUES
(NULL, 'Autentikasi', 5, 1),
(NULL, 'Data Science', 3, 1),
(NULL, 'Backend Developer', 6, 2);

CREATE TABLE jabatan_karyawan (
id INT NOT NULL AUTO_INCREMENT ,
jabatan_id INT NOT NULL ,
karyawan_id INT NOT NULL ,
tanggal_mulai DATE NOT NULL ,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO jabatan_karyawan (id, karyawan_id,
jabatan_id, tanggal_mulai) VALUES
(NULL, 3, 5, '2013-03-03'),
(NULL, 3, 4, '2014-04-01'),
(NULL, 4, 5, '2014-04-04'),
(NULL, 3, 3, '2015-05-04'),
(NULL, 4, 4, '2015-05-05'),
(NULL, 5, 5, '2015-05-05'),
(NULL, 3, 2, '2015-06-01'),
(NULL, 4, 3, '2015-06-02'),
(NULL, 5, 4, '2015-06-03'),
(NULL, 6, 5, '2015-06-06'),
(NULL, 3, 1, '2017-07-01'),
(NULL, 4, 2, '2017-07-02'),
(NULL, 5, 3, '2017-07-02'),
(NULL, 6, 4, '2017-07-02'),
(NULL, 7, 5, '2017-07-07'),
(NULL, 7, 4, '2018-08-02'),
(NULL, 8, 5, '2018-08-08');

CREATE TABLE bagian_karyawan (
id INT NOT NULL AUTO_INCREMENT ,
bagian_id INT NOT NULL ,
karyawan_id INT NOT NULL ,
tanggal_mulai DATE NOT NULL ,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO `bagian_karyawan` (`id`, `bagian_id`,
`karyawan_id`, `tanggal_mulai`) VALUES
(NULL, 1, 5, '2018-03-03'),
(NULL, 2, 3, '2018-04-01'),
(NULL, 3, 6, '2018-04-04'),
(NULL, 1, 4, '2018-03-03'),
(NULL, 2, 7, '2018-04-01'),
(NULL, 3, 8, '2018-04-04');

CREATE TABLE penggajian (
id INT NOT NULL AUTO_INCREMENT ,
karyawan_id INT NOT NULL ,
tahun YEAR ,
bulan CHAR(2) ,
gapok DOUBLE ,
tunjangan DOUBLE ,
uang_makan DOUBLE ,
PRIMARY KEY (id)
) ENGINE = INNODB;

INSERT INTO penggajian (id, karyawan_id, tahun,
bulan, gapok, tunjangan, uang_makan) VALUES
(NULL, 3, '2020','11',2400000,500000,800000),
(NULL, 4, '2020','11',2300000,450000,684000),
(NULL, 5, '2020','11',2200000,400000,684000),
(NULL, 6, '2020','11',2100000,350000,640000),
(NULL, 7, '2020','11',2100000,350000,612000),
(NULL, 8, '2020','11',1000000,100000,380000),
(NULL, 3, '2020','12',2400000,500000,800000),
(NULL, 4, '2020','12',2300000,450000,722000),
(NULL, 5, '2020','12',2200000,400000,720000),
(NULL, 6, '2020','12',2100000,350000,680000),
(NULL, 7, '2020','12',2100000,350000,646000),
(NULL, 8, '2020','12',1000000,100000,360000),
(NULL, 3, '2021','01',2400000,500000,800000),
(NULL, 4, '2021','01',2300000,450000,722000),
(NULL, 5, '2021','01',2200000,400000,612000),
(NULL, 6, '2021','01',2100000,350000,680000),
(NULL, 7, '2021','01',2100000,350000,646000),
(NULL, 8, '2021','01',1000000,100000,340000);

CREATE TABLE `presensi` ( 
    `id` INT NOT NULL AUTO_INCREMENT , 
    `karyawan_id` INT NOT NULL , 
    `tanggal` DATE NOT NULL , 
    `jam_masuk` TIME , 
    `jam_keluar` TIME , 
    `keterangan` ENUM ('HADIR','SAKIT','IZIN','CUTI','AKHIR PEKAN','LIBUR NASIONAL','TANPA KETERANGAN'), 
    PRIMARY KEY (`id`)
) ENGINE = INNODB;

INSERT INTO `presensi` (`id`, `karyawan_id`, `tanggal`, `jam_masuk`, `jam_keluar`, `keterangan`) VALUES 
(NULL, 3, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-03','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-04','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-06','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 3, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-18','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-19','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-25','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 3, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-02','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-03','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 3, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-14','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-17','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 3, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 3, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-29','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-30','08:00','16:00','HADIR'),
(NULL, 3, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 3, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-04','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-06','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-21','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-26','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-27','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 3, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 3, '2021-01-31',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-03','08:35','16:00','HADIR'),
(NULL, 4, '2020-11-04',NULL,NULL,'SAKIT'),
(NULL, 4, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-06','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 4, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-18','08:45','16:00','HADIR'),
(NULL, 4, '2020-11-19',NULL,NULL,'IZIN'),
(NULL, 4, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-25','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 4, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-02','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-03','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 4, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-14','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-17',NULL,NULL,'SAKIT'),
(NULL, 4, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 4, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 4, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-29','08:50','16:00','HADIR'),
(NULL, 4, '2020-12-30','08:00','16:00','HADIR'),
(NULL, 4, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 4, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-04','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-06','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-21',NULL,NULL,'IZIN'),
(NULL, 4, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-26','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-27','08:40','16:00','HADIR'),
(NULL, 4, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 4, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 4, '2021-01-31',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-03','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-04','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-06','08:35','16:00','HADIR'),
(NULL, 5, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 5, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-18','08:35','16:00','HADIR'),
(NULL, 5, '2020-11-19','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-25',NULL,NULL,'SAKIT'),
(NULL, 5, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 5, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-02','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-03','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 5, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-14','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-17','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 5, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 5, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-29','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-30','08:00','16:00','HADIR'),
(NULL, 5, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 5, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-04','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-06',NULL,NULL,'IZIN'),
(NULL, 5, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-21','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-26',NULL,NULL,'SAKIT'),
(NULL, 5, '2021-01-27',NULL,NULL,'SAKIT'),
(NULL, 5, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 5, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 5, '2021-01-31',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-03','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-04','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-06','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 6, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-18','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-19','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-25','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 6, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-02','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-03','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 6, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-14','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-17','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 6, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 6, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-29','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-30','08:00','16:00','HADIR'),
(NULL, 6, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 6, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-04','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-06','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-21','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-26','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-27','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 6, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 6, '2021-01-31',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-03','08:35','16:00','HADIR'),
(NULL, 7, '2020-11-04',NULL,NULL,'SAKIT'),
(NULL, 7, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-06','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 7, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-18','08:45','16:00','HADIR'),
(NULL, 7, '2020-11-19',NULL,NULL,'IZIN'),
(NULL, 7, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-25','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 7, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-02','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-03','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 7, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-14','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-17',NULL,NULL,'SAKIT'),
(NULL, 7, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 7, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 7, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-29','08:50','16:00','HADIR'),
(NULL, 7, '2020-12-30','08:00','16:00','HADIR'),
(NULL, 7, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 7, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-04','08:55','16:00','HADIR'),
(NULL, 7, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-06','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-21',NULL,NULL,'IZIN'),
(NULL, 7, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-26','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-27','08:40','16:00','HADIR'),
(NULL, 7, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 7, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 7, '2021-01-31',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-01',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-02','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-03','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-04','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-05','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-06','08:35','16:00','HADIR'),
(NULL, 8, '2020-11-07',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-08',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-09','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-10',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 8, '2020-11-11','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-12','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-13','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-14',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-15',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-16','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-17','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-18','08:35','16:00','HADIR'),
(NULL, 8, '2020-11-19','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-20','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-21',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-22',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-23','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-24','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-25',NULL,NULL,'IZIN'),
(NULL, 8, '2020-11-26','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-27','08:00','16:00','HADIR'),
(NULL, 8, '2020-11-28',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-29',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-11-30','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-01','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-02',NULL,NULL,'CUTI'),
(NULL, 8, '2020-12-03',NULL,NULL,'CUTI'),
(NULL, 8, '2020-12-04','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-05',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-06',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-07','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-08','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-09',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 8, '2020-12-10','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-11','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-12',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-13',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-14','08:37','16:00','HADIR'),
(NULL, 8, '2020-12-15','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-16','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-17','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-18','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-19',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-20',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-21','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-22','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-23','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-24',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 8, '2020-12-25',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 8, '2020-12-26',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-27',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2020-12-28','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-29','08:00','16:00','HADIR'),
(NULL, 8, '2020-12-30','08:35','16:00','HADIR'),
(NULL, 8, '2020-12-31','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-01',NULL,NULL,'LIBUR NASIONAL'),
(NULL, 8, '2021-01-02',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-03',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-04','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-05','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-06',NULL,NULL,'IZIN'),
(NULL, 8, '2021-01-07','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-08','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-09',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-10',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-11','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-12','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-13','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-14','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-15','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-16',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-17',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-18','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-19','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-20','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-21','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-22','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-23',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-24',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-25','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-26',NULL,NULL,'SAKIT'),
(NULL, 8, '2021-01-27',NULL,NULL,'SAKIT'),
(NULL, 8, '2021-01-28','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-29','08:00','16:00','HADIR'),
(NULL, 8, '2021-01-30',NULL,NULL,'AKHIR PEKAN'),
(NULL, 8, '2021-01-31',NULL,NULL,'AKHIR PEKAN');