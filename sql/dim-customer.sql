CREATE OR REPLACE TABLE
`uci-online-retail-501604.OnlineRetail2Years.dim_customer`
AS

SELECT
    ROW_NUMBER() OVER (
        ORDER BY CustomerID, Country
    ) AS CustomerKey,

    CustomerID,
    Country

FROM (

    SELECT DISTINCT
        `f0_` AS CustomerID,
        Country

    FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`

    WHERE `f0_` IS NOT NULL

);