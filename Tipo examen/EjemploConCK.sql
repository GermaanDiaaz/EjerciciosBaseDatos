create table invitado(
    NroInvitado integer,
    Nombre varchar(100) not null,
    Categoria varchar(50),
    Origen varchar(50),
	
    constraint pk_invitado primary key (NroInvitado)
);

create table teatro(
    CodTeat integer,
    Nombre varchar(100) not null,
    Direccion varchar(150),
    CantAsientos integer,
	
    constraint pk_teatro primary key (CodTeat)
);

create table obra(
    CodObra integer,
    NombreObra varchar(100) not null,
    Autor varchar(100),
	
    constraint pk_obra primary key (codobra)
);

create table tipo_asiento(
    Tipo integer,
    Nombre varchar(50) not null,
    Descripcion varchar(200),
	
    constraint pk_tipo_asiento primary key (Tipo)
);

create table asiento_tipo(
    NroAsiento integer,
    Tipo integer not null,
    constraint pk_asiento_tipo primary key (NroAsiento)
);

create table exhibe(
    CodTeat integer,
    Fecha date,
    CodObra integer not null,
	
    constraint pk_exhibe primary key (CodTeat, Fecha) 
);

create table precio(
    CodTeat integer,
    Fecha date,
    Tipo integer,
    Precio numeric not null,
	
    constraint pk_precio primary key (CodTeat, Fecha, Tipo)
);

create table entrada(
    CodTeat integer,
    Fecha date,
    NroAsiento integer,
    NroInvit integer,
	
    constraint pk_entrada primary key (CodTeat, Fecha, NroAsiento) 
);

alter table teatro add constraint ck_teatro_asientos check (CantAsientos > 0);

alter table asiento_tipo add constraint fk_asiento_tipo_tipo foreign key (Tipo) references tipo_asiento(Tipo);

alter table exhibe add constraint fk_exhibe_teatro foreign key (CodTeat) references teatro(Codteat);
alter table exhibe add constraint fk_exhibe_obra foreign key (CodObra) references obra(CodObra);

alter table precio add constraint ck_precio_valor check (Precio >= 0);
alter table precio add constraint fk_precio_exhibe foreign key (CodTeat, Fecha) references exhibe(CodTeat, Fecha);
alter table precio add constraint fk_precio_tipo foreign key (Tipo) references tipo_asiento(Tipo);

alter table entrada add constraint fk_entrada_exhibe foreign key (CodTeat, Fecha) references exhibe(CodTeat, Fecha);
alter table entrada add constraint fk_entrada_asiento foreign key (NroAsiento) references asiento_tipo(NroAsiento);
alter table entrada add constraint fk_entrada_invitado foreign key (NroInvit) references invitado(Nroinvitado);

