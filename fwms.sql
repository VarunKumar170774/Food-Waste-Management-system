#Food Providers & Receivers
#1.How many food providers and receivers are there in each city?
SELECT COALESCE(p.City, r.City) AS City ,COUNT(DISTINCT p.Provider_ID) AS Provider_Count,
COUNT(DISTINCT r.Receiver_ID) AS Receiver_Count
FROM fwms.providers_data p
JOIN fwms.receivers_data r ON p.City = r.City
GROUP BY City
ORDER BY Provider_Count DESC, Receiver_Count DESC;

#2. Which type of food provider (restaurant, grocery store, etc.) contributes the most food?
SELECT p.Type AS Provider_Type,SUM(f.Quantity) AS Total_Quantity
FROM fwms.food_listings_data f
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
GROUP BY p.Type
ORDER BY Total_Quantity DESC
LIMIT 1;

#3. What is the contact information of food providers in a specific city?
SELECT Name,Contact
FROM fwms.providers_data
WHERE City = 'New Jessica';

#4. Which receivers have claimed the most food?
SELECT r.Name,SUM(f.Quantity) AS Total_Food_Claimed
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
JOIN fwms.receivers_data r ON c.Receiver_ID = r.Receiver_ID
GROUP BY r.Name
ORDER BY Total_Food_Claimed DESC
LIMIT 5;

#Food Listings & Availability
#5. What is the total quantity of food available from all providers?
SELECT SUM(Quantity) AS Total_Available_Food
FROM fwms.food_listings_data;

#6. Which city has the highest number of food listings?
SELECT p.City,COUNT(f.Food_ID) AS Total_Listings
FROM fwms.food_listings_data f
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
GROUP BY p.City
ORDER BY Total_Listings DESC
LIMIT 1;

#7. What are the most commonly available food types?
SELECT Food_Type,COUNT(*) AS Number_of_Listings
FROM fwms.food_listings_data
GROUP BY Food_Type
ORDER BY Number_of_Listings DESC
LIMIT 5;

#Claims & Distribution
#8. How many food claims have been made for each food item?
SELECT f.Food_Name,COUNT(c.Claim_ID) AS Number_of_Claims
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
GROUP BY f.Food_Name
ORDER BY Number_of_Claims DESC
LIMIT 5;

#9. Which provider has had the highest number of successful food claims?
SELECT p.Name,COUNT(c.Claim_ID) AS Successful_Claims_Count
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
WHERE c.Status = 'Completed'
GROUP BY p.Name
ORDER BY Successful_Claims_Count DESC
LIMIT 5;

#10. What percentage of food claims are completed vs. pending vs. canceled?
SELECT Status,COUNT(*) AS Claim_Count,(COUNT(*) * 100.0 / (SELECT COUNT(*) 
FROM fwms.claims_data)) AS Percentage
FROM fwms.claims_data
GROUP BY Status
ORDER BY Percentage DESC;

#Analysis & Insights
#11. What is the average quantity of food claimed per receiver?
SELECT r.Name AS Receiver_Name,AVG(f.Quantity) AS Average_Quantity_Claimed
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
JOIN
fwms.receivers_data r ON c.Receiver_ID = r.Receiver_ID
GROUP BY Receiver_Name
ORDER BY Average_Quantity_Claimed DESC
LIMIT 5;

#12. Which meal type (breakfast, lunch, dinner, snacks) is claimed the most?
SELECT f.Meal_Type,COUNT(c.Claim_ID) AS Claims_Count
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
GROUP BY f.Meal_Type
ORDER BY Claims_Count DESC
LIMIT 5;

#13. What is the total quantity of food donated by each provider?
SELECT p.Name AS Provider_Name,SUM(f.Quantity) AS Total_Quantity_Donated
FROM fwms.food_listings_data f
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
GROUP BY p.Name
ORDER BY Total_Quantity_Donated DESC
LIMIT 5;


-- CURD operations 
#14 insert
INSERT INTO fwms.providers_data (Provider_ID, Name, Type, Address, City, Contact)
VALUES (
1001, 
'New Community Kitchen',
'Community Kitchen',
'1234 Main St',
'New City',
'+1-111-222-3333');

#15update
UPDATE fwms.providers_data
SET Contact = '+1-999-888-7777'
WHERE Provider_ID = 1001;

#16 Delete
DELETE FROM fwms.providers_data
WHERE Provider_ID = 1001;

-- these the extra solution for the dataset food waste management system

#17-Which receivers have claimed food from the most different provider types?
SELECT r.Name AS Receiver_Name, COUNT(DISTINCT p.Type) AS Unique_Provider_Types
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
JOIN fwms.receivers_data r ON c.Receiver_ID = r.Receiver_ID
GROUP BY r.Name
ORDER BY Unique_Provider_Types DESC
LIMIT 5;

#18-Which food providers have the most cancelled claims?

SELECT p.Name AS Provider_Name, COUNT(c.Claim_ID) AS Cancelled_Claims
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
WHERE c.Status = 'Cancelled'
GROUP BY p.Name
ORDER BY Cancelled_Claims DESC
LIMIT 5;

#19. What is the total quantity of food per food type?
SELECT Food_Type, SUM(Quantity) AS Total_Quantity
FROM fwms.food_listings_data
GROUP BY Food_Type
ORDER BY Total_Quantity DESC;

#20. How many claims were made for each meal type?
SELECT f.Meal_Type, COUNT(c.Claim_ID) AS Claims_Count
FROM fwms.claims_data c
JOIN fwms.food_listings_data f ON c.Food_ID = f.Food_ID
GROUP BY f.Meal_Type
ORDER BY Claims_Count DESC;

 #21. Which cities have a higher number of receivers than providers?
 SELECT City, Receiver_Count
FROM (SELECT
        COALESCE(p.City, r.City) AS City,
        COUNT(DISTINCT p.Provider_ID) AS Provider_Count,
        COUNT(DISTINCT r.Receiver_ID) AS Receiver_Count
    FROM
        fwms.providers_data p
	JOIN
        fwms.receivers_data r ON p.City = r.City
    GROUP BY
        City
) AS CityCounts
WHERE Receiver_Count > Provider_Count
ORDER BY Receiver_Count DESC;

#22. What is the average quantity of food per provider type?

SELECT p.Type AS Provider_Type,AVG(f.Quantity) AS Average_Quantity
FROM fwms.food_listings_data f
JOIN fwms.providers_data p ON f.Provider_ID = p.Provider_ID
GROUP BY p.Type
ORDER BY Average_Quantity DESC;