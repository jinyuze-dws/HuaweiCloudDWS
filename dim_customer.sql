set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_CUSTOMER;
create table dw_kingmed.DIM_CUSTOMER
(
  id                CHAR(36) not null,
  customer_name     VARCHAR2(300)
  
)
with (orientation = column, COMPRESSION=MIDDLE)
distribute by hash(id);


set current_schema= dw_kingmed;
drop table if exists dw_kingmed.tmp_dim_customer;
create table tmp_dim_customer(id serial, customer_name VARCHAR2(300)) ;
insert into tmp_dim_customer(customer_name) select distinct customer_name  from lb_application;



set current_schema= dw_kingmed;
update lb_application set dim_customer_id=
(select id from dim_customer where lb_application.customer_name = dim_customer.customer_name)




