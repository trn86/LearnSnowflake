use database hrms;

use schema raw;
-- create table in raw layer 
CREATE OR REPLACE TRANSIENT TABLE hrms.raw.employee_tbl ( 
NAME varchar,
AGE int,
EMPID int,
METADATA_FILE_NAME string,
METADATA_FILE_ROW_NUMBER int,
ETL_RECORD_CREATED_AT timestamp
);

-- create stream on table
create or replace stream hrms.raw.employee_stm on table hrms.raw.employee_tbl APPEND_ONLY = TRUE;
