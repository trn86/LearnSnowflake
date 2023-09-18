use database hrms;
use schema defined;
-- create defined layer table
CREATE OR REPLACE TRANSIENT TABLE hrms.defined.employee_tbl ( 
NAME varchar,
AGE int,
EMPID int,
ETL_CREATED_AT timestamp,
ETL_UPDATED_AT timestamp
);