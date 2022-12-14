/**Database used by script van be created usin scripts 
		"Practical class Nr 2 - Tables" and "Practical class Nr 2 - Data"
    AVG – average value
    SUM- sum of values
    MIN – minimal value
    MAX – maximum value
    COUNT – amount
    COUNT DISTINCT - amount of unique values
 */
SELECT
    COUNT(*) AS NumberOfNetworkQualities,
    COUNT(Quality_ID) AS NumberOfNetworkQualities2,
    COUNT(EntryDate) AS NumberOfEntryDates,
    COUNT(DISTINCT Quality) AS DistinctQualities,
    SUM(Quality) AS SumOfQualities,
    MIN(Quality) AS MinQuality,
    MAX(Quality) AS MAxQuality,
    AVG(Quality) AS AverageQuality
FROM NetworkQuality;

/** unique Quality values **/
SELECT DISTINCT Quality FROM NetworkQuality;

/** aliases work the same for simple expressions and aggregations **/
SELECT Quality + 5, Quality + 5 AS QualityPlusFive
FROM NetworkQuality;

SELECT SUM(Quality), SUM(Quality) AS SumOfQualities
FROM NetworkQuality;

/** You can filter data with WHERE condition when using aggregations **/
SELECT
    COUNT(*) AS NumberOfNetworkQualities,
    SUM(Quality) AS SumOfQualities,
    COUNT(DISTINCT Quality) AS DistinctQualities,
    SUM(DISTINCT Quality) AS SumOfDistinctQualities
FROM NetworkQuality
WHERE Carrier_ID = 78002 AND Quality > 3;

/** And check the actual data you're aggregating **/
SELECT * FROM NetworkQuality
WHERE Carrier_ID = 78002 AND Quality > 3
ORDER BY Quality DESC;


/**
    select aggregations for specific Carrier_ID
    NOTE: AVG returns different values for INT and FLOAT data types
**/
SELECT
    COUNT(*) as Amount,
    SUM(Quality) AS SumOfQualities,
    AVG(Quality) AS AverageQuality,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
WHERE Carrier_ID = 78002;

SELECT 26/8, 26.00/8.00;

SELECT * FROM NetworkQuality
WHERE Carrier_ID = 78002
ORDER BY Quality DESC;

/**
  Aggregations work differently when processing NULL values
 */

-- set some values to be NULL
UPDATE NetworkQuality
SET Quality = NULL
WHERE Quality_ID IN (33024,33028,33005);

/**
  NOTE how the results change depending on how we calculate averages
 */
SELECT
    COUNT(*) as Amount,
    COUNT(Quality) as AmountOfQuality,
    SUM(Quality) AS SumOfQualities,
    AVG(Quality*1.00) AS AverageQuality, -- returns SumOfQualities / AmountOfQuality
    AVG(
        CASE
          WHEN Quality IS NULL THEN 0.00
          ELSE Quality*1.00
       END
    ) AS AverageQualityNotNULL, -- returns SumOfQualities / Amount
    17.00/5.00,
    17.00/8.00
FROM NetworkQuality
WHERE Carrier_ID = 78002;

/** Simple example of how to use CASE condition in an SQL **/
SELECT
       Quality,
       (CASE
          WHEN Quality IS NULL THEN 0
          ELSE Quality
       END) AS NotNullQualities
FROM NetworkQuality
WHERE Carrier_ID = 78002;

/** AVG does not work with varchar **/
SELECT
    AVG(Username)
FROM NetworkQuality
WHERE Carrier_ID = 78002;

SELECT
    COUNT(*) AS NumberOfNetworkQualities
FROM NetworkQuality;

/** GROUP BY is very simmilar to DISTINCT **/
SELECT DISTINCT Carrier_ID FROM NetworkQuality;

/** only you can use aggregations with GROUP BY clause **/
SELECT Carrier_ID, COUNT(*) AS NumberOfNetworkQualities
FROM NetworkQuality
GROUP BY Carrier_ID;

/** you can group by multiple columns **/
SELECT Carrier_ID, Quality, COUNT(*) AS NumberOfNetworkQualities
FROM NetworkQuality
GROUP BY Carrier_ID, Quality;

/** every column in a select statement with GROUP BY must be
  1. in GROUP BY clause
  2. or an aggregation
 */
SELECT
    Carrier_ID,
    COUNT(*) AS NumberOfNetworkQualities,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID;

/**
  Example of aggregation function that works with strings - STRING_AGG
 */
SELECT
    Carrier_ID,
    STRING_AGG(Quality, ','),
    COUNT(*) AS NumberOfNetworkQualities,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID;

/** Ordering results by aggregation also works **/
SELECT
    Carrier_ID,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID
ORDER BY AVG(Quality*1.00);

SELECT
    Carrier_ID,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID
ORDER BY AverageQuality DESC;

SELECT
    Carrier_ID,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID
ORDER BY 2 DESC;

/** You can use columns in GROUP BY and ORDER BY that are not selected **/
SELECT
    COUNT(*) AS NumberOfCarrierQualities
FROM NetworkQuality
GROUP BY Carrier_ID
ORDER BY AVG(Quality*1.00) DESC;

/** Filter data before GROUP BY (WHERE clause) **/
SELECT
    Carrier_ID,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
WHERE Quality > 2
GROUP BY Carrier_ID;

/** Filter data after group by (HAVING CLAUSE) **/
SELECT
    Carrier_ID,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
GROUP BY Carrier_ID
HAVING AVG(Quality*1.00) > 3;

/** Using GROUP BY and Aggregations with JOINs **/
SELECT
    Carrier_ID,
    PM.Manufacturer,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
JOIN PhoneModel PM on NetworkQuality.Phone_ID = PM.PhoneModel_ID
GROUP BY Carrier_ID, PM.Manufacturer;

SELECT
    PM.Manufacturer,
    AVG(Quality*1.00) AS AverageQuality
FROM NetworkQuality
JOIN PhoneModel PM on NetworkQuality.Phone_ID = PM.PhoneModel_ID
GROUP BY PM.Manufacturer;