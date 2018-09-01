set current_schema= ods_kingmed;
drop FOREIGN table if exists LB_APPLICATION_OBS;
CREATE FOREIGN TABLE LB_APPLICATION_OBS
(
        like ods_kingmed.LB_APPLICATION
)
SERVER gsmpp_server 
OPTIONS (
        encoding 'utf8',
        location 'gsobs://kingmed-dws.obs.myhwclouds.com/testdata_8_21/lbapplication.txt',
        format 'CSV',
        delimiter ';',
        access_key 'VFNCXYK9DXNMPCZ5VJT6',
        secret_access_key 'u6eyW5IiEEkFaFgZONUnOeUxc1VLbmQoKj02NomG',
        chunksize '64',
        compatible_illegal_chars 'on',
        IGNORE_EXTRA_DATA 'on'
);

insert into ods_kingmed.LB_APPLICATION select * from ods_kingmed.LB_APPLICATION_OBS;


select count(*) from ods_kingmed."lb_application";

truncate table ods_kingmed."lb_application";