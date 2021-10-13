<------------------------------PERTEMUAN 1----------------------------->
<------------------------- TABEL MAHASISWA BARU ----------------------->

create table mahasiswaBaru(
nim varchar (10) NOT NULL,
nama varchar (30),
jenis_kelamin varchar (9),
tanggallahir date,
tempatlahir varchar (20),
alamat varchar (30),
CONSTRAINT mhs_key PRIMARY KEY (nim)
);

SELECT * from mahasiswaBaru;
select nim, nama, alamat from mahasiswaBaru where tempatlahir='surabaya';

INSERT INTO mahasiswaBaru VALUES ('2016420080','eki','perempuan','22-08-1997','malang','jln.kenjeran');
insert into mahasiswaBaru values ('2014420072','andi','laki-laki','01-02-1990','surabaya','jln.nginden');
insert into mahasiswaBaru values ('2016420071','lia','perempuan','16-01-1998','surabaya','jln.rungkut');
insert into mahasiswaBaru values ('2016420033','arief','laki-laki','16-12-1997','surabaya','jln.bulak banteng');
insert into mahasiswaBaru values ('2016420116','firman','laki-laki','02-04-1998','mojokerto','jln.semolowaru 123');
insert into mahasiswaBaru values ('2016420117','lala','perempuan','01-03-1996','kediri',' ');
insert into mahasiswaBaru values ('2016420114','lilis','perempuan','07-04-1998','mojokerto','jln.prapen 123');

update mahasiswaBaru set nama = 'wati' where nim = '2016420080'
update mahasiswaBaru set jenis_kelamin = 'perempuan' where nama = 'wati'

select * from mahasiswaBaru

delete from mahasiswaBaru where nim ='2016420030';
delete from mahasiswaBaru where nim ='2016420070';
delete from mahasiswaBaru where nim ='2014420078';
delete from mahasiswaBaru where nim ='2016420087';


<------------------------- TABEL JURUSAN ----------------------->

create table JURUSAN(
kode_jurusan varchar (5) NOT NULL,
nama_jurusan varchar (30),
CONSTRAINT kodjur_key PRIMARY KEY (kode_jurusan)
);

SELECT * from JURUSAN;

insert into JURUSAN values ('20104','bhs.indo');
insert into JURUSAN values ('20122','akuntansi');
insert into JURUSAN values ('20141','sipil');
insert into JURUSAN values ('20132','infor');
insert into JURUSAN values ('20190','sas.jepang');

ALTER TABLE mahasiswaBaru
add column kodejurusan varchar (5),
add CONSTRAINT kodjur_key FOREIGN KEY (kodejurusan)
REFERENCES JURUSAN (kode_jurusan);

update mahasiswaBaru set kodejurusan = '20141' where nim ='2016420080';
update mahasiswaBaru set kodejurusan = '20122' where nim ='2014420072';
update mahasiswaBaru set kodejurusan = '20104' where nim ='2016420071';
update mahasiswaBaru set kodejurusan = '20133' where nim ='2016420033';
update mahasiswaBaru set kodejurusan = '20190' where nim ='2016420116';
update mahasiswaBaru set kodejurusan = '20132' where nim ='2016420117';


<-------------------------TUGAS PERTEMUAN 1-------------------------------->
<------------------------- TABEL FAKULTAS --------------------------------->

create table fakultas(
kodefakultas varchar (2) NOT NULL,
namafakultas varchar (30),
CONSTRAINT kodfak PRIMARY KEY (kodefakultas)
);

SELECT * from fakultas;

insert into fakultas values ('33','ilmu administrasi');
insert into fakultas values ('42','teknik');
insert into fakultas values ('90','hukum');
insert into fakultas values ('58','informatika');
insert into fakultas values ('23','sastra');

ALTER TABLE JURUSAN
add column KodeFakultas varchar (2),
add CONSTRAINT kodfak FOREIGN KEY (KodeFakultas)
REFERENCES fakultas (kodefakultas);

update JURUSAN set kodefakultas = '42' where kode_jurusan ='20141';
update JURUSAN set kodefakultas = '33' where kode_jurusan ='20122';
update JURUSAN set kodefakultas = '90' where kode_jurusan ='20104';
update JURUSAN set kodefakultas = '55' where kode_jurusan ='20133';
update JURUSAN set kodefakultas = '23' where kode_jurusan ='20190';
update JURUSAN set kodefakultas = '42' where kode_jurusan ='20132';


<------------------------- TABEL MATA KULIAH ----------------------->

create table MataKuliah(
KodeMK varchar (6) NOT NULL,
NamaMK varchar (40),
SKS int ,
CONSTRAINT kodemak PRIMARY KEY (KodeMK)
);

SELECT * from MataKuliah;

insert into MataKuliah values ('MK4532','SISTEM OPERASI','4');
insert into MataKuliah values ('MK6788','SISTEM INFORMASI','2');
insert into MataKuliah values ('MK0987','SISTEM BASIS DATA','4');
insert into MataKuliah values ('MK3246','ALJABAR','3');
insert into MataKuliah values ('MK9879','METODE NUMERIK','3');
insert into MataKuliah values ('MK9087','KALKULUS','3');


<------------------------- TABEL KRS ----------------------------->

create table KRS(
NIM varchar (10) NOT NULL,
NilaiUTS Float ,
NilaiUAS Float ,
CONSTRAINT daftarKRS PRIMARY KEY (NIM)
);

SELECT * from KRS;

insert into KRS values ('2015420078','79','78');
insert into KRS values ('2015420073','100','88');
insert into KRS values ('2014420085','70','56');
insert into KRS values ('2012420034','90','57');
insert into KRS values ('2017420118','56','78');

delete from KRS where nim ='2012420034'; <--UNTUK MENGHAPUS BARIS PADA KOLOM
delete from KRS where nim ='2017420118';

ALTER TABLE KRS DROP COLUMN kode_mk <--UNTUK MENGHAPUS KOLOM PADA TABEL

ALTER TABLE KRS
add column KodeMK varchar (6),
add CONSTRAINT kodmatkul FOREIGN KEY (KodeMK)
REFERENCES MataKuliah (KodeMK);

update KRS set KodeMK = 'MK4532' where NIM = '2015420078';
update KRS set KodeMK = 'MK6788' where NIM = '2015420073';
update KRS set KodeMK = 'MK0987' where NIM = '2014420085';
update KRS set KodeMK = 'MK3246' where NIM = '2012420034';
update KRS set KodeMK = 'MK9879' where NIM = '2017420118';


<------------------------------PERTEMUAN 2----------------------------->

<--restricting kolom
SELECT nama , nim from mahasiswaBaru;

<--restricting baris
select * from KRS where nilaiuts between 60 and 100;

<--sorting
select * from mahasiswaBaru order by nim asc;
select * from mahasiswaBaru order by nim desc;

<--restricting kolom as , ganti nama kolom
SELECT nama as namasiswa, nim as nomer from mahasiswaBaru;

<--restricting baris menggunakan klausa WHERE
select nim, nama from mahasiswaBaru where kodejurusan='20104';
select nim, nama from mahasiswaBaru where kodejurusan='20104' OR kodejurusan='20133';
select nim, nama from mahasiswaBaru where kodejurusan IN ('20104','20133')

<--restricting baris menggunakan klausa LIKE
select nim , nama from mahasiswaBaru where nim LIKE '2016420080'
select nim , nama from mahasiswaBaru where nama LIKE 'a%'
select nim , nama from mahasiswaBaru where nama LIKE '%a'


<------------------------------TUGAS PERTEMUAN 2----------------------------->

select nama, alamat from mahasiswaBaru									<--no 1
select * from mahasiswaBaru where alamat=' ' 								<--no 2
select * from mahasiswaBaru where tanggallahir between '01-01-1980' and '31-12-1990'; 			<--no 3
select * from mahasiswaBaru where tempatlahir='malang' 							<--no 4

alter table MataKuliah
add column Semester_matkul varchar (2) ,
add CONSTRAINT KodeMK FOREIGN KEY (Semester)
REFERENCES MataKuliah (KodeMK);
select * from MataKuliah;
update MataKuliah set semester_matkul = '3' where kodemk = 'MK4532';
update MataKuliah set semester_matkul = '1' where kodemk = 'MK6788';
update MataKuliah set semester_matkul = '5' where kodemk = 'MK0987';
update MataKuliah set semester_matkul = '2' where kodemk = 'MK3246';
update MataKuliah set semester_matkul = '4' where kodemk = 'MK9879';

select * from MataKuliah where semester_matkul between '3' and '5'; 					<--no 5
<---------- ALTER TABLE MataKuliah DROP COLUMN semester							<-- hapus kolom pada tabel
select * from mahasiswaBaru, JURUSAN where nama_jurusan='infor' OR nama_jurusan='sipil';   		<--no 6
select * from mahasiswaBaru , JURUSAN where nama_jurusan not in ('infor' , 'sipil'); 


<------------------------------PERTEMUAN 3----------------------------->

<--fungsi string
select 'ike ' || 'rokhmawati' as "nama"		<-- menggabungkan string 
select char_length ('UNITOMO')			<-- menghitung jumlah karakter
select lower ('UNITOMO')			<-- mengubah tulisan type string menjadi huruf kecil
select upper ('unitomo')			<-- mengubah tulisan type string menjadi huruf besar
select substr ('unitomo',4,3)			<-- mendapatkan beberapa karakter

<--fungsi date
select current_date				<-- menampilkan tanggal hari ini
select current_time				<-- menampilkan waktu hari ini
select age (timestamp '1997-08-22')		<-- menghitung selisih dgn current time, menampilkan usia
select date_part ('years',current_date)
select current_date + integer '10'		<-- menambah hari

<--fungsi agregate
select avg ("nilaiuts") as "Rata-rata Nilai UTS" from KRS
select count(*) from KRS
select count(nilaiuts) from KRS
select max (nim) from mahasiswaBaru
select min (nilaiuts) from KRS
select sum (nilaiuas) from KRS
select initcap (nama) from mahasiswaBaru	<--huruf depannya besar

<--menampilkan jumlah mahasiswa dikelompokkan perjurusan
select nama_jurusan, count(nim) as JumlahMHS from mahasiswaBaru, JURUSAN where mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan 
Group By nama_jurusan order by nama_jurusan

<--menampilkan nama jurusan dan jumlah mahasiswa per angkatan lebih dari 10
select nama_jurusan, substr(nim,1,4) as angkatan, count(nim) as jumlahmhs from mahasiswaBaru, JURUSAN where mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan 
Group By nama_jurusan , substr(nim,1,4) having count(nim) <10

<--menampilkan nama dan usia tertua
select nama, max(
date_part('year',age(tanggallahir)) ) || 'tahun' as "usia tertua" from mahasiswaBaru Group By nama


<------------------------------TUGAS PERTEMUAN 3----------------------------->
select nama, max(
date_part('year',age(tanggallahir)) ) || 'tahun' as "usia" from mahasiswaBaru Group By nama, alamat 	<--no 1

select * from mahasiswaBaru where tanggallahir BETWEEN '1980-01-01' and '1980-12-31';			<--no 2


<------------------------------KUIS KUIS PRAKTIKUM----------------------------->
SELECT * from mahasiswaBaru; 										<--1
select nama, nim, kodejurusan from mahasiswaBaru; 							<--2
select initcap (nama) from mahasiswaBaru;
select * from mahasiswaBaru order by nama desc; 							<--3
select nim, nilaiuts from KRS where nilaiuts > 50; 							<--4
select sum (nilaiuas) from KRS 										<--5
SELECT * from mahasiswaBaru, JURUSAN; 									<--6
select nim , nama from mahasiswaBaru where nama LIKE 'a%' 						<--7
select nama from mahasiswaBaru, JURUSAN where nama_jurusan='infor' OR nama_jurusan='sipil'; 		<--8
SELECT kode_jurusan, nama_jurusan as jenisjurusan from JURUSAN; 					<--9
SELECT * from MataKuliah, KRS; 										<--10


SELECT NIM, substr (NIM,1,4) as angkatan from mahasiswaBaru
create function keluar (anyelement, anyelement) returns anyelement as '
declare
	hasil alias for $0;
	hasil1 alias for $1;
	hasil2 alias for $2;
begin
	hasil  = hasil1 + hasil2;
	return hasil;
end;
'language plpgsql;
SELECT NIM, substr (NIM,1,4) as angkatan from mahasiswaBaru;
select * from keluar (2016,4);



<------------------------------PERTEMUAN 4---------------------------------->

select * from mahasiswaBaru inner join JURUSAN ON mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan;
select * from mahasiswaBaru left join JURUSAN ON mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan;
select * from mahasiswaBaru right join JURUSAN ON mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan;
select * from mahasiswaBaru full join JURUSAN ON mahasiswaBaru.kodejurusan = JURUSAN.kode_jurusan;
select * from mahasiswaBaru where nim not in (select nim from KRS)					<--SUB QUERY , ada 2 tabel namun yang 1 hanya untuk penentuan


<------------------------------TUGAS PERTEMUAN 4----------------------------->

insert into MataKuliah values ('MK9087','KALKULUS','3');
select * from MataKuliah where KodeMK not in (select KodeMK from KRS)		<--no 1

delete from MataKuliah where KodeMK not in (select KodeMK from KRS)
select * from MataKuliah;							<--no 2


<---------------------------------PERTEMUAN 5--------------------------------->
 
create function tambah (int, int, int) returns int as 'select $1 + $2 + $3' language 'sql';
select tambah (7,8,9)

create function add_four_values (anyelement, anyelement, anyelement) returns anyelement as '
declare
	hasil alias for $0;
	hasil1 alias for $1;
	hasil2 alias for $2;
	hasil3 alias for $3;
begin
	hasil  = hasil1 + hasil2 + hasil3;
	return hasil;
end;
'language plpgsql;
select * from add_four_values (1,2,3)


<-----------------------------------UJI COBA-------------------------------------->
 
create table pembeli(
No_Pesan char (10) NOT NULL,
nama varchar (50),
Tgl_Pesan date,
Jumlah float,
CONSTRAINT pembeli_key PRIMARY KEY (No_Pesan)
);

select * from pembeli;

alter table pembeli
add column idbarang char (10),
add constraint idbar_key FOREIGN KEY (idbarang)
REFERENCES toko (ID_Barang)

insert into pembeli values ('1234','Ike Rokhmawati','01-12-2016','4');
insert into pembeli values ('5678','Arief Tri','23-11-2016','10');
insert into pembeli values ('9012','Rita Fathul','31-12-2016','23');

update pembeli set idbarang = 'E123' where No_Pesan = '1234';
update pembeli set idbarang = 'F675' where No_Pesan = '5678';



create table toko(
ID_Barang char (10) NOT NULL,
nama_barang varchar (50),
harga int,
Tgl_masuk date,
CONSTRAINT toko_key PRIMARY KEY (ID_Barang)
);

select * from toko;
insert into toko values ('E123','celana panjang',120000,'08-11-2017');
insert into toko values ('F675','kemeja polos',50000,'01-10-2017');


ALTER TABLE warung RENAME TO toko;		<----------------------------------- ganti nama tabel
drop table pembeli;				<----------------------------------- hapus tabel
drop database ffgh;				<----------------------------------- hapus database
delete from toko where ID_Barang = 'E123';

