# Shamsi to Gregorian Date Conversion (SQL Server)

## Problem
Many business databases store Persian (Shamsi) dates as separate year, month, and day integers.
SQL Server does not provide a built-in Shamsi to Gregorian conversion function.

## Solution
This project provides a reusable SQL Server scalar function that converts a Shamsi date
(Year, Month, Day) into a Gregorian DATE using a fixed calendar anchor.

## Assumptions
- Calendar anchor: 1400/01/01 (Shamsi) = 2021-03-21 (Gregorian)
- Leap years are approximated for business use cases
- Designed for reporting, payroll, and administrative systems

## Usage Example
```sql
SELECT dbo.ConvertShamsiToGregorian(1402, 1, 1);
