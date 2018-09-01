set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_COLLECTION_LOCATION;
create table dw_kingmed.DIM_COLLECTION_LOCATION
(
  id           CHAR(36) not null,
  name         VARCHAR2(500),
  dept         VARCHAR2(500)
  
)
with (orientation = column, COMPRESSION=MIDDLE)
distribute by hash(id);