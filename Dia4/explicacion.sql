-- creacion de la tabla 

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
 stock_min smallint default 0,
 stock_max smallint default 0
);

-- insert para la tabla full_order_info

INSERT INTO full_order_info (
    order_id, product_id, quantity, price, orderdate, user_id,
    first_name, last_name, email, last_connection, website,
    name, description, stock, stock_price, stock_min, stock_max)
VALUES (
    1, 9, 5, 544.2,
    '2025-02-16', '5', 'Christopher', 'Charles',
    'christopher.charles@yahoo.com', '8.132.55.99', 'https://barrera.com/',
    'Webcam', 'Meet make compare sign history American school free we feeling light doctor.', 68,
    544.2, 15, 106
);

-- modificar el nombre de una columna con un alter :

 alter table full_order_info rename column stock_min to stockmin;

-- cambiar el tipo de dato de una columna en  especifico:

 alter table full_order_info alter column  stock_min type integer;


 
