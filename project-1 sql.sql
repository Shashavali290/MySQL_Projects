-- Q1.Create new schema as ecommerce 
CREATE SCHEMA  ecomers;
USE ecomers;
select* from one;


-- Q3.Run SQL command to see the structure of table 
DESC users_data;

-- Q4.Run SQL command to select first 100 rows of the database

SELECT * FROM users_data LIMIT  100;

-- Q5.How many distinct values exist in table for field country and language
use ecomers;
select * from users_data;
SELECT DISTINCT country,language FROM users_data;

-- Q6.Check whether male users are having maximum followers or female users.

SELECT 'Male Users',SUM(socialNBFollowers) Followers  FROM users_data WHERE gender = 'M' UNION 
SELECT 'Female User', SUM(socialNBFollowers) FROM users_data WHERE gender = 'F';

-- Q7.Calculate the total users those 1.Uses Profile Picture in their Profile 2.Uses Application for Ecommerce platform 3.Uses Android app 4.Uses ios app

SELECT 'Uses Profile Picture in their Profile' Parameters,COUNT(*) USERS  FROM users_data WHERE hasProfilePicture = 'TRUE' UNION 
SELECT 'Uses Application for Ecommerce platform',COUNT(*)  FROM users_data WHERE hasAnyApp = 'TRUE' UNION
SELECT 'Uses Android app',COUNT(*) FROM users_data WHERE hasAndroidApp = 'TRUE' UNION
SELECT 'Uses ios app',COUNT(*) FROM users_data WHERE hasIosApp = 'TRUE';

-- Q8.Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. (Hint: consider only those users having at least 1 product bought.)

SELECT SUM(productsBought)number_of_buyers ,country FROM users_data WHERE  productsBought <> 0 GROUP BY country ORDER BY SUM(productsBought) DESC;

-- Q9.Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. (Hint: consider only those users having at least 1 product sold.)

SELECT SUM(productsSold)number_of_buyers ,country FROM users_data WHERE  productsSold <> 0 GROUP BY country ORDER BY SUM(productsSold) ASC;

-- Q10.Display name of top 10 countries having maximum products pass rate.

SELECT country,SUM(productsPassRate) FROM  users_data GROUP BY country  ORDER BY SUM(productsPassRate) DESC  LIMIT 10;

-- Q11.Calculate the number of users on an ecommerce platform for different language choices.

SELECT language,COUNT(identifierHash) Users FROM  users_data GROUP BY language;

-- Q12.Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. (Hint: use UNION to answer this question.)

SELECT 'F'GENDER,' Product wish'Product, SUM(productsWished) Sum FROM users_data WHERE gender ='F'  UNION 
SELECT 'F ','Product Like' ,SUM(socialProductsLiked) FROM users_data WHERE gender ='F';

-- Q13.Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)

SELECT 'M' ,'Product Sell',SUM(productsSold) FROM users_data WHERE gender ='M' UNION
SELECT 'M' ,'Product Bought',SUM(productsBought) FROM users_data WHERE gender ='M';

-- Q14.Which country is having maximum number of buyers?

SELECT country,SUM(productsBought) FROM users_data GROUP BY country ORDER BY SUM(productsBought) DESC;

-- Q15.List the name of 10 countries having zero number of sellers.

SELECT country,productsSold FROM users_data WHERE productsSold = 0 LIMIT 10;

-- Q16.Display record of top 110 users who have used ecommerce platform recently.

SELECT identifierHash,daysSinceLastLogin FROM users_data ORDER BY daysSinceLastLogin ASC LIMIT 110;

-- Q17.Calculate the number of female users those who have not logged in since last 100 days.

SELECT identifierHash, gender,COUNT(daysSinceLastLogin) FROM users_data WHERE gender ='F' AND daysSinceLastLogin >100 GROUP BY gender ;

-- Q18.Display the number of female users of each country at ecommerce platform.

SELECT country,COUNT(*) FROM users_data WHERE gender ='F' GROUP BY country ORDER BY country;

-- Q19.Display the number of male users of each country at ecommerce platform.

SELECT country,COUNT(*) FROM users_data WHERE gender ='M' GROUP BY country ORDER BY country;

-- Q20.Calculate the average number of products sold and bought on ecommerce platform by male users for each country.

SELECT country,AVG(productsSold),AVG(productsBought) FROM users_data WHERE gender ='M' GROUP BY country;   