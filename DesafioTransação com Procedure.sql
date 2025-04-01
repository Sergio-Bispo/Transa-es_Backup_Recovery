use transaction_ecommerce;
drop procedure sql_fail;

delimiter //
create procedure sql_fail()
	begin
		 declare exit handler for sqlexception
         begin
			show errors limit 1;   -- forma atual  
             
             -- depreciada apartir 5.5
            get diagnostics condition 1
            @p2 = message_text;
            select @p2 as transaction_error;
            rollback;
           -- select 'A transação foi encerrada devido a algum erro ocorrido!' as warning;
         end;
         
         start transaction;
         
-- select 
			--  @nextorder := max(orderNumbers) +1 as Next_number
		   --  from orders;
     
         insert into orders values (14,'2005-05-31', '2005-06-10', '2005-06-11', 'CONFIRMADO', 3);
         insert into ordersDetails values (14, '18_1849', 30, '189.50'),
                                          (14, '18_2569', 50, '105.09');
         commit;                                 
	end //

delimiter ; 

call sql_fail();
select * from orders where orderNumbers=14;