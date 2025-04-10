-- vistas artificiales (No mantiene informacion);

-- se crean las vista para la reutilizacion de codigo(consulta).
-- no mantiene informacion , O sea recostruye la consulta cada que se ejecuta.
-- aqui si se  muestran las actualizacion  de manera automatica.

create view Stock_product_range as
select name, sum (stock) as stock , sum(stock_price) as stock_price , stockmin, stockmax from full_order_info group by 1,4,5 ;


create view Stock_product as
select name,sum(stock_price * stock ) as amount_stock from full_order_info group by 1 ;

-- asi se llaman las vista , se trabajan las vistas como tablas 
select * from Stock_product;
select * from Stock_product_range;

-- eliminar vista 

drop view  Stock_product_range;


-- vistas materializadas (guardan informacion):

-- tambien se utiliza para reutilizar codigo(consultas) y guarda la materializacion 
-- pero si se actualiza la tabla no muestra los cambios, se fueraza la actualizacion de la vista 
-- materializada.

Create Materialized view stock_avg as 
select name, sum (stock) as stock , sum(stock_price) as stock_price , stockmin, stockmax from full_order_info group by 1,4,5 ;

-- con esto se refresca para que se fuerce a ctualizar la vista

Refresh materialized view stock_avg;

-- mostrar vista materializada 

select * from stock_avg;

-- eliminar vista materializada 

drop Materialized view stock_avg;



--- Crear la relacion de las tablas user,product,orders y orders detail.

-- relaciones de orders
alter table orders add constraint fk_orders foreign key (user_id) references users(id);

-- relaciones de orders detail
alter table order_details add constraint fk_order_details1 foreign key (order_id) references orders(id);
alter table order_details add constraint fk_order_details2 foreign key (product_id) references products(id);

-- Eliminar relacion (foreign key )

alter table order_details drop constraint fk_order_details2;

-- para sacar la vista es la siguiente:

--1. database (nombre de la base que necesitas) click derecho y en ERD for database y listo.



-- Inner join (left , Right, full, inner)

-- 1. left join 

select * from users left join orders  on  users.id = orders.user_id ;

-- 2. left outer  join 

select * from users left outer join  orders  on  users.id = orders.user_id where orders.id is null ;

-- 3. right join 

select * from users right join orders  on  users.id = orders.user_id ;

-- 4. right outer  join 

select * from users right outer join  orders  on  users.id = orders.user_id ;

-- 5. full join 

select * from users full join  orders  on  users.id = orders.user_id ;

-- 6. inner join

select * from users inner join orders  on  users.id = orders.user_id ;

-- usario con ordem y detalle 

select * from users right join orders  on  users.id = orders.user_id 
left join order_details od on orders.id=od.order_id
left join products p on p.id=od.product_id ;
