
use database hrms;
use schema raw;

-- create storage integration object (ontime only)
CREATE OR REPLACE STORAGE INTEGRATION dev_land_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'AZURE'
  ENABLED = TRUE
  AZURE_TENANT_ID = 'azure-tenenat-id'
  STORAGE_ALLOWED_LOCATIONS = ('azure://<storage-accnt-name>.blob.core.windows.net/democontainer/land/');

-- open app consent url to allow snowflake to access your data from data lake
desc integration dev_land_integration;

create or replace stage dev_external_stage
  url='azure://<storage-accnt-name>.blob.core.windows.net/democontainer/land/'
  storage_integration = dev_land_integration;