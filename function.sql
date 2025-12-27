CREATE FUNCTION dbo.ConvertShamsiToGregorian
(
    @ShYear  INT,
    @ShMonth INT,
    @ShDay   INT
)
RETURNS DATE
AS
BEGIN
    DECLARE 
        @DaysFromEpoch INT,
        @GregorianDate DATE;

    -- Convert short year (e.g. 99 -> 1399)
    IF @ShYear < 100
        SET @ShYear = @ShYear + 1300;

    -- Calculate days passed in the current Shamsi year
    SET @DaysFromEpoch =
        CASE 
            WHEN @ShMonth <= 6
                THEN (@ShMonth - 1) * 31
            ELSE 6 * 31 + (@ShMonth - 7) * 30
        END
        + @ShDay - 1;

    -- Add days from previous years (business-level leap year approximation)
    SET @DaysFromEpoch =
        @DaysFromEpoch
        + (@ShYear - 1400) * 365
        + ((@ShYear - 1400 + 3) / 4);

    -- Calendar anchor: 1400-01-01 (Shamsi) = 2021-03-21 (Gregorian)
    SET @GregorianDate =
        DATEADD(DAY, @DaysFromEpoch, '2021-03-21');

    RETURN @GregorianDate;
END;
