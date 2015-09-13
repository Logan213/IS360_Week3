SELECT
"date", "dep_delay", "arr_delay", "air_time", "carrier", "origin", 
"flights.dest", "name", "lat", "lon", "alt"
FROM flights
UNION
SELECT
CONCAT(month, '/', day, '/', year) as date, dep_delay, arr_delay, air_time, carrier, origin, flights.dest, 
name, lat, lon, alt
FROM flights
JOIN airports on airports.faa = flights.dest
INTO OUTFILE '/USERS/Shared/flight_times1.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';