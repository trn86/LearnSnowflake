# LearnSnowflake
Contains steps by step excerise to start etl with snowflake

## Summary
In this tutorial ,we will learn how to do etl from datalake to snowflake. Here are the steps that will be done.We will load the data from azure adls gen2/datalake to snowflake.Snowflake will have a data coming in 3 layers land, raw and defined layer. Land layer will just have external table. Raw layer will have permanent table copy data from datalake into snowflake and append only stream to add new records into stream.Defined layer will have permanent table ,whose data will be populated from row layer stream.

Snowflake objects to be created
Database - hrms
Schemas - land,raw,defined
External table - employee_ext_tbl
Tables - employee_tbl
Stream - employee_stm
Other objects - file format,storage integration, external stage, task
Optional objects - custom role/user on which entire script can be run. Right now assuming you have access to role accountadmin

#### Dataset - Employee
Sample data

empid,age,empid
abc,30,9
xyz,25,3
pqr,33,8

#### Architecture 
![image](https://github.com/trn86/LearnSnowflake/assets/46071637/9a592b60-7f56-4eec-ab4a-cddbee7801ac)

#### Data Movement
![image](https://github.com/trn86/LearnSnowflake/assets/46071637/34369ea5-76fd-4da8-963e-5a5e456816d0)

#### Steps/Execricse we will perform
1. Snowflake create database and schemas for land, raw and defined layer (raw layer and definer schema will have each table, land will have external table for exploratory purpose of data)
2. Create steps to allow data to be accessed from adls gen2 datalake into snowflake using storage intergration and external stage object.Configure storage integration 
3. Create land layer external table
4. Create raw layer table and stream objects (to have change data capture for new data inserts) in raw layer table
5. Copy data in raw layer from datalake
6. Copy data in definer layer using stream as input and take latest record based on etl created at
7. Wrap copy task in raw layer and merge logic to put data in defined layer under task to have a daily run of the jobs/job schduling.
