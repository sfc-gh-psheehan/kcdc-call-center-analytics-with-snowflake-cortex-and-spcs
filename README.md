# Call Center Analytics with Snowflake Cortex LLM and Snowpark Container Services

## Overview

In this guide we will build a Call Center Analytics solution built for analyzing insurance call center audio files. Leveraging Snowflake cortex, large language models running in Snowpark containers, and Streamlit, we will transcribe text and duration from audiofiles,gather customer details, agent interactions, sentiment analysis, summary, and resolution from each audio call. Here are key highlights and features of the solution :

* Whisper running in Snowpark Containers to Extract Text and Duration of the call from the audio files.

* Deploy Cortex LLM functions for diarization to identify customer and representative.

* Deploy Cortext LLM function to summarize and extract various information from call conversation.

* Train and deploy a fine-tuned model for to convert natural language into SQL queries.

* Streamlit APP which has a dashboard for audio analytics, chatbot on your data using RAG based approach. Also a Text2SQL chatbot for generating SQL queries and executing them from natural language input text.

## Step-By-Step Guide

1. Execute 1. Snowflake\SetupSnowflake.sql (this will build your base Snowflake environment)
2. Open and run 2. Audio2Text\audio2text_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
3. Open and run 2. Audio2Text\AudioAnalytics.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
4. Open and run 3. Text2SQL\text2sql_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
5. Open and run 4. Streamlit\streamlit_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)

## Tear-down, post build
Execute 1. Snowflake\cleanup.sql (this will drop all objects)