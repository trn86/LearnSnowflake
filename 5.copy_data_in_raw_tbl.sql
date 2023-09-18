-- copy data from datalake into raw layer table
copy into hrms.raw.employee_tbl from (select $1,$2,$3,METADATA$FILENAME,METADATA$FILE_ROW_NUMBER,
METADATA$FILE_LAST_MODIFIED from @hrms.raw.dev_external_stage);
