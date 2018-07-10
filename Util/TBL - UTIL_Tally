USE Util;

/*========================================================================================
Purpose:
Creates/Recreates a table with numbers from 1 to 1,000,010
Usefull for numbering / sequencing items such as rows in a result or characters in a
string

Usage:
You can number chars in a string by joining on a substring to this table

SELECT SUBSTRING(in_string, ut.N, 1) in_char
...
JOIN UTIL_Tally ut
    ON  ut.N <= LENGTH(in_string)

Notes:
Only built 1M rows because building more than that is really slow
1M rows is more than enough for general string splitting purposes

Revision:
00 - 07/09/2018 - Bill Stidham <billstidham@gmail.com>
   - Created
========================================================================================*/

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

DROP TABLE IF EXISTS UTIL_Tally;
CREATE TABLE UTIL_Tally (
      N INT NOT NULL
    , PRIMARY KEY (N)
);

START TRANSACTION;

INSERT INTO UTIL_Tally (N)
SELECT @s := @s +1 N
FROM (SELECT @s := 0) p
CROSS JOIN (
    SELECT 1 n UNION ALL SELECT 1 n UNION ALL SELECT 1 n UNION ALL 
    SELECT 1 n UNION ALL SELECT 1 n UNION ALL SELECT 1 n UNION ALL 
    SELECT 1 n UNION ALL SELECT 1 n UNION ALL SELECT 1 n UNION ALL 
    SELECT 1 n 
) d
;

INSERT INTO UTIL_Tally (N)
SELECT @s := @s +1 
FROM (SELECT @s := COUNT(*) FROM UTIL_Tally) p
JOIN UTIL_Tally ut
    ON ut.N <= 100
JOIN UTIL_Tally ut2
    ON ut2.N <= 100
JOIN UTIL_Tally ut3
    ON ut3.N <= 100
JOIN UTIL_Tally ut4
    ON ut4.N <= 100
JOIN UTIL_Tally ut5
    ON ut5.N <= 100
JOIN UTIL_Tally ut6
    ON ut6.N <= 100
;

COMMIT;
