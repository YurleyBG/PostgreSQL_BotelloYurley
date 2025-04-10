-- creacion  de tablas 

create table full_order_info(
	 order_id serial primary key,
	 product_id integer not null,
	 quantity smallint not null,
	 price  numeric(10,2) not null ,
	 orderdate date not null,
	 user_id varchar(10) not null,
	 first_name varchar(50) not null,
	 last_name varchar(50) not null,
	 email varchar(50) not null,
	 last_connection inet not null,
	 website varchar(150) not null,
	 name varchar(50) not null,
	 description text null,
	 stock smallint default 0,
	 stock_price numeric(10,2) not null ,
	 stockmin smallint default 0,
	 stockmax smallint default 0
);
create table users (

	id varchar(20) primary key,
	first_name varchar(50) not null,
	last_name varchar(50)  not null,
	email varchar(50) not null unique,
	last_connection inet not null,
	website varchar(150) not null

);


create table  products (
	id serial primary key,
	name varchar(50)not null,
	description text,
	stock smallint check(stock>0),
	price numeric(10,2) not null,
	stockmin integer default 0,
	stockmax integer default 0

);

create table orders (

	id serial primary key,
	orderdate date ,
	user_id varchar(20) not null
);


create table order_details (

	id serial primary key,
	order_id integer not null,
	product_id integer not null,
	quantity smallint default 0,
	price  double precision check(price>0)
);





