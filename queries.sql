-- Select's metrics from active patient's (that have been to the hospital in the year 2022) and have received a flu-vaccine (code 5302)

with active_patients as
(
SELECT patient,
FROM encounters as e
JOIN patients as pat
ON e.patient = pat.id
WHERE start BETWEEN '2022-01-1 00:00' AND '2022-12-31 23:59'
AND pat.deathdate IS NULL
and EXTRACT(MONTH FROM age('2022-12-31', pat.birthdate)) >= 6
),

with flu_shot_2022 AS
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
FROM patients AS pat
LEFT JOIN flu_shot_2022 AS flu
    ON pat.id = flu.patient

