-- Basic tests
SELECT dbo.ConvertShamsiToGregorian(1400,1,1)  AS Expected_2021_03_21;
SELECT dbo.ConvertShamsiToGregorian(1401,1,1)  AS Expected_2022_03_21;
SELECT dbo.ConvertShamsiToGregorian(1402,1,1)  AS Expected_2023_03_21;

-- End of year
SELECT dbo.ConvertShamsiToGregorian(1399,12,29);
SELECT dbo.ConvertShamsiToGregorian(1399,12,30);

-- Short year input
SELECT dbo.ConvertShamsiToGregorian(99,1,1);
