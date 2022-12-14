-- check the Carrier table (we're going to work with that)
SELECT * FROM Carrier;

-- select number of network qualities for each of the carriers
SELECT
    Carrier_ID,
    CarrierName,
    (SELECT COUNT(*) FROM NetworkQuality),
    (SELECT COUNT(*) FROM NetworkQuality WHERE Carrier.Carrier_Id=NetworkQuality.Carrier_ID)
FROM Carrier;

-- check result for specific carrier
SELECT COUNT(*) FROM NetworkQuality WHERE NetworkQuality.Carrier_ID=78002;

-- you do not need to select Carrier_ID in order to get the results
SELECT
    CarrierName,
    (SELECT COUNT(*) FROM NetworkQuality WHERE Carrier.Carrier_Id=NetworkQuality.Carrier_ID)
FROM Carrier;

-- the same can be achieved by writing a JOIN statement
SELECT
       CarrierName,
       COUNT(*)
FROM Carrier
LEFT JOIN NetworkQuality ON Carrier.Carrier_Id=NetworkQuality.Carrier_ID
GROUP BY CarrierName;

-- sub-queries allow for different aggregations, for example AVG
SELECT
    CarrierName,
    (SELECT COUNT(*) FROM NetworkQuality WHERE Carrier.Carrier_Id=NetworkQuality.Carrier_ID) AS NumberOfNetworkQualityRecords,
    (SELECT AVG(Quality*1.0) FROM NetworkQuality WHERE Carrier.Carrier_Id=NetworkQuality.Carrier_ID) AS AverageQuality
FROM Carrier;

-- most common use case - getting dictionary value by ID
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Username,
    TravelMethod.EntryDate,
    (SELECT Type FROM TravelMethodType WHERE TravelMethodType.Travelmethodtype_ID = TravelMethod.Travelmethodtype_ID) AS TravelMethodType
FROM TravelMethod
ORDER BY TravelMethod.TM_ID;

-- the same can be done with JOIN, but it requires more code
SELECT
    TravelMethod.TM_ID,
    TravelMethod.Username,
    TravelMethod.EntryDate,
    TravelMethod.Travelmethodtype_ID,
    TravelMethodType.Type
FROM TravelMethod
JOIN TravelMethodType
    ON TravelMethod.Travelmethodtype_ID = TravelMethodType.Travelmethodtype_ID
ORDER BY TravelMethod.TM_ID;

-- you can use sub-queries as virtual tables and join them
SELECT CarrierName, Amount
FROM
     Carrier,
     (SELECT Carrier_ID, COUNT(*) AS Amount FROM NetworkQuality GROUP BY Carrier_ID) A
WHERE Carrier.Carrier_ID=A.Carrier_ID;

-- a more explicit JOIN statement
SELECT Carrier.CarrierName,
       CarrierNetworkStats.Amount
FROM Carrier
JOIN (
    SELECT Carrier_ID,
           COUNT(*) AS Amount
    FROM NetworkQuality
    GROUP BY Carrier_ID
) AS CarrierNetworkStats
    ON Carrier.Carrier_ID=CarrierNetworkStats.Carrier_ID;

-- the same can be done using more simplistic statement
SELECT
       CarrierName,
       COUNT(*)
FROM Carrier
LEFT JOIN NetworkQuality ON Carrier.Carrier_Id=NetworkQuality.Carrier_ID
GROUP BY CarrierName;


-- sub-queries can be used in WHERE condition
SELECT CarrierName
FROM Carrier
WHERE EXISTS (SELECT * FROM NetworkQuality
                    WHERE Carrier.Carrier_ID=NetworkQuality.Carrier_ID
                    AND Quality=5)

-- check if carrier does not exist in sub-query
SELECT CarrierName
FROM Carrier
WHERE NOT EXISTS (SELECT * FROM NetworkQuality
                    WHERE Carrier.Carrier_ID=NetworkQuality.Carrier_ID
                    AND Quality=5)

-- filter against average value
SELECT CarrierName
FROM Carrier
WHERE (SELECT AVG(Quality*1.0) FROM NetworkQuality
    WHERE Carrier.Carrier_Id=NetworkQuality.Carrier_ID) >= 4;

-- filter against list of IDs
SELECT * FROM PlaceFeedback, Feedback
WHERE PlaceFeedback.Feedback_ID=Feedback.Feedback_ID
  AND Place_ID IN (SELECT To_ID FROM TravelMethod)

-- show qualities where at least 1 quality greater than ANY of the sub-query qualities
SELECT * FROM NetworkQuality
WHERE Quality> SOME (SELECT Quality FROM NetworkQuality);

-- alias to SOME
SELECT * FROM NetworkQuality
WHERE Quality> ANY (SELECT Quality FROM NetworkQuality);

-- show qualities where at least 1 quality greater than ALL of the sub-query qualities
SELECT * FROM NetworkQuality
WHERE Quality>= ALL (SELECT Quality FROM NetworkQuality);

-- can be used in a having clause as well
SELECT Carrier_ID, AVG(Quality*1.)
FROM NetworkQuality
GROUP BY Carrier_ID
HAVING AVG(Quality*1.)>=ALL (SELECT AVG(Quality*1.0) FROM NetworkQuality
                            GROUP BY Carrier_ID);


/***
  Practical part.
 */

-- 1.	SELECT carriers with no network quality

SELECT * FROM Carrier
WHERE Carrier_ID NOT IN (
    SELECT NetworkQuality.Carrier_ID FROM NetworkQuality
);

-- 2.	SELECT users, who did not provide a single network quality feedback

SELECT * FROM Networkuser
WHERE Username NOT IN (
    SELECT NetworkQuality.Username FROM NetworkQuality
);

-- 3.	SELECT carriers with most of the network quality feedbacks
-- OPTION 1
SELECT Carrier.Carrier_ID, COUNT(*)
FROM Carrier
LEFT JOIN NetworkQuality NQ on Carrier.Carrier_ID = NQ.Carrier_ID
GROUP BY Carrier.Carrier_ID
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM NetworkQuality GROUP BY Carrier_ID);

-- OPTION 2
SELECT Carrier.Carrier_ID, COUNT(*)
FROM Carrier
LEFT JOIN NetworkQuality NQ on Carrier.Carrier_ID = NQ.Carrier_ID
GROUP BY Carrier.Carrier_ID
HAVING COUNT(*) =
   (
       SELECT MAX(NumberOfFeedback)
        FROM (SELECT Carrier_ID, COUNT(*) AS NumberOfFeedback FROM NetworkQuality GROUP BY Carrier_ID) AS Feedbacks
   )

-- OPTION 3
SELECT *
FROM Carrier
WHERE
      (SELECT COUNT(*) FROM NetworkQuality WHERE Carrier.Carrier_ID=NetworkQuality.Carrier_ID) =
      (SELECT MAX(NumberOfFeedback)
        FROM (SELECT Carrier_ID, COUNT(*) AS NumberOfFeedback FROM NetworkQuality GROUP BY Carrier_ID) AS Feedbacks);

-- 4.	SELECT users, who evaluated carriers with most 5 stars
SELECT Networkuser.Username, COUNT(*)
FROM Networkuser
JOIN NetworkQuality NQ on Networkuser.Username = NQ.Username
WHERE NQ.Quality = 5
GROUP BY Networkuser.Username
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM NetworkQuality WHERE Quality = 5 GROUP BY Username)

INSERT INTO NetworkQuality VALUES
(330055,98703,78001,'andrewskeels',17006,5,'Awesome network','2019-01-01'),
(330056,98702,78002,'marcsmith',17002,5,'Awesome network','2018-04-02');

-- 5.	SELECT place types with most places
SELECT PlaceName, COUNT(*)
FROM PlaceType
JOIN PlaceOfInterest POI on PlaceType.PlaceType_ID = POI.Type_ID
GROUP BY PlaceName
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM PlaceOfInterest GROUP BY Type_ID)

-- 6.	SELECT network quality feedback for most popular place types
SELECT *
FROM NetworkQuality
WHERE Place_ID IN (
    SELECT Place_ID
    FROM PlaceOfInterest
    WHERE Type_ID IN (
        SELECT PlaceType_ID
        FROM PlaceType
                 JOIN PlaceOfInterest POI on PlaceType.PlaceType_ID = POI.Type_ID
        GROUP BY PlaceType_ID
        HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM PlaceOfInterest GROUP BY Type_ID)
    )
);

-- 7.	SELECT travel method types which nobody uses
SELECT * FROM TravelMethodType WHERE Travelmethodtype_ID NOT IN (
    SELECT Travelmethodtype_ID FROM TravelMethod
);

-- 8.	SELECT places of interest, to which nobody travels to
SELECT * FROM PlaceOfInterest
WHERE Place_ID NOT IN (
    SELECT To_ID FROM TravelMethod
);

