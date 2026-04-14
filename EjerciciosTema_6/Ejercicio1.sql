create table libro(
	isbn varchar(30),
	titulo varchar(50) not null,
	dni_autor varchar(11) not null,
	cod_genero integer not null,
	cod_editorial integer not null,

	constraint pk_libro primary key (isbn)
);

create table autor(
	dni varchar(11),
	nombre varchar(50) not null,
	nacionalidad varchar(30),

	constraint pk_autor primary key (dni)
);

create table editorial(
	cod_editorial serial,
	nombre varchar(30) not null,
	direccion varchar(50),
	poblacion varchar(50),

	constraint pk_editorial primary key (cod_editorial)
);

create table genero(
	id_genero serial,
	nombre varchar(30) not null,
	descripcion varchar(200),

	constraint pk_genero primary key (id_genero)
);

create table edicion(
	isbn serial,
	fecha_publicacion date,
	cantidad integer,

	constraint pk_edicion primary key (isbn, fecha_publicacion),
    constraint ck_edicion_cantidad check (cantidad > 0)
);


