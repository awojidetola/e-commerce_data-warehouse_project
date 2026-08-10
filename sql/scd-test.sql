
-- Are there people who have changed countries within the dataset period? -- Yes 13

SELECT
    COUNT(*) AS customers_with_multiple_countries
FROM (
    SELECT `f0_`
    FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
    WHERE `f0_` IS NOT NULL
    GROUP BY `f0_`
    HAVING COUNT(DISTINCT Country) > 1
);
