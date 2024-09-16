-- Select's active patient's (that have been to the hospital in the year 2022) that have received a flu-vaccine (code 5302)

SELECT patients, MIN(date) AS earliest_flu_shot_2022
FROM immunisations
WHERE code = '5302'
	AND date BETWEEN '2022-01-1 00:00' AND '2022-12-21 23:59'
GROUP BY patient

-- Select various metrics from patient's mso that we can group by these metrics
SELECT pat.birthdate
	  ,pat.race
	  ,pat.county
	  ,pat.id
	  ,pat.first
	  ,pat.last
FROM patients AS pat