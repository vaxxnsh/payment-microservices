-- Runs once, when the Postgres data volume is first created
-- One datbase per service: each service has its own data
CREATE DATABASE wallet;
CREATE DATABASE auth;
CREATE DATABASE transfer;
