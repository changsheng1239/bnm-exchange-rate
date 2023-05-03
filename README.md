# bnm-exchange-rate

This repo stored all the historical exchange rates from [BNM](https://www.bnm.gov.my/exchange-rates).

The exchange rates consists of:

1. Three sessions daily: `0900`, `1200`, `1700`.
2. Three rates each session: `buying`, `selling`, `middle`.

`data` directory structure:

```txt
data
|-- year
    |-- month
        |-- day
            |-- <session>.json
```

Example: `data/2023/05/03/0900.json`

```json
[
    {
        "currency_code": "USD",
        "unit": 1,
        "rate": {
            "date": "2023-05-03",
            "buying_rate": 4.457,
            "selling_rate": 4.462,
            "middle_rate": 4.4595
        }
    },
    {
        "currency_code": "TWD",
        "unit": 100,
        "rate": {
            "date": "2023-05-03",
            "buying_rate": 14.4656,
            "selling_rate": 14.4903,
            "middle_rate": 14.478
        }
    },
  ...
]
```

## Latest Exchange Rate

Official API Endpoint from BNM: [here](https://apikijangportal.bnm.gov.my/openapi?category=Rates%20and%20Volumes)

Github Action had been setup to retrieve latest exchange rate daily at `0930`, `1230` and `1730` daily.
