create database transaction_exemple;
use transaction_exemple;
show databases;

-- faltam as tabelas clientes e produto
select * from transaction_exemple.orders;
CREATE TABLE transaction_exemple.orders(
orderNumbers INT,
orderDate date,
requiredDate date,
shippedDate date,
orderStatus ENUM ('DESPACHADO', 'EM PROGRESSO', 'ENTREGUE'),
custumerNumber int,
CONSTRAINT pk_orders PRIMARY KEY (orderNumbers)
);
select * from orders where orderNumbers = 10;
DESC orders;

CREATE TABLE ordersDetails(
orderNumbers INT,
productCode varchar (255),
quantityOrder int,
price varchar (255),
constraint fk_orderdetails foreign key (orderNumbers) references orders(orderNumbers),
constraint pk_orderdetails primary key (orderNumbers, productCode)
);
desc ordersDetails;

set @@autocommit = 1;
insert into orders values (9,'2005-05-31', '2005-06-10', '2005-06-11', 'EM PROGRESSO',1); 
select * from orders;
drop table customer;

create table customer(
id_customer int,
customer_name varchar(15),
email varchar (30),
cpf char (11) not null,
credit_card int,
contato int (9),
address varchar (30),
Salary decimal (10,2),
extra  decimal (10,2)

);
insert into customer values (1,'Pedro', 'pedro@email.com',88898765497, '100','987654532', 'Rua da Cruz', 10000.00, 1000.00);
					
select *from customer where credit_card = 100;
set @@autocommit =0;
select @@autocommit;

select * from customer;
show tables;

DESCRIBE customer;
