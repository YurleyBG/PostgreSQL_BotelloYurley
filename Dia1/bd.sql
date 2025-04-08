create table fabricante (
	codigo serial primary key,
	nombre varchar(100) not null
);
create table producto (
	 codigo serial primary key,
	 nombre varchar(100) not null,
	 precio double precision not null,
	 codigo_fabricante int,
	 Constraint  fk_codigo_fabricante foreign key (codigo_fabricante) references fabricante(codigo)
);
 