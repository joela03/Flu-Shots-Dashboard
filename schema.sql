DROP TABLE conditions;
DROP TABLE encounters;
DROP TABLE immunisations;
DROP TABLE patients;

CREATE TABLE conditions(
start DATE,
stop DATE,
patient VARCHAR(1000),
encounter VARCHAR(1000),
code VARCHAR(1000),
description VARCHAR(200)
);

CREATE TABLE encounters(
id VARCHAR(100),
start TIMESTAMP,
stop TIMESTAMP,
patient VARCHAR(100),
organisation VARCHAR(100),
provider VARCHAR(100),
payer VARCHAR(100),
encounter_class VARCHAR(100),
code VARCHAR(100),
description VARCHAR(100),
base_encounter_cost FLOAT,
total_claim_cost FLOAT,
payer_coverage FLOAT,
reason_code VARCHAR(100)
);

CREATE TABLE immunisations(
date TIMESTAMP,
patient VARCHAR(100),
encounter VARCHAR(100),
code BIGINT,
description VARCHAR(500)
);

CREATE TABLE patients(
id VARCHAR(100),
birthdate date,
deathdate date,
ssn VARCHAR(100),
drivers VARCHAR(100),
passport VARCHAR(100),
prefix VARCHAR(100),
first VARCHAR(100),
last VARCHAR(100),
suffix VARCHAR(100),
maiden VARCHAR(100),
marital VARCHAR(100),
race VARCHAR(100),
ethincity VARCHAR(100),
gender VARCHAR(100),
birthplace VARCHAR(100),
address VARCHAR(100),
city VARCHAR(100),
state VARCHAR(100),
county VARCHAR(100),
fips INT,
zip INT,
lat FLOAT,
lon FLOAT,
healthcare_expense float,
healthcare_coverage float,
income int,
mrn int
);
