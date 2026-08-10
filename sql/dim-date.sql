
CREATE OR REPLACE TABLE
`uci-online-retail-501604.OnlineRetail2Years.dim_date`
AS

SELECT

    ROW_NUMBER() OVER (
        ORDER BY InvoiceDate
    ) AS DateKey,

    InvoiceDate,

    order_year,
    order_quarter,
    order_month,
    order_month_name,
    order_week,
    order_day,
    order_day_name,
    order_hour

FROM (

    SELECT DISTINCT

        InvoiceDate,

        order_year,
        order_quarter,
        order_month,
        order_month_name,
        order_week,
        order_day,
        order_day_name,
        order_hour

    FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`

);
