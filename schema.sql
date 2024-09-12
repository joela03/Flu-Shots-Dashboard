CREATE TABLE conditions(
start DATE,
stop DATE,
patient VARCHAR(1000),
encounter VARCHAR(1000),
code VARCHAR(1000),
description VARCHAR(200),
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
