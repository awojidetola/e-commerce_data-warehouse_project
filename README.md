# Online Retail Data Warehouse

## Project Overview

This project extends a previous data cleaning and exploratory analysis project by designing and implementing a dimensional data warehouse for an online retail dataset containing over 1 million transaction records.

The objective was to transform a denormalised transactional dataset into a star schema that supports analytical reporting, business intelligence, and scalable querying.

The project focuses on dimensional modelling concepts including:

- Fact and dimension table design
- Surrogate and business keys
- Degenerate dimensions
- Dimensional hierarchies
- Slowly Changing Dimension (SCD) considerations
- Star schema implementation in BigQuery

---

## Source Dataset

**Dataset:** Online Retail Dataset (UCI Machine Learning Repository)

The source data contains transaction-level information including:

- Customer information
- Product information
- Order information
- Revenue metrics
- Transaction timestamps

The original dataset consists of over 1 million records spanning approximately two years of online retail activity.

---

## Data Preparation

Prior to warehouse design, the dataset underwent a separate cleaning and transformation process.

The cleaning project included:

- Missing value handling
- Data type standardisation
- Revenue calculations
- Invoice cancellation identification
- Product categorisation
- Date component extraction
- Creation of analytical fields used throughout the warehouse

The cleaned dataset produced during that project serves as the source for this warehouse implementation.

For details of the cleaning process, see:

**[Data Cleaning Project](INSERT_LINK_HERE)**

---

## Dimensional Model

A star schema was implemented consisting of:

### Fact Table

**FactSales**

Measures:

- Revenue
- Quantity
- UnitPrice

Degenerate Dimension:

- InvoiceNo

Foreign Keys:

- CustomerKey
- ProductKey
- DateKey

---

### Dimension Tables

#### DimCustomer

Attributes:

- CustomerKey (Surrogate Key)
- CustomerID (Business Key)
- Country

#### DimProduct

Attributes:

- ProductKey
- StockCode
- Description
- TopLevelCategory
- Subcategory

#### DimDate

Attributes:

- DateKey
- InvoiceDate
- OrderYear
- OrderQuarter
- OrderMonth
- OrderMonthName
- OrderWeek
- OrderDay
- OrderDayName
- OrderHour

---

## Star Schema

![Star Schema](images/star_schema.png)

---

## Design Decisions

### Surrogate Keys

Surrogate keys were introduced for all dimensions to create stable relationships between dimensions and the fact table.

### Business Keys

Business identifiers such as:

- CustomerID
- StockCode

were retained within dimensions for business reporting and traceability.

### Degenerate Dimension

InvoiceNo was retained directly within the fact table as a degenerate dimension because it represents a transactional identifier without additional descriptive attributes.

### Customer Country Investigation

During modelling, an investigation revealed that 13 customers appeared with multiple countries within the dataset period.

Source documentation defines Country as:

> The country where each customer resides.

This raised a Slowly Changing Dimension discussion regarding customer location history.

The project documents this observation and its implications for dimensional modelling, although a full SCD Type 2 implementation was not required for the analytical objectives of this project.

---

## Business Analysis

The warehouse supports analyses including:

- Customer revenue analysis
- Product performance analysis
- Sales trend analysis
- Pareto (80/20) customer analysis
- Category performance analysis

Example analytical queries can be found in the `/analysis` folder.

---

## Project Structure

```text
.
├── README.md
├── sql/
│   ├── 01_dim_customer.sql
│   ├── 02_dim_product.sql
│   ├── 03_dim_date.sql
│   └── 04_fact_sales.sql
│
├── analysis/
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   ├── sales_analysis.sql
│   └── pareto_analysis.sql
│
├── documentation/
│   ├── dimensional_modelling_decisions.md
│   └── source_data_overview.md
│
└── images/
    └── star_schema.png
```

---

## Key Learnings

This project provided practical experience with:

- Dimensional modelling
- Star schema design
- Fact and dimension identification
- Surrogate key implementation
- Business key preservation
- Degenerate dimensions
- Slowly Changing Dimension considerations
- Data warehouse design in BigQuery

---

## Tools Used

- Google BigQuery
- SQL
- Draw.io
- GitHub
