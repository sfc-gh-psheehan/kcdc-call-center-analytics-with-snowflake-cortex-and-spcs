
USE ROLE SPCS_PSE_ROLE;
DROP DATABASE LLMDEMO;
USE ROLE ACCOUNTADMIN;
ALTER COMPUTE POOL PR_GPU_S STOP ALL;
ALTER COMPUTE POOL PR_GPU_7 STOP ALL;
ALTER COMPUTE POOL PR_AudioAnalytics_Pool STOP ALL;
DROP COMPUTE POOL PR_GPU_S;
DROP COMPUTE POOL PR_GPU_7;
DROP COMPUTE POOL PR_AudioAnalytics_Pool;
DROP WAREHOUSE small_warehouse;
DROP ROLE SPCS_PSE_ROLE;
DROP EXTERNAL ACCESS INTEGRATION allow_all_eai;
