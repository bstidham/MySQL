USE Util;

/*========================================================================================
Purpose:
Splits a string by a delimiter

Usage:

Notes:
Belongs in a table valued function
MySQL does not support table valued functions
Deadend

@s is expected to be incremented by the ItemNumber addition by the time it gets to the
SUBSTRING_INDEX usage line

Revision:
00 - 07/09/2018
   - Created
========================================================================================*/

SELECT @delim := ','
     , @in_string := 'Test, String, With, Commas'
;

SELECT @s := @s + 1 ItemNumber
     , SUBSTRING_INDEX(SUBSTRING_INDEX(p.in_string, p.delim, @s), @delim, -1) Item
FROM (SELECT @in_string in_string
           , @delim delim
           , @s := 0) p
CROSS JOIN (
	SELECT 1 N UNION ALL
	SELECT ut.N
	FROM (SELECT @in_string in_string
	           , @delim delim) p
	JOIN UTIL_Tally ut
	    ON  ut.N <= LENGTH(p.in_string)
	    AND SUBSTRING(p.in_string, ut.N, 1) = p.delim
) d
;
