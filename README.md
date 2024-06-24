# Call Center Analytics with Snowflake Cortex LLM and Snowpark Container Services

## Overview

In this guide we will build a Call Center Analytics solution built for analyzing insurance call center audio files. Leveraging Snowflake features like cortex, large language model running in Snowpark containers, we transcribes text and duration from audiofile,extracts essential information such as Customer details, Agent interactions, Sentiment analysis, Summary, Resolution from each audio call to name a few. Here are key highlights and features of the solution :

* Whisper running in Snowpark Containers to Extract Text and Duration of the call from the audio files.

* Using Cortex LLM functions for diarization to identify customer and representative.

* Snowpark and Cortext LLM function to summarize and extract various information from call conversation.

* Using Cortex Vector Search and Embedding to store embedding in Vector Type.

* LLM model fine tuned for SQL queries running in SPCS for converting natural language to SQL query.

* Streamlit APP which has a dashboard for audio analytics, chatbot on your data using RAG based approach. Also a Text2SQL chatbot for generating SQL queries and executing them from natural language input text.

## Step-By-Step Guide

1. Execute SetupSnowflake.sql (this will build your base Snowflake environment)
2. Open and run audio2text_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
3. Open and run AudioAnalytics.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
4. Open and run text2sql_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)
5. Open and run streamlit_setup_code.jpynb (Jupyter notebook - be sure to read & follow inline instructions!)