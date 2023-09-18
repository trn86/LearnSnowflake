use database hrms;
use schame schema land;

-- create external table
CREATE OR REPLACE EXTERNAL TABLE hrms.land.employee_ext_tbl
LOCATION=@hrms.raw.dev_external_stage/
FILE_FORMAT = (TYPE = CSV);