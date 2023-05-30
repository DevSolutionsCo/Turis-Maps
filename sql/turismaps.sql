drop database if exists turismaps;
create database turismaps;
use turismaps;

create table TURISTA(
id_turista int not null auto_increment primary key,
correo nvarchar(30),
nombre nvarchar(40),
apellido_pat nvarchar(40),
apellido_mat nvarchar(40),
fecha_nac date,
lugar_proc nvarchar(30),
genero nvarchar(10),
contrasena nvarchar(20),
nombre_user nvarchar(45)
);


create table LUGAR(
id_lugar int primary key not null,
nombre_lugar nvarchar(40)
);

insert into LUGAR (id_lugar, nombre_lugar) values
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
id_comentario int primary key auto_increment,
comentario nvarchar(100),
calificacion int(1),
fecha date,
id_turista int,
id_lugar int,
foreign key (id_lugar) references LUGAR(id_lugar) on update cascade on delete cascade,
foreign key (id_turista) references TURISTA(id_turista) on update cascade on delete cascade
);


create table TURISTA_COMENTARIOS(
id_comentario int,
id_turista int,
foreign key (id_comentario) references COMENTARIOS(id_comentario) on update cascade on delete cascade,
foreign key (id_turista) references TURISTA(id_turista) on update cascade on delete cascade
);


create table LUGAR_COMENTARIOS(
id_comentario int,
id_lugar int,
foreign key (id_comentario) references COMENTARIOS(id_comentario) on update cascade on delete cascade,
foreign key (id_lugar) references LUGAR(id_lugar) on update cascade on delete cascade
);









