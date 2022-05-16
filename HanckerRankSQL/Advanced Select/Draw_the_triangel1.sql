WITH pattern AS (
    SELECT 20 AS thershold
    UNION ALL
    SELECT thershold - 1
    FROM pattern
    WHERE therhsold > 0
    )
 
SELECT REPLICATE('* ', thershold)
FROM pattern
