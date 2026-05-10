# Power BI Paginated Excel Export Solution

Enterprise-style reporting solution built with **Power BI**, **semantic models**, and **paginated reports** to deliver clean, structured, Excel-friendly exports for operational reporting.

## Project Overview
This project demonstrates how to build a governed reporting workflow that combines:

- **ODBC database connectivity**
- **Power BI semantic model design**
- **interactive dashboard reporting**
- **paginated report exports**
- **Excel-safe output formatting**

The solution addresses a common business problem: standard Power BI exports are often not sufficient for operational reporting where users need structured, reusable, and properly formatted Excel outputs.

## Business Value
This solution improves reporting operations by:

- reducing manual spreadsheet cleanup
- producing consistent export structures
- preserving numeric and date formatting
- centralizing business logic in a semantic model
- avoiding direct end-user access to source systems

## Architecture
**ODBC Database → Power BI Semantic Model → Interactive Dashboard → Dynamic Export Button → Paginated Report → Structured Excel Export**

![Architecture Diagram](images/architecture-diagram.png)

*Figure: End-to-end workflow for delivering structured Excel exports from Power BI.*

## Key Components

### 1. ODBC Connection Setup
Data is sourced from a database through an ODBC connection and imported into Power BI for modeling.

![ODBC Setup](images/odbc-setup.png)

### 2. Power BI Semantic Model
A star schema model with fact and dimension tables supports both analytics and export use cases.

![Semantic Model](images/semantic-model.png)

### 3. Dashboard Design
Users interact with a Power BI dashboard that includes slicers, business visuals, and an export action.

![Dashboard Overview](images/dashboard-overview.png)

### 4. Paginated Report Export
A paginated report connected to the semantic model delivers clean tabular output optimized for Excel.

![Paginated Report Setup](images/paginated-report-setup.png)

### 5. Excel Output Validation
The exported file is validated to ensure correct formatting and usability.

![Excel Export Example](images/excel-export-example.png)

## Technical Highlights
- semantic model design using a star schema
- fact and dimension table relationships
- DAX query development for export datasets
- paginated report parameter setup
- Excel export testing and validation
- Power BI Service deployment

## Skills Demonstrated

### Technical
- Power BI
- Power BI Service
- Power BI Report Builder
- DAX
- data modeling
- semantic models
- paginated reporting
- ODBC connectivity
- Excel export optimization

### Business / Delivery
- requirements translation
- operational reporting design
- report governance
- technical documentation
- solution architecture communication

## Sample DAX Query
```DAX
EVALUATE

SELECTCOLUMNS(

    SUMMARIZECOLUMNS(

        DimDate[Year],
        DimDate[Month Short],

        DimClient[ClientID],
        DimClient[ClientName],
        DimClient[Status],

        DimFee[FeeID],

        "UnitPrice", AVERAGE(FactBilling[UnitPrice]),
        "TotalUnits", SUM(FactBilling[Units]),
        "TotalAmount", SUM(FactBilling[Amount])

    ),

    "Year", DimDate[Year],
    "Month", DimDate[Month Short],
    "ClientID", DimClient[ClientID],
    "ClientName", DimClient[ClientName],
    "Status", DimClient[Status],
    "FeeID", DimFee[FeeID],
    "TotalUnits", [TotalUnits],
    "TotalAmount", [TotalAmount],
    "UnitPrice", [UnitPrice]

)
```

## Documentation
For the full technical walkthrough, see:

- [Technical Documentation](docs/technical-documentation.md)

## Image Notes
Store screenshots in the `images/` folder using clear filenames such as:

- `architecture-diagram.png`
- `odbc-setup.png`
- `semantic-model.png`
- `dashboard-overview.png`
- `export-button.png`
- `paginated-report-setup.png`
- `parameter-setup.png`
- `excel-export-example.png`
- `service-deployment.png`

## Repository Structure
```text
powerbi-paginated-excel-export/
├── README.md
├── docs/
│   └── technical-documentation.md
├── images/
│   ├── README.md
│   └── .gitkeep
└── samples/
    └── sample-dax-query.sql
```
