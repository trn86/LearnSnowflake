-- merge data in defined layer table using stream as input
MERGE INTO hrms.defined.employee_tbl target
USING (select NAME,AGE,EMPID,ETL_RECORD_CREATED_AT,ROW_NUMBER() OVER 
(PARTITION BY EMPID ORDER BY ETL_RECORD_CREATED_AT DESC) as ROW_NUM from hrms.raw.employee_stm) source
ON target.empid = source.empid and source.row_num = 1
WHEN MATCHED and source.row_num = 1 THEN 
UPDATE SET 
target.name = source.name, 
target.age = source.age,
target.etl_updated_at = source.ETL_RECORD_CREATED_AT
WHEN NOT MATCHED and source.row_num = 1 THEN 
