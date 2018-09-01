set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_TASK_DETAIL;
create table dw_kingmed.DIM_TASK_DETAIL
(
   id               CHAR(36),
   testItemCode     VARCHAR2(500),
   testItemNam      VARCHAR2(500)
 
)
with (orientation = column, COMPRESSION=MIDDLE)
distribute by hash(id);





set current_schema= dw_kingmed;
drop FOREIGN table if exists DIM_TASK_DETAIL_OBS;
CREATE FOREIGN TABLE DIM_TASK_DETAIL_OBS
(
        like dw_kingmed.DIM_TASK_DETAIL
)
SERVER gsmpp_server 
OPTIONS (
        encoding 'utf8',
        location 'gsobs://kingmed-dws.obs.myhwclouds.com/testdata_8_21/dim_task_detail',
        format 'CSV',
        delimiter ',',
        access_key 'VFNCXYK9DXNMPCZ5VJT6',
        secret_access_key 'u6eyW5IiEEkFaFgZONUnOeUxc1VLbmQoKj02NomG',
        chunksize '64',
        header 'on',
        compatible_illegal_chars 'on',
        IGNORE_EXTRA_DATA 'on'
);

insert into dw_kingmed.DIM_TASK_DETAIL select * from dw_kingmed.DIM_TASK_DETAIL_OBS;

select * from dw_kingmed."dim_task_detail";