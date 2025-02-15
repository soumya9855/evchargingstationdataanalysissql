CREATE TABLE EV_Charging_Stations (
    Station_ID VARCHAR(20) PRIMARY KEY,
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    Address TEXT,
    Charger_Type VARCHAR(50),
    Cost_per_kWh DECIMAL(5,2),
    Availability VARCHAR(20),
    Distance_to_City DECIMAL(5,2),
    Usage_Stats INT,
    Station_Operator VARCHAR(50),
    Charging_Capacity INT,
    Connector_Types VARCHAR(100),
    Installation_Year INT,
    Renewable_Energy_Source VARCHAR(10),
    Reviews DECIMAL(2,1),
    Parking_Spots INT,
    Maintenance_Frequency VARCHAR(20)
);