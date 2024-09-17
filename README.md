# Flu Shots Dashboard

This repository contains the files and resources used to create the Flu Shots Dashboard. The dashboard is designed to visualize and analyze data related to flu vaccinations, providing insights into vaccination rates, trends over time, and demographic patterns.

## Dashboard Overview

The Flu Shots Dashboard is built using Tableau and showcases data in a user-friendly, interactive format. Users can explore vaccination trends by various categories such as age group, location, and time period.

### Key Features:
- **Interactive Visualization**: The dashboard allows users to interact with the data and filter based on different parameters.
- **Vaccination Trends**: View trends in flu vaccinations over time.
- **Demographic Breakdown**: Explore vaccination rates by age, gender, and region.
- **Data Insights**: Gain insights into flu shot uptake and related factors.

## Query Explanation: Filtering Active Patients and Excluding Patients Under 6 Months

This query selects data for **active patients** who:
1. Have visited the hospital at least once in the year 2022.
2. Have received a flu vaccine (with the code `5302`).
3. Excludes patients who are under 6 months of age by the end of 2022 (since they are required to receive the vaccine by mandate).

### Key Steps in Filtering

1. **Filtering Active Patients:**
   - The `active_patients` Common Table Expression (CTE) identifies patients who had a hospital **encounter** (visit) in the year 2022. This is achieved by joining the `encounters` and `patients` tables, and filtering based on the encounter start date:
     ```sql
     WHERE start BETWEEN '2022-01-1 00:00' AND '2022-12-31 23:59'
     ```
   - It also ensures that the patient is still alive by checking:
     ```sql
     AND pat.deathdate IS NULL
     ```

2. **Excluding Patients Under 6 Months:**
   - To exclude patients who are under 6 months old by the end of 2022, the query uses the following condition:
     ```sql
     AND EXTRACT(month FROM age('2022-12-31', pat.birthdate)) >= 6
     ```
   - This line calculates the patient’s age in **months** as of December 31, 2022, and only includes those who are **6 months or older** in the `active_patients` CTE. This ensures that infants below 6 months are excluded, since they are mandated to receive the flu vaccine.

## Contributing

Contributions are welcome! If you'd like to contribute to this project, please fork the repository and submit a pull request. For any issues or suggestions, feel free to open an issue in the GitHub repository.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or inquiries, you can reach out via [LinkedIn](https://www.linkedin.com/in/joel-allen-caliste/).