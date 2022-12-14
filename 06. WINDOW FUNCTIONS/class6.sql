
-- cumulative sum of rating ordered by entery date
SELECT *,
       SUM(Rating) OVER (ORDER BY EntryDate)
FROM TravelMethod;

-- the last record should contain the sum of all ratings (total)
SELECT *,
       SUM(Rating) OVER (ORDER BY EntryDate DESC) AS CummulativeSum,
       (SELECT SUM(Rating) FROM TravelMethod) AS TotalRating
FROM TravelMethod
ORDER BY Username;

-- we can select only the window function aggregation (without selecting other columns)
SELECT SUM(Rating) OVER (ORDER BY EntryDate DESC) AS CummulativeSum,
       (SELECT SUM(Rating) FROM TravelMethod) AS TotalRating
FROM TravelMethod;

-- you can group the window function aggregation by column
-- this gives average rating for all the records within each TravelMethodType_ID
SELECT *,
       AVG(Rating*1.0) OVER (PARTITION BY TravelMethodType_ID) AverageRating
FROM TravelMethod;

-- check the average for specific TravelMethodType_ID
SELECT AVG(Rating*1.0)
FROM TravelMethod
WHERE Travelmethodtype_ID = 45003;

-- you can also use other aggregations
SELECT *,
       COUNT(*) OVER (PARTITION BY TravelMethodType_ID) TravelMethodOfThisType
FROM TravelMethod;

-- and where conditions also apply
SELECT *,
       COUNT(*) OVER (PARTITION BY Rating) NumberOfRatingRecords
FROM TravelMethod
WHERE EntryDate > '2002-02-02';

-- note that using window functions is different from using sub-queries
-- specifically in how the filters apply
SELECT *,
       (SELECT COUNT(*) FROM TravelMethod AS T2
        WHERE T1.Rating = T2.Rating AND T2.EntryDate > '2002-02-02'
       ) NumberOfRatingRecords
FROM TravelMethod AS T1
WHERE T1.EntryDate > '2002-02-02';

--  you can combine PARTITION BY and ORDER BY statements in window functions
SELECT *, SUM(Rating) OVER (PARTITION BY TravelMethodType_ID ORDER BY EntryDate)  FROM TravelMethod;

-- there are window function specific aggregations, for example ROW_NUMBER
SELECT *, ROW_NUMBER() OVER (ORDER BY EntryDate) FROM TravelMethod;
SELECT *, ROW_NUMBER() OVER (PARTITION BY TravelMethodType_ID ORDER BY EntryDate) FROM TravelMethod;

-- can be filtered in sub-queries
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY TravelMethodType_ID ORDER BY EntryDate) AS RowNumber
    FROM TravelMethod
) AS tmp
WHERE RowNumber > 1;

-- RANK and DENSE_RANK aggregations
SELECT *,
       RANK() OVER (ORDER BY Rating DESC) AS Rank,
       DENSE_RANK() OVER (ORDER BY Rating DESC) AS DenseRank,
       ROW_NUMBER() OVER (ORDER BY Rating DESC) AS RowNumber,
       COUNT(*) OVER (ORDER BY Rating DESC) AS RowNumberAlternative
FROM TravelMethod;

-- dividing the selection into even groups with NTILE
SELECT *,
       NTILE(3) OVER (ORDER BY Rating DESC),
       NTILE(7) OVER (ORDER BY Rating DESC)
FROM TravelMethod;

-- selecting previous records with LAG
SELECT *, EntryDate, LAG(EntryDate,1) OVER (PARTITION BY TravelMethodType_ID ORDER BY EntryDate)  FROM TravelMethod;
SELECT *, EntryDate, LAG(EntryDate, 2, '0001-01-01') OVER (PARTITION BY TravelMethodType_ID ORDER BY EntryDate)  FROM TravelMethod;