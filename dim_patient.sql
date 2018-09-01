set current_schema= dw_kingmed;
drop table if exists dw_kingmed.DIM_PATIENT;
create table dw_kingmed.DIM_PATIENT
(
  id                    CHAR(36) not null,
  name                  VARCHAR2(100),
  sex                   VARCHAR2(1),
  age1                  NUMBER,
  age_unit1             VARCHAR2(30),
  age2                  NUMBER,
  age_unit2             VARCHAR2(30)
 
)
with (orientation = column, COMPRESSION=MIDDLE)
distribute by hash(id);


set current_schema= dw_kingmed;
drop table if exists dw_kingmed.tmp_dim_patient;
create table tmp_dim_patient(id serial,name VARCHAR2(100),sex VARCHAR2(1),age1 NUMBER,age_unit1 VARCHAR2(30),age2 NUMBER, age_unit2 VARCHAR2(30)) ;
insert into tmp_dim_patient(name, sex, age1, age_unit1, age2, age_unit2) select name, sex, age1, age_unit1, age2, age_unit2  from lb_app_detail;


insert into dw_kingmed.dim_patient select * from tmp_dim_patient;



set current_schema= dw_kingmed;
update lb_application_test set patient_id=
(select id from dim_patient where dim_patient.name = lb_app_detail.name and lb_app_detail.application_id = lb_application_test.application_id )



