set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_TIME;
CREATE TABLE dw_kingmed.DIM_TIME (
    application_id character(36) NOT NULL,
	check_date timestamp(0) without time zone,
	send_date timestamp(0) without time zone,
	archive_base_date timestamp(0) without time zone DEFAULT to_date('2099-12-31'::text, 'yyyy-mm-dd'::text) NOT NULL,
	creation_date timestamp(0) without time zone NOT NULL,
	last_update_date timestamp(0) without time zone NOT NULL
	
)
WITH (orientation=column, compression=low)
DISTRIBUTE BY replication (application_id);





