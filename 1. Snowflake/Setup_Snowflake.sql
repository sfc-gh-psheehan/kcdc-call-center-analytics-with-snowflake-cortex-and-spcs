-- Set up environment
-- First, roles and warehouse
USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS SPCS_PSE_ROLE;
CREATE DATABASE IF NOT EXISTS LLMDemo;

CREATE OR REPLACE WAREHOUSE small_warehouse WITH
  WAREHOUSE_SIZE='X-SMALL';
GRANT USAGE ON WAREHOUSE small_warehouse TO ROLE SPCS_PSE_ROLE;

-- Second, create our compute pools for use w/ models  
CREATE COMPUTE POOL IF NOT EXISTS PR_GPU_S
    MIN_NODES = 1 
    MAX_NODES = 1 
    INSTANCE_FAMILY = GPU_NV_S 
    AUTO_RESUME = TRUE
    AUTO_SUSPEND_SECS = 3600
    INITIALLY_SUSPENDED = FALSE
        COMMENT = 'For Audio2text';

CREATE COMPUTE POOL IF NOT EXISTS PR_GPU_7
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = GPU_NV_M
    AUTO_RESUME = TRUE
    AUTO_SUSPEND_SECS = 3600
    INITIALLY_SUSPENDED = FALSE
        COMMENT = 'For text2sql';

CREATE COMPUTE POOL IF NOT EXISTS PR_AudioAnalytics_Pool
    MIN_NODES = 1
    MAX_NODES = 1
    INSTANCE_FAMILY = CPU_X64_XS
    AUTO_RESUME = TRUE
    AUTO_SUSPEND_SECS = 3600
    INITIALLY_SUSPENDED = FALSE
        COMMENT = 'For Running Audio Analytics Streamlit App';

-- Third, network rules for egress 
-- (in this demo we are opening egress all - typically you would want to narrow this down to a specific address)
CREATE OR REPLACE NETWORK RULE allow_all_rule
    TYPE = 'HOST_PORT'
    MODE= 'EGRESS'
    VALUE_LIST = ('0.0.0.0:443','0.0.0.0:80');

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION allow_all_eai
  ALLOWED_NETWORK_RULES = (allow_all_rule)
  ENABLED = true;

-- Fourth, apply grants to our new role
GRANT BIND SERVICE ENDPOINT ON ACCOUNT TO ROLE SPCS_PSE_ROLE;

GRANT USAGE ON INTEGRATION allow_all_eai TO ROLE SPCS_PSE_ROLE;

GRANT USAGE, MONITOR ON COMPUTE POOL PR_GPU_S TO ROLE SPCS_PSE_ROLE;

GRANT USAGE, MONITOR ON COMPUTE POOL PR_GPU_7 TO ROLE SPCS_PSE_ROLE;

GRANT USAGE, MONITOR ON COMPUTE POOL PR_AudioAnalytics_Pool TO ROLE SPCS_PSE_ROLE;

GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE SPCS_PSE_ROLE;

-- replace <myuser> with your accountname
GRANT ROLE SPCS_PSE_ROLE TO USER <myuser>;

GRANT OWNERSHIP ON DATABASE LLMDemo TO ROLE SPCS_PSE_ROLE COPY CURRENT GRANTS;

GRANT OWNERSHIP ON ALL SCHEMAS IN DATABASE LLMDemo  TO ROLE SPCS_PSE_ROLE COPY CURRENT GRANTS;

GRANT DATABASE ROLE SNOWFLAKE.CORTEX_USER TO ROLE SPCS_PSE_ROLE;

-- Fifth, change context and build our image repository
USE ROLE SPCS_PSE_ROLE;
USE DATABASE LLMDemo;
USE WAREHOUSE small_warehouse;
USE SCHEMA PUBLIC;

CREATE IMAGE REPOSITORY IF NOT EXISTS IMAGES;

-- CHECK THE IMAGE RESGISTRY URL
SHOW IMAGE REPOSITORIES;
