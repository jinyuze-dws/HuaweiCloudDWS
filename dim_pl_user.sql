set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_PL_USER;
CREATE TABLE dw_kingmed.DIM_PL_USER (
    user_id character(36) NOT NULL,
    user_code character varying(100) NOT NULL,
    user_name character varying(100) NOT NULL
)
WITH (orientation=column, compression=middle)
DISTRIBUTE BY HASH (user_id);



