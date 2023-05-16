drop database if exists TurisMaps;
create database TurisMaps;
use TurisMaps;

create table TURISTA(
id_turista int primary key not null,
correo nvarchar(30),
nombre nvarchar(40),
apellido_pat nvarchar(40),
apellido_mat nvarchar(40),
fecha_nac date,
lugar_proc nvarchar(30),
genero nvarchar(10),
contraseña nvarchar(20),
nombre_user nvarchar(45)
);


create table LUGAR(
id_lugar int primary key not null,
nombre_lugar nvarchar(40)
);


create table COMENTARIOS(
id_comentario int primary key not null,
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









