create table tmp_lb_application_weigao(id serial,collection_location_name varchar(500)) ;
insert into tmp_lb_application_weigao(collection_location_name) select distinct collection_location_name  from lb_application;
select a[1],a[2] from (select regexp_split_to_array(collection_location_name,'-') as a from tmp_lb_application_weigao);




create table tmp_lb_application_weigao(id serial,collection_location_name varchar(500)) ;
insert into tmp_lb_application_weigao(collection_location_name) select distinct collection_location_name  from lb_application;
insert into dw_kingmed.dim_collection_location select id,a[1],a[2] from (select id,regexp_split_to_array(collection_location_name,'-') as a from tmp_lb_application_weigao);
