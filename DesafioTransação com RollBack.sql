select @@autocommit;
select @@transaction_isolation;
start transaction;

     select 
          @nextorder := max(orderNumbers) +1 as Next_number
     from orders;
     
     insert into
             orders
             values (@nextorder, 
                     '2005-05-31',
                     '2005-06-10',
                     '2005-06-11',
                     'Despachado',
                      2);
                      
    select orderNumbers from orders; 
    
    rollback; -- total
                      
    savepoint insercao_order;      
    
    -- nova inserção em ordersDetails
    
    insert into ordersDetails values (@nextorder, '18_1750', 35, '186.30'),
                                     (@nextorder, '18_2548', 58, '59.09'); 
                                     
    savepoint insercao_order_details;
    
    rollback to savepoint insercao_order;
    
    commit;
    
