create table empresa (
	cif			varchar(11) primary key,
	nombre		varchar(50),
	direccion	varchar(100),
	telefono	varchar(12)
);

create table alumnos (
	dni			varchar(11) primary key,
	nombre		varchar(50),
	direccion	varchar(100),
	telefono	varchar(12),
	edad		integer,
	empresa		varchar(30)
);

create table alumnos_asisten (
	dni			varchar(11),
	n_concreto	integer,
	constraint pk_alumnos_asisten primary key(dni, n_concreto)
);

create table cursos (
	n_concreto		integer primary key,
	fecha_inicio	date,
	fecha_fin		date,
	dni_profesor	varchar(11),
	tipo_curso		integer
);

create table tipos_curso (
	cod_curso	integer primary key,
	duracion	integer,
	programa	varchar(50),
	titulo		varchar(50)
);

create table profesores (
	dni			varchar(11) primary key,
	nombre		varchar(20),
	apellido	varchar(30),
	telefono	varchar(12),
	direccion	varchar(100)
);


alter table alumnos add constraint fk_alumnos_empresa foreign key (empresa) references empresa (cif);

alter table alumnos_asisten
	add constraint fk_alumnos_asisten_alumnos foreign key (dni) references alumnos(dni),
	add constraint fk_alumnos_asisten_cursos foreign key (n_concreto) references cursos(n_concreto);

alter table cursos 
	add constraint fk_cursos_profesores foreign key (dni_profesor) references profesores(dni),
	add constraint fk_cursos_tipos_curso foreign key (tipo_curso) references tipos_curso(cod_curso);


