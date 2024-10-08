-- Select's metrics from active patient's (that have been to the hospital in the year 2022) and have received a flu-vaccine (code 5302)

WITH active_patients AS
(
SELECT DISTINCT(patient)
FROM encounters as e
JOIN patients as pat
ON e.patient = pat.id
WHERE start BETWEEN '2022-01-1 00:00' AND '2022-12-31 23:59'
AND pat.deathdate IS NULL
AND EXTRACT(month FROM age('2022-12-31', pat.birthdate)) >= 6
),

flu_shot_2022 AS
(
SELECT patient, MIN(date) AS earliest_flu_shot_2022
FROM immunisations
WHERE code = '5302'
	AND date BETWEEN '2022-01-1 00:00' AND '2022-12-31 23:59'
GROUP BY patient
)

SELECT pat.birthdate
	  ,pat.race
	  ,pat.county
	  ,pat.id
	  ,pat.first
	  ,pat.last
      ,flu.earliest_flu_shot_2022
      ,flu.patient
      ,CASE WHEN flu.patient IS NOT null THEN 1
      ELSE 0
      END AS flu_shot_2022
      ,EXTRACT(year FROM age('2022-12-31', pat.birthdate)) AS age 
FROM patients AS pat
LEFT JOIN flu_shot_2022 AS flu
    ON pat.id = flu.patient
WHERE 1=1
    AND pat.id in (SELECT patient FROM active_patients)
