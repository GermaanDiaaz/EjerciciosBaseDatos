create table Categoria (
	id_categoria	serial,
	nombre			text not null,
	descripcion		varchar
);

create table Producto (
	cod_producto	serial,
	nombre			text not null,
	descripcion		varchar,
	pvp				decimal(5, 2) not null,
	categoria		serial,

	constraint fk_Producto_Categoria foreign key (categoria) references Categoria(id_categoria)
);

create table Trabajador (
	num_trabajador		serial,
	nombre_completo		text not null,
	email				varchar(320),
	cuenta_corriente	varchar(24),
	pass				varchar(12),

	constraint uk_Trabajador check (email in(%'@'%)),
	constraint uk_Trabajador check (cuenta_corriente in('ES'%)),
	constraint uk_Trabajador check (pass != in(%'_'%))
);

create table Comprador (
	dni				varchar(10),
	nombre_completo	text not null,
	email			varchar(320),
	direccion		varchar(100),
	fecha_alta		date,

	constraint uk_Comprador check (email in(%'@'%))
);

create table Pedido (
	cod_pedido		serial,
	fecha_pedido	date not null,
	num_trabajador	serial not null,
	dni_comprador	varchar(10) not null,

	constraint fk_Pedido_Trabajador foreign key (num_trabajador) references Trabajador(num_trabajador),
	constraint fk_Pedido_Comprador foreign key (dni_comprador) references Comprador(dni_comprador),
);

create table DetallePedido (
	cod_pedido		serial,
	num_detalle		serial,
	cantidad		integer,
	cod_producto	serial,
	precio			decimal(5, 2) not null,
	descuento		integer default (0) not null,

	constraint uk_DetallePedido check (cantidad >= 0),
	constraint fk_DetallePedido_Producto foreign key (cod_producto) references Producto(cod_producto),
	constraint fk_DetallePedido_Pedido foreign key (cod_pedido) references Pedido(cod_pedido)
);

alter table DetallePedido add constraint uk_DetallePedido where(Comprador(nombre_completo)= 'Fernando Fanegas') check (descuento = 15);

