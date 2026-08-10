CREATE OR REPLACE TABLE
`uci-online-retail-501604.OnlineRetail2Years.fact_sales`
AS

SELECT

    c.CustomerKey,
    d.DateKey,
    cat.CategoryKey,

    s.Invoice,

    s.Quantity,
    s.Price AS UnitPrice,
    s.Revenue,

    s.is_cancelled

FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` s

LEFT JOIN `uci-online-retail-501604.OnlineRetail2Years.dim_customer` c
    ON s.f0_ = c.CustomerID

LEFT JOIN `uci-online-retail-501604.OnlineRetail2Years.dim_date` d
    ON s.InvoiceDate = d.InvoiceDate

LEFT JOIN `uci-online-retail-501604.OnlineRetail2Years.dim_product` cat
    ON s.top_level_category = cat.top_level_category
    AND s.subcategory = cat.subcategory;
