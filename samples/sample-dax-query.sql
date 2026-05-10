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
