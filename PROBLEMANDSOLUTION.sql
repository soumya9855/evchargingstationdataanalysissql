-- 1. Retrieve all stations that support fast charging (Charging Capacity ≥ 100 kW).
SELECT 
    Station_ID,
    Charging_Capacity,
    Charger_Type
FROM 
    EV_Charging_Stations
WHERE 
    Charging_Capacity >= 100;

-- 2. Find stations that have CCS connectors and were installed after 2015.
SELECT 
    Station_ID,
    Installation_Year,
    Connector_Types
FROM 
    EV_Charging_Stations
WHERE 
    Connector_Types LIKE '%CCS%'
    AND Installation_Year > 2015;

-- 3. List all stations that operate on renewable energy and have a rating of 4 or higher.
SELECT 
    Station_ID,
    Renewable_Energy_Source,
    Reviews
FROM 
    EV_Charging_Stations
WHERE 
    Renewable_Energy_Source = 'Yes'
    AND Reviews >= 4;

-- 4. Find the station with the highest charging capacity and display its details.
SELECT 
    Station_ID,
    Charging_Capacity,
    Charger_Type
FROM 
    EV_Charging_Stations
ORDER BY 
    Charging_Capacity DESC
LIMIT 1;

-- 5. Calculate the average cost per kWh for all stations in the dataset.
SELECT 
    AVG(Cost_per_kWh) AS Average_Cost
FROM 
    EV_Charging_Stations;

-- 6. Retrieve all stations where the availability includes "24/7".
SELECT 
    Station_ID,
    Availability
FROM 
    EV_Charging_Stations
WHERE 
    Availability = '24/7';

-- 7. Find the total number of charging stations operated by 'EVgo'.
SELECT 
    COUNT(*) AS Total_Stations
FROM 
    EV_Charging_Stations
WHERE 
    Station_Operator = 'EVgo';

-- 8. List all stations that are within 10 km of a city and have at least 5 parking spots.
SELECT 
    Station_ID,
    Distance_to_City,
    Parking_Spots
FROM 
    EV_Charging_Stations
WHERE 
    Distance_to_City <= 10
    AND Parking_Spots >= 5;

-- 9. Display the top 5 stations with the highest average users per day.
SELECT 
    Station_ID,
    Usage_Stats
FROM 
    EV_Charging_Stations
ORDER BY 
    Usage_Stats DESC
LIMIT 5;

-- 10. Retrieve the count of stations that use CHAdeMO connectors.
SELECT 
    COUNT(*) AS CHAdeMO_Stations
FROM 
    EV_Charging_Stations
WHERE 
    Connector_Types LIKE '%CHAdeMO%';

-- 11. Find the top 3 operators with the highest total charging capacity across all their stations.
SELECT 
    Station_Operator,
    SUM(Charging_Capacity) AS Total_Capacity
FROM 
    EV_Charging_Stations
GROUP BY 
    Station_Operator
ORDER BY 
    Total_Capacity DESC
LIMIT 3;

-- 12. List the stations where the cost per kWh is below the average cost per kWh for all stations.
SELECT 
    Station_ID,
    Cost_per_kWh
FROM 
    EV_Charging_Stations
WHERE 
    Cost_per_kWh < (
        SELECT AVG(Cost_per_kWh) 
        FROM EV_Charging_Stations
    );

-- 13. Retrieve all stations where the maintenance frequency is "Annually" and the installation year is before 2015.
SELECT 
    Station_ID,
    Maintenance_Frequency,
    Installation_Year
FROM 
    EV_Charging_Stations
WHERE 
    Maintenance_Frequency = 'Annually'
    AND Installation_Year < 2015;

-- 14. Calculate the total number of charging spots available in stations with renewable energy sources.
SELECT 
    SUM(Parking_Spots) AS Total_Parking_Spots
FROM 
    EV_Charging_Stations
WHERE 
    Renewable_Energy_Source = 'Yes';

-- 15. Find stations where the cost per kWh is below 0.3 USD and the average users per day is above 30.
SELECT 
    Station_ID,
    Cost_per_kWh,
    Usage_Stats
FROM 
    EV_Charging_Stations
WHERE 
    Cost_per_kWh < 0.3
    AND Usage_Stats > 30;

-- 16. Determine the operator that has the highest number of stations in the dataset.
SELECT 
    Station_Operator,
    COUNT(*) AS Total_Stations
FROM 
    EV_Charging_Stations
GROUP BY 
    Station_Operator
ORDER BY 
    Total_Stations DESC
LIMIT 1;

-- 17. Calculate the average distance from the city for stations installed after 2020.
SELECT 
    AVG(Distance_to_City) AS Avg_Distance
FROM 
    EV_Charging_Stations
WHERE 
    Installation_Year > 2020;

-- 18. Find stations that have both CCS and CHAdeMO connectors and are available 24/7.
SELECT 
    Station_ID,
    Connector_Types,
    Availability
FROM 
    EV_Charging_Stations
WHERE 
    Connector_Types LIKE '%CCS%'
    AND Connector_Types LIKE '%CHAdeMO%'
    AND Availability = '24/7';

-- 19. List the stations that were installed in the same year as the station with the lowest rating.
SELECT 
    Station_ID,
    Installation_Year,
    Reviews
FROM 
    EV_Charging_Stations
WHERE 
    Installation_Year = (
        SELECT Installation_Year
        FROM EV_Charging_Stations
        ORDER BY Reviews ASC
        LIMIT 1
    );

-- 20. Find the station with the highest number of parking spots.
SELECT 
    Station_ID,
    Parking_Spots
FROM 
    EV_Charging_Stations
ORDER BY 
    Parking_Spots DESC
LIMIT 1;
