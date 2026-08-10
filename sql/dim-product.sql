CREATE OR REPLACE TABLE
`uci-online-retail-501604.OnlineRetail2Years.dim_category`
AS

SELECT
    ROW_NUMBER() OVER (
        ORDER BY top_level_category, subcategory
    ) AS CategoryKey,

    top_level_category,
    subcategory

FROM (

    SELECT DISTINCT
        top_level_category,
        subcategory

    FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`

);