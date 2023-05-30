drop database if exists turismaps;
create database turismaps;
use turismaps;

create table TURISTA(
ID_TURISTA int not null auto_increment primary key,
CORREO nvarchar(30),
NOMBRE nvarchar(40),
APELLIDO_PAT nvarchar(40),
APELLIDO_MAT nvarchar(40),
FECHA_NAC date,
LUGAR_PROC nvarchar(30),
GENERO nvarchar(10),
CONTRASENA nvarchar(20),
NOMBRE_USER nvarchar(45)
);


create table LUGAR(
ID_LUGAR int primary key not null,
NOMBRE_LUGAR nvarchar(40)
);

insert into LUGAR (ID_LUGAR, NOMBRE_LUGAR) values
(1, "Museo Frida Coyoacan"),
(2, "Mercado Coyoacan"),
(3, "Viveros Coyoacan"),
(4, "Jardin Centenario Coyoacan"),
(5, "museo de culturas populares"),
(6, "castillo de chapultepec"),
(7, "parque bicentenario"),
(8, "auditorio nacional"),
(9, "museo de antropologia"),
(10, "batiz"),
(11, "plaza 3 culturas"),
(12, "plaza de la constitucion"),
(13, "monumento a la revolucion"),
(14, "Bellas artes"),
(15, "angel de la independencia"),
(16, "Parque la mexicana"),
(17, "pasaje del shiro"),
(18, "club de golf"),
(19, "Exconvento"),
(20, "Valle de las monjas"),
(21, "Parque hundido"),
(22, "cineteca nacional"),
(23, "World Trade Center"),
(24, "monumental plaza de toros"),
(25, "Estadio Ciudad de los Deportes"),
(26, "Isla de las munecas"),
(27, "Las trajineras"),
(28, "Mercado de plantas Xochi"),
(29, "parque ecologico de Xochimilco"),
(30, "Museo arqueologico de xochimilco"),
(31, "Parque Tezozomoc"),
(32, "Casa de cultura"),
(33, "arena CDMX"),
(34, "Centro Verde Azcapotzalco"),
(35, "Alameda Norte"),
(36, "Estadio Alfredo"),
(37, "foro sol"),
(38, "Alameda Central"),
(39, "Autodromo Hermanos Rodriguez"),
(40, "Palacio de los deportes");


create table COMENTARIOS(
ID_COMENTARIO int primary key auto_increment,
COMENTARIO nvarchar(100),
CALIFICACION int(1),
FECHA date,
ID_TURISTA int,
ID_LUGAR int,
foreign key (ID_LUGAR) references LUGAR(ID_LUGAR) on update cascade on delete cascade,
foreign key (ID_TURISTA) references TURISTA(ID_TURISTA) on update cascade on delete cascade
);


create table TURISTA_COMENTARIOS(
ID_COMENTARIO int,
ID_TURISTA int,
foreign key (ID_COMENTARIO) references COMENTARIOS(ID_COMENTARIO) on update cascade on delete cascade,
foreign key (ID_TURISTA) references TURISTA(ID_TURISTA) on update cascade on delete cascade
);


create table LUGAR_COMENTARIOS(
ID_COMENTARIO int,
ID_LUGAR int,
foreign key (ID_COMENTARIO) references COMENTARIOS(ID_COMENTARIO) on update cascade on delete cascade,
foreign key (ID_LUGAR) references LUGAR(ID_LUGAR) on update cascade on delete cascade
);









