SELECT @@autocommit;

set @@autocommit = 0;

START TRANSACTION;

SELECT @orderNumbers:= max(orderNumbers) + 1
FROM orders;

insert into orders values (@orderNumbers,'2005-05-31', '2005-06-10', '2005-06-11', 'DESPACHADO',1),
                          (@orderNumbers + 1,'2005-05-31', '2005-06-10', '2005-06-11', 'DESPACHADO',1); 